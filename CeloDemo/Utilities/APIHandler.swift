//
//  APIHandler.swift
//  CeloDemo
//
//  Created by Crunchyiee on 2/02/20.
//  Copyright © 2020 Maharjan Suman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIHandler{
    
    static let sharedInstance : APIHandler = APIHandler()
    private init(){
        
    }
    
    func fetchDB(){
        
    }
    
    func fetchData(_ size:Int, withContextHandler contexthandler: @escaping (Int,[[String:Any]]) -> Void){
        let url = URL(string: userAPI)!
        for _ in 1...size{
            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseJson) in
                if let resp = responseJson.response{
                    switch responseJson.result {
                    case .success(let val):
                        let json = JSON(val)
                        if let result = json["results"].arrayObject as? [[String:Any]]{
                            contexthandler(0,[result[0]])
                        }
                    case .failure(let err):
                        print(resp.statusCode)
                        print(err.localizedDescription)
                        
                        if resp.statusCode == 503 {
                            self.fetchData(1){(code,dbase)  in
                               contexthandler(0,dbase)
                            }
                        }
                    }
                }
            }
        }
    }
    
}
