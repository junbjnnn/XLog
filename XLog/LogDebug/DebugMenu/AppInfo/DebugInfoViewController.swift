//
//  DebugInfoViewController.swift
//  XLog
//
//  Created by NamDV on 9/7/20.
//  Copyright © 2020 NamDV. All rights reserved.
//

import Foundation
import UIKit

final class DebugInfoViewController: UIViewController {
    
    @IBOutlet private weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        infoTextView.text = getAppInfo()
    }
    
    func setupNavigation() {
        navigationItem.title = "~ App Info ~"
    }
    
    func getAppInfo() -> String {
        var info = ""
        info += "- Device Name : \(UIDevice.current.name)\n"
        info += "- MODEL : \(UIDevice.current.model)\n"
        info += "- Environment : \(LoggerHelper.environment)\n"
        info += "- UUID : \(LoggerHelper.uuidString)\n"
        if let dict = Bundle.main.infoDictionary {
            if let version = dict["CFBundleShortVersionString"] as? String,
                let bundleVersion = dict["CFBundleVersion"] as? String,
                let appName = dict["CFBundleName"] as? String {
                info += "- App Name : \(appName)\n"
                info += "- Version : \(version) (Build : \(bundleVersion))\n"
                info += "- Sub System : \(Bundle.main.bundleIdentifier ?? "?")\n"
            }
            
            if let commit = dict["BuildTime"] as? String {
                info += "- Build GIT INFO : \(commit)"
            }
        }
        
        return info
    }
    
}