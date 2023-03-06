//
//  ViewController.swift
//  Từ điển Anh - Việt
//
//  Created by Thanh Dat on 06/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //chuyen man
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgLogo.center = view.center
        lblName.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.animation()
        }
    }
    
    func animation() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.width * 2
            let xpostion = size - self.view.frame.width
            let ypostion = self.view.frame.height - size
            self.imgLogo.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
            self.lblName.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
        })
    }


}

