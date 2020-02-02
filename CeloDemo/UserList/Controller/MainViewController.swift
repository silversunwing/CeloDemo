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
            userdb = DBHandler.sharedInstance.fetchData()
        }
        else{
            APIHandler.sharedInstance.fetchData(10) { (Code,db) in
                for val in db{
                    
                    let img = val["picture"] as? [String:String]
                    let thumbimg = "\((img!["thumbnail"])!)"
                    let profileimg = "\((img!["large"])!)"
                    
                    let nm = val["name"] as? [String:String]
                    let title = "\((nm!["title"])!)"
                    let fname = "\((nm!["first"])!)"
                    let lname = "\((nm!["last"])!)"
                    
                    let gen = "\((val["gender"])!)"
                    
                    let dob = val["dob"] as? [String:Any]
                    let date = "\((dob!["date"])!)"
                    
                    let newdb = ["thumbimg":thumbimg,
                              "profileimg":profileimg,
                              "title":title,
                              "f_name":fname,
                              "l_name":lname,
                              "gender":gen,
                              "dob":date]
                    
                    DBHandler.sharedInstance.openDatabase(newdb: newdb)
                    self.userdb = DBHandler.sharedInstance.fetchData()
                    
                    UserDefaults.standard.setValue("fetched", forKey: "datafetch")
                    UserDefaults.standard.synchronize()
                }
                self.listTableView.reloadData()
            }
        }
        
        
    }
    
}

