//
//  ViewController.swift
//  Autolayout
//
//  Created by 신동희 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var commercialScrollView: UIScrollView!
    @IBOutlet weak var commercialPageControl: UIPageControl!
    
    // 메인 스크롤 광고
    var commercialImages: [String] = ["광고1", "광고2", "광고3", "광고4", "광고5"]
    var commercialImageViews = [UIImageView]()
    
    
    private func addContentScrollView() {
        for i in 0..<commercialImages.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: commercialScrollView.bounds.width, height: commercialScrollView.bounds.height)
            imageView.image = UIImage(named: commercialImages[i])
            commercialScrollView.addSubview(imageView)
            commercialScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    
    private func setPageControll() {
        commercialPageControl.numberOfPages = commercialImages.count
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        commercialPageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value: CGFloat = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인화면의 검색버튼 테두리 지정
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        searchButton.layer.cornerRadius = 7
        
        // 메인 스크롤 광고
        commercialScrollView.delegate = self
        addContentScrollView()
        setPageControll()
    }
}
