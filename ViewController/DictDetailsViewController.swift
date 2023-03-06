//
//  DictDetailsViewController.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 09/01/2023.
//

import Foundation
import UIKit
import WebKit
class DictDetailsViewController: UIViewController {
    
    @IBOutlet var lblWord: UILabel!
    @IBOutlet var lblDetail: UILabel!
    
    @IBOutlet var wkWebview: WKWebView!
    
    
    var detailWord: String = ""
    var detailDetail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWord.text = detailWord
        
        let header = """
                <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
                    <style>
                        body {
                            font-family: "Avenir";
                            font-size: 20px;
                        }
                    </style>
                </head>
                <body>
                """
        wkWebview.loadHTMLString(header + detailDetail + "</body>", baseURL: nil)
        
    }
    
    
    @IBAction func back(_ sender: UIButton) {
        let back = self.storyboard?.instantiateViewController(withIdentifier: "DictSearchViewController") as! DictSearchViewController
        self.navigationController?.pushViewController(back, animated: true)
        
//        navigationController?.popViewController(animated: true)
    }
    
    
    
}
