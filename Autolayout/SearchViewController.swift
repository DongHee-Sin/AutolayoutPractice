//
//  SeachViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/11.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    
    // 최근검색어 버튼들
    @IBOutlet weak var recentSearchStackView: UIStackView!
    // 로켓프레시 버튼들
    @IBOutlet weak var rocketFreshStackView: UIStackView!
    // 추천 검색어 버튼들
    @IBOutlet weak var recommendedSearchWordStackView: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.becomeFirstResponder()
        
        
        // 최근검색어 버튼들 속성 지정
        for eachButton in recentSearchStackView.subviews as! [UIButton] {
            settingButton(button: eachButton)
        }
        
        // 로켓프레시 버튼들 속성 지정
        for eachButton in rocketFreshStackView.subviews as! [UIButton] {
            eachButton.layer.cornerRadius = 20
            eachButton.layer.backgroundColor = UIColor(red:229/255, green:246/255, blue:229/255, alpha: 1).cgColor
            eachButton.setTitleColor(UIColor(red:58/255, green:149/255, blue:58/255, alpha: 1), for: .normal)
        }
        
        // 추천 검색어 버튼들 속성 지정
        for eachStackView in recommendedSearchWordStackView.subviews as! [UIStackView] {
            for eachButton in eachStackView.subviews as! [UIButton] {
                
                
                settingButton(button: eachButton)
            }
        }
    }
    
    func settingButton(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        button.layer.cornerRadius = 20
    }
}
