//
//  BasketViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/12.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var recommendedProductButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendedProductButton.layer.borderWidth = 1
        recommendedProductButton.layer.borderColor = UIColor(red: 66/255, green: 160/255, blue: 249/255, alpha: 1).cgColor
        recommendedProductButton.layer.cornerRadius = 20
    }
    
}
