//
//  DetailsViewController.swift
//  CeloDemo
//
//  Created by Crunchyiee on 2/02/20.
//  Copyright © 2020 Maharjan Suman. All rights reserved.
//

import UIKit
import Foundation

class DetailsViewController : UIViewController{
    
    @IBOutlet weak var profileimgview: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var gender_lbl: UILabel!
    @IBOutlet weak var dob_lbl: UILabel!
    
    var user:[String:Any]?
    var filtered:Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vl = user?["profileimg"] {
        let profileimg = URL(string: "\((user!["profileimg"])!)")
        profileimgview.sd_setImage(with: profileimg, completed: nil)
        
        name_lbl.text = "\((user!["title"])!) \((user!["f_name"])!) \((user!["l_name"])!)"
        
        gender_lbl.text = "\((user!["gender"])!)"
        
        dob_lbl.text = "\(user!["dob"] ?? "")"
        }
        else{
            let profileimg = URL(string: filtered!.profileimg)
            profileimgview.sd_setImage(with: profileimg, completed: nil)
            
            name_lbl.text = "\(filtered!.title) \(filtered!.f_name) \(filtered!.l_name)"
            
            gender_lbl.text = filtered?.gender
            
            dob_lbl.text = filtered?.dob
        }
    }
    
}
