//
//  MainViewController.swift
//  CeloDemo
//
//  Created by Crunchyiee on 2/02/20.
//  Copyright © 2020 Maharjan Suman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var userdb:[[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usernib = UINib.init(nibName: UserCellReuseIdentifier, bundle: nil)
        self.listTableView.register(usernib, forCellReuseIdentifier: UserCellReuseIdentifier)
        
        if (user_fetched != nil) {
            APIHandler.sharedInstance.fetchDB()
        }
        else{
            APIHandler.sharedInstance.fetchData(10) { (Code,db) in
                for val in db{
                    self.userdb.append(val)
                }
                self.listTableView.reloadData()
            }
        }
        
        
    }
    
}

