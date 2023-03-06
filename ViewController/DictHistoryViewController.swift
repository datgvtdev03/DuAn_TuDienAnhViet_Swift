//
//  DictHistoryViewController.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 07/01/2023.
//

import Foundation
import UIKit
class DictHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblDict: UITableView!
    @IBOutlet var segmentCtl: UISegmentedControl!
    
    let deFaultDict = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDict.delegate = self
        tblDict.dataSource = self
        
        let nib = UINib(nibName: "DictTableViewCell", bundle: nil)
        tblDict.register(nib, forCellReuseIdentifier: "cell")
        segnment()
        
        getDictDataSelectedRow()
        
    }
    
    lazy var rowsToDisplay = dataHistory
    
    
    func segnment() {
        segmentCtl.selectedSegmentIndex = 0
        segmentCtl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
    }
    
    //userdefault
    func getDictDataSelectedRow() {
        if let dictData = UserDefaults.standard.value(forKey: "data") as? Data {
            dataHistory = try! PropertyListDecoder().decode(edicts.self, from: dictData)
            print("sdsd: ", dataHistory.count)
        }
    }
    
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"DictSearchViewController") as! DictSearchViewController
        vc .modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
    }
    
    @objc fileprivate func handleSegmentChange() {
        switch segmentCtl.selectedSegmentIndex {
        case 0 :
            rowsToDisplay = dataHistory
        case 1:
            rowsToDisplay = dataHistory
        default:
            rowsToDisplay = dataHistory
        }
        tblDict.reloadData()
        
    }
    
  
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDict.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DictTableViewCell
        let currentDict = rowsToDisplay[indexPath.row]
        cell.lblNameSearch?.text=currentDict.word
        cell.lblResult?.text=currentDict.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"DictDetailsViewController") as! DictDetailsViewController
        vc.detailWord = rowsToDisplay[indexPath.row].word
        vc.detailDetail = rowsToDisplay[indexPath.row].detail
        present(vc,animated: true)
        
    }
    
}



