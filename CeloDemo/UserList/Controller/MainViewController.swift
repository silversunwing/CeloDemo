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
import SVProgressHUD

class MainViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var userdb:[[String:Any]] = []
    var usersDB = [Users]()
    var filteredUsers = [Users]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        listTableView.tableHeaderView = searchController.searchBar
        
        let usernib = UINib.init(nibName: UserCellReuseIdentifier, bundle: nil)
        self.listTableView.register(usernib, forCellReuseIdentifier: UserCellReuseIdentifier)
        
//        SVProgressHUD.show()
        if (user_fetched != nil) {
            userdb = DBHandler.sharedInstance.fetchData().0
            usersDB = DBHandler.sharedInstance.fetchData().1
            
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
                    self.userdb = DBHandler.sharedInstance.fetchData().0
                    self.usersDB = DBHandler.sharedInstance.fetchData().1
                    
                    UserDefaults.standard.setValue("fetched", forKey: "datafetch")
                    UserDefaults.standard.synchronize()
                }
//                SVProgressHUD.dismiss()
                self.listTableView.reloadData()
            }
        }
        
    }
    
    private func filterUsers(for searchText: String) {
      filteredUsers = usersDB.filter { usr in
        return usr.f_name.lowercased().contains(searchText.lowercased())
      }
      listTableView.reloadData()
    }
    
}

extension MainViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    filterUsers(for: searchController.searchBar.text ?? "")
  }
}
