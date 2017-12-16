//
//  PageViewController.swift
//  Page View Project
//
//  Created by Remzi on 23/11/2017.
//  Copyright © 2017 Remzi. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var itemIndex = 0
    var timer = Timer()
    
    // lazy variable : initial value is not calculated until the first time it is used
    lazy var contentImages: [String] = {
        return getContentImages()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        createPageViewController()
        setupPageControl()
        //startPageViewAnimation()
    }
    
    func startPageViewAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    func stopPageViewAnimation() {
        timer.invalidate()
    }
    
    @objc func moveToNextPage (){
        itemIndex = itemIndex + 1
        
        if itemIndex >= contentImages.count {
            itemIndex = 0
        }
        let firstController = getItemController(itemIndex: itemIndex)!
        let startingViewControllers = [firstController]
        self.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getContentImages() -> [String] {
        var images = [String]()
        
        for x in 1...3 {
            images.append("image\(x).png")
        }
        
        return images
    }
    
    private func createPageViewController() {
        
        if contentImages.count > 0 {
            let firstController = getItemController(itemIndex: 0)!
            let startingViewControllers = [firstController]
            self.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
        
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        //appearance.backgroundColor = UIColor.darkGray
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemIndex: itemController.itemIndex - 1)
        }
        
        return getItemController(itemIndex: contentImages.count - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemIndex: itemController.itemIndex+1)
        }
        
        return getItemController(itemIndex: 0)
    }
    
    private func getItemController(itemIndex: Int) -> PageItemController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewController(withIdentifier: "ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            
            return pageItemController
        }
        
        return nil
    }
    
    
    // when implement presentationCount and presentationIndex method then Page Indicator will be visible
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

