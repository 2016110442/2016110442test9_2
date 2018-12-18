//
//  ViewController.swift
//  test9_2
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...4 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
    
        scrollView.contentSize = CGSize(width: 4 * scrollView.bounds.width, height: scrollView.bounds.height)
//        scrollView.minimumZoomScale = 0.2
//        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        
        pagecontrol.numberOfPages = 4
        pagecontrol.currentPage = 0
        pagecontrol.isUserInteractionEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pagecontrol.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
    }
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pagecontrol.currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    //    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return scrollView.subviews.first
//    }
}

