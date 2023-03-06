//
//  DictDetailsViewController.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 09/01/2023.
//

import Foundation
import UIKit
class DictDetailsViewController: UIViewController {
    
    @IBOutlet var lblWord: UILabel!
    @IBOutlet var lblDetail: UILabel!
    
    @IBOutlet var webview: UIWebView!
    
    var detailWord: String = ""
    var detailDetail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWord.text = detailWord
        
        webview.loadHTMLString("<html><body><p>\(detailDetail)</p></body></html>", baseURL: nil)
    }
}
