//
//  Enums.swift
//  LocalAuth-GettingStarted
//
//  Created by Glenn Ludszuweit on 11/05/2023.
//

import Foundation

enum BiometricType {
    case none
    case face
    case touch
}

enum AuthError {
    case noTouch
    case noFace
    case invalid
    case denied
    case biometricError
}

extension AuthError: LocalizedError, Identifiable {
    var id: String {
        return self.localizedDescription
    }
    
    var description: String? {
        switch self {
        case .noTouch:
            return NSLocalizedString("noTouch", comment: "noTouch")
        case .noFace:
            return NSLocalizedString("noFace", comment: "noFace")
        case .invalid:
            return NSLocalizedString("invalid", comment: "invalid")
        case .denied:
            return NSLocalizedString("denied", comment: "denied")
        case .biometricError:
            return NSLocalizedString("biometricError", comment: "biometricError")
        }
    }
}
