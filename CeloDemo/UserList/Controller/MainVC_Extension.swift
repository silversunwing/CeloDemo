//
//  MainVC_Extension.swift
//  CeloDemo
//
//  Created by Crunchyiee on 2/02/20.
//  Copyright © 2020 Maharjan Suman. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdb.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.listTableView.dequeueReusableCell(withIdentifier: UserCellReuseIdentifier, for: indexPath) as! UserListCell
        
        let img = userdb[indexPath.row]["picture"] as? [String:String]
        let thumbimg = URL(string: "\((img?["thumbnail"])!)")
        cell.thumb_img.sd_setImage(with: thumbimg, completed: nil)
        
        let nm = userdb[indexPath.row]["name"] as? [String:String]
        cell.usr_name.text = "\((nm?["title"])!) \((nm?["first"])!) \((nm?["last"])!)"
        
        cell.usr_gender.text = "\((userdb[indexPath.row]["gender"])!)"
        
        let dob = userdb[indexPath.row]["dob"] as? [String:Any]
        cell.usr_dob.text = "\((dob?["date"])!)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
