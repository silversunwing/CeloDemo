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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileimg = URL(string: "\((user!["profileimg"])!)")
        profileimgview.sd_setImage(with: profileimg, completed: nil)
        
        name_lbl.text = "\((user!["title"])!) \((user!["f_name"])!) \((user!["l_name"])!)"
        
        gender_lbl.text = "\((user!["gender"])!)"
        
        dob_lbl.text = "\(user!["dob"] ?? "")"
    }
    
}
