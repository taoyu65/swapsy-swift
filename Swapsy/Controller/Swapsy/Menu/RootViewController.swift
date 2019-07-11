//
//  RootViewController.swift
//  Swapsy
//
//  Created by Tao Yu on 6/26/19.
//  Copyright © 2019 Tao Yu. All rights reserved.
//

//import UIKit
import Foundation
import SideMenu

class RootViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
        
        let imageView = UIImageView(image: UIImage(named: "logo_swapsy"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        tableView.backgroundView = imageView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        cell.blurEffectStyle = SideMenuManager.default.menuBlurEffectStyle

        return cell
    }
}
