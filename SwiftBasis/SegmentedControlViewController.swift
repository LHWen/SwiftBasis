//
//  SegmentedControlViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class SegmentedControlViewController: UIViewController {
    
    var currentVC: UIViewController?
    
    lazy var oneVC: UIViewController = {
        let vc = SegmentedOneViewController()
        return vc
    }()
    lazy var twoVC: UIViewController = {
      let vc = SegmentedTwoViewController()
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let titleArr = ["one", "two"]
        let _segmentedControl = UISegmentedControl(items: titleArr)
        _segmentedControl.selectedSegmentIndex = 0
        _segmentedControl.tintColor = UIColor(red: 183/255.0, green: 222/255.0, blue: 232/255.0, alpha: 1.0)
        
        // 修改字体选中颜色
        let dict1 = NSDictionary(objects: [UIColor.black, UIFont.systemFont(ofSize: 12.0)], forKeys: [NSAttributedStringKey.foregroundColor as NSCopying, NSAttributedStringKey.font as NSCopying])
        _segmentedControl.setTitleTextAttributes((dict1 as! [AnyHashable : Any]), for: .selected)
        
        // 修改默认字体颜色
        let dict2 = NSDictionary(objects: [UIColor(red: 183/255.0, green: 222/255.0, blue: 232/255.0, alpha: 1.0),
                                        UIFont.systemFont(ofSize: 12.0)],
                                 forKeys: [NSAttributedStringKey.foregroundColor as NSCopying,
                                           NSAttributedStringKey.font as NSCopying])
        _segmentedControl.setTitleTextAttributes((dict2 as! [AnyHashable : Any]), for: .normal)
        
        _segmentedControl.addTarget(self, action: #selector(segmentValueChanged(sender:)), for: .valueChanged)
        _segmentedControl.frame = CGRect(x: 0, y: 0, width: 200, height: 28)
        self.navigationItem.titleView = _segmentedControl
        
//        self.oneVC = SegmentedOneViewController()
//        self.twoVC = SegmentedTwoViewController()
        
        // 加入默认页面
        self.addChildViewController(self.oneVC)
        self.view.addSubview(self.oneVC.view)
        // 通知子视图控制器已经被加入到父视图控制器中
        self.oneVC.didMove(toParentViewController: self)
        
        self.currentVC = self.oneVC
    }

    @objc func segmentValueChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.replaceViewController(oldVC: self.currentVC!, newVC: self.oneVC)
            break
        case 1:
            self.replaceViewController(oldVC: self.currentVC!, newVC: self.twoVC)
            break
            
        default:
            break
        }
    }
    
    func replaceViewController(oldVC: UIViewController, newVC: UIViewController) {

        self.addChildViewController(newVC)
        self.view.addSubview(newVC.view)
        
        self.transition(from: oldVC, to: newVC, duration: 0.0, options: UIViewAnimationOptions.allowAnimatedContent, animations: nil) { (finished: Bool) in
            if finished {
                newVC.didMove(toParentViewController: self)
                oldVC.willMove(toParentViewController: nil)
                oldVC.removeFromParentViewController()
//                oldVC.view.removeFromSuperview()
                self.currentVC = newVC
            } else {
                self.currentVC = oldVC
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
