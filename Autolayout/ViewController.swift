//
//  ViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/07.
//

import UIKit

extension UIStackView {
    
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}



class ViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    
    // 골드박스 segment 상품 이미지 (1: 오늘의 특가, 2: 프레시 득탬)
    let segmentImageArray: [Int: [String]] = [1: ["리모컨"], 2: ["고등어", "목살", "반건조", "주스"]]
    // 골드박스 상품 이미지가 들어갈 스택 뷰
    @IBOutlet weak var goldBoxStackView: UIStackView!
    
    
    // Image resize
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    // 골드박스 Segment Controller
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            enterImageToStackView(goldBoxStackView, segmentIndex: 1)
            enterImageToStackView(goldBoxStackView, segmentIndex: 2)
            goldBoxStackView.subviews.forEach({
                $0.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
            })
        case 1:
            enterImageToStackView(goldBoxStackView, segmentIndex: 1)
        default:
            enterImageToStackView(goldBoxStackView, segmentIndex: 2)
        }
    }
    
    func enterImageToStackView(_ stackView: UIStackView, segmentIndex: Int) {
        goldBoxStackView.removeAllArrangedSubviews()
        for  img in segmentImageArray[segmentIndex]! {
            stackView.addArrangedSubview(UIImageView(image: UIImage(named: "\(img).jpeg")))
        }
    }
    
    
    // 하단약관박스
    @IBOutlet weak var center: UILabel!
    @IBOutlet weak var companyNumber: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 메인화면의 검색버튼 테두리 지정
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        searchButton.layer.cornerRadius = 7
        
        
    }
}
