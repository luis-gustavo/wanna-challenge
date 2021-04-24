//
//  AppDelegate.swift
//  WannaChallenge
//
//  Created by luis.gustavo.jacinto on 21/04/21.
//

import Networking
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Init BetsViewController
        let viewController = BetsViewController(betProvider: BetProvider(service: LocalJSONBetService(fileName: "data")),
                                                imageProvider: ImageProvider(service: ImageService()))
        
        // Init window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

