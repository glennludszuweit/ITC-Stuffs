//
//  LoginView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI
import Security

struct User: Codable {
    var email: String
    var password: String
}

struct LoginView: View {
    let authViewModel = AuthViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var user = User(email: "", password: "")
    
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
            } catch {
                print("error")
            }
        } else {
            print("error")
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }.padding(10)
                    .textFieldStyle(.roundedBorder)
                
                Group {
                    Button(action: {
                        if authViewModel.validateAdminUser(email: email, pass: password) {
                            user.email = email
                            user.password = password
                            try? saveDataToKeychain(value: user, key: "user-info")
                        } else {
                            print("Invalid user!")
                        }
                    }, label: {
                        Text("Save to Keychain")
                            .frame(maxWidth: .infinity)
                    }).tint(.orange)
                    
                    Button(action: {
                        getDataFromKeychain(key: "user-info")
                    }, label: {
                        Text("Retrieve from Keychain")
                            .frame(maxWidth: .infinity)
                    }).tint(.cyan)
                }.padding(10)
                    .buttonStyle(.borderedProminent)
            }
            .padding()
            .padding(.top, 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
