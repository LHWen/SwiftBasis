//
//  SegmentedTwoViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class SegmentedTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        
        let label = UILabel.init(frame: CGRect(x: 13.0, y: 44.0, width: 300, height: 20))
        label.textColor = .black
        label.backgroundColor = .yellow
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.text = "segmented two viewController"
        view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
