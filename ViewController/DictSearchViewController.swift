//
//  DictHomeViewController.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 07/01/2023.
//

import Foundation
import UIKit
class DictSearchViewController: UIViewController {
   
    var dataDict: edicts = []
    
    var dataHistory: edicts = []

    
    
    
    @IBOutlet var searchBarDict: UISearchBar!
    
    @IBOutlet var tblDict: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDict.dataSource = self
        tblDict.delegate = self
        let nib = UINib(nibName: "DictTableViewCell", bundle: nil)
        tblDict.register(nib, forCellReuseIdentifier: "cell")
        searchBarDict.delegate = self


        
    }
    
    func getSearchFromAPI(txtSearch: String) {
        if(txtSearch == "") {
            return
        }
        APIHandler.init().searchEN(word: txtSearch) {
            responseData in
            DispatchQueue.main.async {
                self.dataDict = responseData
                self.tblDict.reloadData()
            }
        }
    }
    
    
}
extension DictSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDict.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DictTableViewCell
        let currentDict = dataDict[indexPath.row]
            cell.lblNameSearch.text = currentDict.word
            cell.lblResult.text = currentDict.detail
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"DictDetailsViewController") as! DictDetailsViewController
        vc.detailWord = dataDict[indexPath.row].word
        vc.detailDetail = dataDict[indexPath.row].detail
        vc .modalPresentationStyle = .overFullScreen
        present(vc,animated: true)

        if let dictData = UserDefaults.standard.value(forKey: "data") as? Data {
            dataHistory = try! PropertyListDecoder().decode(edicts.self, from: dictData)
//            dataHistory.forEach((e-> {
//               if e.word == dataDict[indexPath.row].word {
//                return
//               }
//                dataHistory.append(dataDict[indexPath.row])
//                UserDefaults.standard.set(try? PropertyListEncoder().encode(dataHistory), forKey: "data")
//            }))
        }

       
        

        self.tblDict.reloadData()
    }
    
    
    
}

extension DictSearchViewController: UISearchBarDelegate {
    
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //xet thoi gian delay call api
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(updateSearch(with:)), with: searchText, afterDelay: 0.3)
      tblDict.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        tblDict.reloadData()
    }
    
    @objc private func updateSearch(with text: String) {
        if text != "" {
            getSearchFromAPI(txtSearch: text)
            tblDict.reloadData()
        }
        
    }
    
    
    
    
}

