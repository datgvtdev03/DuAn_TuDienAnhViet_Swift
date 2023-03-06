//
//  DictTableViewCell.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 08/01/2023.
//

import UIKit

class DictTableViewCell: UITableViewCell {
    var saveArrDict: edicts = []
    
    
    @IBOutlet var lblNameSearch: UILabel!
    @IBOutlet var lblResult: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func btnNote(_ sender: UIButton) {
        
        
        
    }
    
    
    
    
    
}
