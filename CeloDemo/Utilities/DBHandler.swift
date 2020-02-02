//
//  DBHandler.swift
//  CeloDemo
//
//  Created by Crunchyiee on 2/02/20.
//  Copyright © 2020 Maharjan Suman. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class DBHandler{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext!
    
    static let sharedInstance : DBHandler = DBHandler()
       private init(){
           
       }
    
    func openDatabase(newdb:[String:String]){
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserDetails", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        saveData(UserDBOBJ:newUser,newdb: newdb)
    }
    
    func saveData(UserDBOBJ:NSManagedObject,newdb:[String:String])
    {
        UserDBOBJ.setValue(newdb["title"], forKey: "title")
        UserDBOBJ.setValue(newdb["f_name"], forKey: "f_name")
        UserDBOBJ.setValue(newdb["l_name"], forKey: "l_name")
        UserDBOBJ.setValue(newdb["gender"], forKey: "gender")
        UserDBOBJ.setValue(newdb["dob"], forKey: "dob")
        UserDBOBJ.setValue(newdb["thumbimg"], forKey: "thumbimg")
        UserDBOBJ.setValue(newdb["profileimg"], forKey: "profileimg")
        
        print("Storing...")
        do{
            try context.save()
        }catch{
            print("Strong Failed")
        }
    }
    
    func fetchData() -> [[String:String]]
    {
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserDetails", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        var fetcheddb:[[String:String]] = []
        print("Fetching...")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserDetails")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                if let vl = data.value(forKey: "title"){
                    let title = data.value(forKey: "title") as! String
                    let f_name = data.value(forKey: "f_name") as! String
                    let l_name = data.value(forKey: "l_name") as! String
                    let gender = data.value(forKey: "gender") as! String
                    let dob = data.value(forKey: "dob") as! String
                    let thumbimg = data.value(forKey: "thumbimg") as! String
                    let profileimg = data.value(forKey: "profileimg") as! String
                    
                    fetcheddb.append(["thumbimg":thumbimg,
                                      "profileimg":profileimg,
                                      "title":title,
                                      "f_name":f_name,
                                      "l_name":l_name,
                                      "gender":gender,
                                      "dob":dob])
                }
            }
        } catch {
            print("Fetching Failed")
        }
         return fetcheddb
    }
}
