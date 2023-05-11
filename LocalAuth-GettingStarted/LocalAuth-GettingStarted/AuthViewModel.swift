//
//  AuthViewModel.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 10/05/2023.
//

import Foundation
import Security
import SwiftUI
import LocalAuthentication

class AuthViewModel: ObservableObject {
    @Published var isUserInKC: Bool?
    @Published var credentials = Credentials()
    @Published var authError: AuthError?
    
//    init() {
//        getDataFromKeychain(key: "user-infor")
//    }
    
    func validateAdminUser(email: String?, pass: String?) -> Bool {
        guard email != nil else { return false }
        guard pass != nil else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let isEmailValid = emailPredicate.evaluate(with: email)
        let isPassValid = pass!.count >= 8
        
        if isEmailValid && isPassValid {
            return true
        } else {
            return false
        }
    }
    
    func biometricType() -> BiometricType {
        let authContext = LAContext()
        let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        switch authContext.biometryType {
        case .none:
            return .none
        case .touchID:
            return .touch
        case .faceID:
            return .face
        @unknown default:
            return .none
        }
    }
    
    func authenticateUser(email: String, password: String, completion: @escaping (Result<Credentials, AuthError>) -> ()) {
        let credentials = Credentials(email: email, password: password)
        let authContext = LAContext()
        var error: NSError?
        let canEval = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if let error = error {
            switch error.code {
            case -6:
                completion(.failure(.denied))
            case -7:
                if authContext.biometryType == .faceID {
                    completion(.failure(.noFace))
                } else {
                    completion(.failure(.noTouch))
                }
            default:
                completion(.failure(.biometricError))
            }
        }
        
        if canEval {
            if authContext.biometryType != .none {
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access Keychain") { success, error in
                    if error != nil {
                        completion(.failure(.biometricError))
                    } else {
                        self.credentials = credentials
                        completion(.success(credentials))
                    }
                }
            }
        }
    }
    
    func saveDataToKeychain (value: User, key: String) throws {
        let encoder = JSONEncoder()
        do {
            let userData = try encoder.encode(value)
            let dataDict: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: "com.ghl.keychain-gettingstarted",
                kSecAttrAccount as String: key,
                kSecValueData as String: userData
            ]
            let status = SecItemAdd(dataDict as CFDictionary, nil)
            if status == noErr {
                print("saved")
            } else{
                print("not working")
            }
        } catch let error {
            throw error
        }
    }
    
    func getDataFromKeychain(key: String) {
        let decoder = JSONDecoder()
        
        let dataDict: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrService as String: "com.ghl.keychain-gettingstarted",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status: OSStatus = SecItemCopyMatching(dataDict as CFDictionary, &result)
        
        if status == noErr , let data = result as? Data {
            do {
                let userData = try decoder.decode(User.self, from: data)
                print(userData.email)
                print(userData.password)
                isUserInKC = true
            } catch {
                print("error")
            }
        } else {
            print("error")
        }
    }
    
    func removeDataFromKeychain(key: String) {
        let dataDict: [String : Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrService as String: "com.ghl.keychain-gettingstarted",
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        
        let status = SecItemDelete(dataDict as CFDictionary)
        guard status == errSecSuccess else {
            print("Error removing item from keychain: \(status)")
            return
        }
        print("Successfully removed item from keychain")
    }
}
