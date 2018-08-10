//
//  SliderViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UISlider"
        self.view.backgroundColor = UIColor.white
        
        let slider = UISlider(frame: CGRect(x: 30.0, y: 40, width: 300, height: 40))
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.value = 20.0
        slider.isContinuous = true // 滑块滑动值一直跟随变动
        slider.minimumTrackTintColor = UIColor.blue
        slider.maximumTrackTintColor = UIColor.orange
        slider.thumbTintColor = UIColor.gray // 滑块颜色
        slider.addTarget(self, action: #selector(sliderValueChange(sender:)), for: .valueChanged)
        view.addSubview(slider)
        
    }

    @objc func sliderValueChange(sender: UISlider) {
        print("slider value change is : " + String(sender.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
