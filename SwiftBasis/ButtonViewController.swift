//
//  ButtonViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UIButton"
        view.backgroundColor = UIColor.white
        
        // 测试 button 常规设置 以及交互事件绑定方法一
        let bFrame = CGRect.init(x: 13, y: 30, width: 120, height: 40)
        let tBtn = setButtonLayout(titStr: "Test Button", bFrame: bFrame, bColor: .orange, lColor: .blue, tColor: .black, fSize: 15.0, radius: 0)
        tBtn.addTarget(self, action: #selector(testButtonClick), for: .touchUpInside)
        view.addSubview(tBtn)
        
        // 圆角 button 常规设置 交互事件绑定方法二
        let rFrame = CGRect(x: 13, y: 100, width: 120, height: 40)
        let rBtn: UIButton = setButtonLayout(titStr: "radius Button", bFrame: rFrame, bColor: .orange, lColor: .green, tColor: .black, fSize: 15.0, radius: 5.0)
        rBtn.addTarget(self, action: #selector(radiusButtonClick(sender:)), for: .touchUpInside)
        view.addSubview(rBtn)
        
    }
    
    @objc func testButtonClick(sender: UIButton) {
        print("test button click!")
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            print("test button click is selected")
        } else {
            print("test button click is not selected")
        }
    }
    
    @objc func radiusButtonClick(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            print("radius button click is selected !")
        } else {
            print("radius button click is not selected !")
        }
    }
    
    func setButtonLayout(titStr: String, bFrame: CGRect, bColor: UIColor, lColor: UIColor, tColor: UIColor, fSize: CGFloat, radius: CGFloat) -> UIButton {
        
        // let btn = UIButton.init(type: UIButtonType.custom)
        let btn: UIButton = UIButton(type: .custom)
        btn.frame = bFrame
        btn.setTitle(titStr, for: UIControlState.normal)
        btn.setTitleColor(tColor, for: UIControlState.normal)
        btn.setTitleColor(lColor, for: UIControlState.highlighted)
        btn.setTitleColor(.white, for: .selected)
        btn.backgroundColor = bColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fSize)
        if radius > 0 {
            btn.layer.cornerRadius = radius
            btn.layer.masksToBounds = true
        }
        
        return btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
