//
//  ViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 메인화면의 검색버튼 테두리 지정
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        searchButton.layer.cornerRadius = 7
    }
}
