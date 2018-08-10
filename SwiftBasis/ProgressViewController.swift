//
//  ProgressViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UIProgressView"
        view.backgroundColor = UIColor.white
        
        let progressV = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        // 高度无法修改
        progressV.frame = CGRect(x: 13, y: 40, width: 210, height: 10)
        progressV.progressTintColor = UIColor.blue
        progressV.trackTintColor = UIColor.orange
        progressV.progress = 0.4
        view.addSubview(progressV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
