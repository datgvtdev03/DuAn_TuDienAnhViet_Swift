//
//  demo.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 10/01/2023.
//

import Foundation
import Alamofire
import UIKit
class demo: UIViewController {
    var dataDict: edicts = []
    
    
    @IBOutlet var tbl: UITableView!
    
    
    @IBOutlet var lblDetail: UILabel!
    @IBOutlet var lblword: UILabel!
    
    @IBOutlet var txt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.dataSource = self
        tbl.delegate = self
        
        let nib = UINib(nibName: "DictTableViewCell", bundle: nil)
        tbl.register(nib, forCellReuseIdentifier: "cell")
        
//        getDataFromAPI()
    }
    
    func getFromAPI() {
        let txt = txt.text!
        APIHandler.init().searchEN(word: txt) {
            responseData in
            DispatchQueue.main.async {
                print("demo", responseData)
                self.dataDict = responseData
                self.tbl.reloadData()
            }
        }
    }
    
    @IBAction func btn(_ sender: Any) {
        getFromAPI()
    }
}
extension demo: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDict.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DictTableViewCell
        let currentDict = dataDict[indexPath.row]
            cell.lblNameSearch.text = currentDict.word
            cell.lblResult.text = currentDict.detail
        return cell
    }
    
    
}
