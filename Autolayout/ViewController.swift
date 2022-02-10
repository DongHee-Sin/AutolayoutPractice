//
//  ViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    
    let segmentImageArray: [String] = ["고등어", "리모컨", "목살", "반건조", "주스"]
    
    @IBOutlet weak var goldBoxStackView: UIStackView!
    
    
    // 골드박스 Segment Controller
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print(0)
        case 1:
            print(1)
        default:
            print(2)
        }
    }
    
    func enterImageToStackView(_ stackView: UIStackView, segmentIndex: Int) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 메인화면의 검색버튼 테두리 지정
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        searchButton.layer.cornerRadius = 7
    }
}
