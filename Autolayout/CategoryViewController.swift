//
//  categoryViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/11.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var headerIconStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for eachView in headerIconStackView.subviews {
            eachView.layer.borderWidth = 1
            eachView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
            eachView.layer.masksToBounds = false
            eachView.layer.shadowColor = UIColor.gray.cgColor
            eachView.layer.shadowOffset = CGSize(width: 0, height: 5)
        }
    }
}
