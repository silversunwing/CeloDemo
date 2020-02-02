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
        
        let thumbimg = URL(string: "\((userdb[indexPath.row]["thumbimg"])!)")
        cell.thumb_img.sd_setImage(with: thumbimg, completed: nil)
        
        cell.usr_name.text = "\((userdb[indexPath.row]["title"])!) \((userdb[indexPath.row]["f_name"])!) \((userdb[indexPath.row]["l_name"])!)"
        
        cell.usr_gender.text = "\((userdb[indexPath.row]["gender"])!)"
        
        cell.usr_dob.text = "\(userdb[indexPath.row]["dob"] ?? "")"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailsvc") as? DetailsViewController
        
        vc?.user = userdb[indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
