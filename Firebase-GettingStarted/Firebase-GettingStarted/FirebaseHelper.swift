//
//  Firebase.swift
//  Firebase-GettingStarted
//
//  Created by Glenn Ludszuweit on 03/05/2023.
//

import Foundation
import FirebaseAnalytics

class FirebaseHelper {
    static func analyticsGenerator(itemId: String, itemName: String, contentType: String) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: itemId,
          AnalyticsParameterItemName: itemName,
          AnalyticsParameterContentType: contentType,
        ])
    }
}
