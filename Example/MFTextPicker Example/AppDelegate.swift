//
//  AppDelegate.swift
//  MFTextPicker Example
//
//  Created by Mamun on 27/8/23.
//

import UIKit
import MFTextPicker

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if #available(iOS 15, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
        
        MFTextPicker.shared.defaultColor = .white
        MFTextPicker.shared.defaultTintColor = .black
        MFTextPicker.shared.defaultHighlightColor = .blue
        MFTextPicker.shared.defaultSeparatorColor = .green
        
        return true
    }



}

