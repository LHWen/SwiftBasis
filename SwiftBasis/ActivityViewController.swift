//
//  ActivityViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    var timing: NSInteger = 3
    var timer: Timer?
    var _activityView: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UIActivityIndicatorView"
        view.backgroundColor = .orange
        
        let btn: UIButton = UIButton(type: .custom)
        btn.frame = CGRect(x: 40, y: 50, width: 100, height: 40)
        btn.setTitle("click show", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btn.setTitleColor(.white, for: .selected)
        btn.backgroundColor = UIColor.blue
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.addTarget(self, action: #selector(clickShowActivity(sender:)), for: .touchUpInside)
        view.addSubview(btn)
        
        _activityView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        _activityView?.center = view.center
        _activityView?.hidesWhenStopped = true
        view.addSubview(_activityView!)
    }
    
    @objc func clickShowActivity(sender: UIButton) {
        
        _activityView?.startAnimating()
        
        if timer == nil {
            print("timer set success!")
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(activityShowDone), userInfo: nil, repeats: true)
        }
    }
    
    @objc func activityShowDone() {
        
        timing -= 1
        if timing == 0 {
            
            _activityView?.stopAnimating()
            
            timer?.invalidate()
            timer = nil
            timing = 3
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
