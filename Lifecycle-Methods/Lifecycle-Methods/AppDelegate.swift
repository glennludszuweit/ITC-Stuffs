//
//  AppDelegate.swift
//  Lifecycle-Methods
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    /*
     This method is called when the application is launched and should be used to set up the app's initial state.
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    /*
     This method is called when the application becomes active, meaning that it is now running in the foreground and the user can interact with it.
     */
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Reactivate any tasks that were paused (or not yet started) when the app became inactive
    }
    
    /*
     This method is called when the application is about to become inactive, meaning that it is transitioning from an active state to a background state.
     */
    func applicationWillResignActive(_ application: UIApplication) {
        // Pause any tasks that shouldn't continue while the app is in the background
    }
    
    /*
     This method is called when the application enters the background state. At this point, the app is still running, but it is no longer visible to the user.
     */
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Save any unsaved changes and pause any non-critical tasks here
    }
    
    /*
     This method is called when the application is about to enter the foreground state. At this point, the app is transitioning from the background state back to the active state.
     */
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Resume any paused tasks that were previously running in the background
    }
    
    /*
     This method is called when the application is about to be terminated by the system. This can happen when the user force quits the app, or when the system needs to reclaim resources.
     */
    func applicationWillTerminate(_ application: UIApplication) {
        // Perform any final cleanup or saving of data here
    }
}

