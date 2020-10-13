//
//  DebugMenuViewController.swift
//  XLog
//
//  Created by NamDV on 8/25/20.
//  Copyright © 2020 NamDV. All rights reserved.
//

import Foundation
import UIKit

final class DebugMenuViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationItem.title = "~ Debug Menu ~"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

// MARK: Private
extension DebugMenuViewController {
    func value1Cell(withText text: String?, detailText: String?) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: "")
        cell.selectionStyle = .none
        cell.textLabel?.text = text
        cell.textLabel?.numberOfLines = 1
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.5
        cell.detailTextLabel?.text = detailText
        cell.detailTextLabel?.numberOfLines = 3
        cell.detailTextLabel?.minimumScaleFactor = 0.5
        cell.detailTextLabel?.lineBreakMode = .byCharWrapping
        return cell
    }
    
    func titleCell(withText text: String?, detailText: String?) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: "")
        cell.textLabel?.text = text
        cell.textLabel?.numberOfLines = 1
        cell.textLabel?.minimumScaleFactor = 0.5
        cell.textLabel?.lineBreakMode = .byCharWrapping
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.darkGray
        return cell
    }
    
    func switchCell(withText text: String?, isOn: Bool, selfAction: Selector) -> UITableViewCell {
        let cell = UITableViewCell(
            style: .value1,
            reuseIdentifier: "")
        
        let swt = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width - 60, y: 9, width: 51, height: 31))
        swt.isOn = isOn
        swt.addTarget(self, action: selfAction, for: .valueChanged)
        cell.contentView.addSubview(swt)
        cell.textLabel?.text = text
        
        return cell
    }
}