//
//  LableViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/9.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class LableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "UILable"
        view.backgroundColor = UIColor.white
        
        let helloFrame = CGRect.init(x: 13.0, y: 40.0, width: 160, height: 30)
        let helloLbl = setLableInit(textStr: "Hello", frame: helloFrame, tColor: UIColor.black, bColor: UIColor.orange, textA: NSTextAlignment.center, fSize: 16.0)
        view.addSubview(helloLbl)
        
        let rFrame = CGRect.init(x: 13.0, y: 80.0, width: 160, height: 30)
        let rLable = setRadiusLable(tStr: "text String", frame: rFrame, tColor: UIColor.black, bColor: UIColor.orange, textA: NSTextAlignment.center, fSize: 16.0, radius: 4.0)
        view.addSubview(rLable)
        
        let cFrame = CGRect.init(x: 13.0, y: 130.0, width: 160.0, height: 40.0)
        let cLable = setLableInit(textStr: "click Lable", frame: cFrame, tColor: UIColor.black, bColor: UIColor.purple, textA: NSTextAlignment.center, fSize: 16.0)
        cLable.isUserInteractionEnabled = true
        cLable.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(testLableClick)))
        view.addSubview(cLable)
        
    }
    
    @objc func testLableClick() {
        print("click Lable is success!")
    }
    
    func setLableInit(textStr: String, frame: CGRect, tColor: UIColor, bColor: UIColor, textA:NSTextAlignment, fSize: CGFloat) -> UILabel {
        
        let label = UILabel.init(frame: frame)
        label.textColor = tColor
        label.backgroundColor = bColor
        label.textAlignment = textA
        label.font = UIFont.systemFont(ofSize: fSize)
        label.text = textStr
        
        return label
    }
    
    func setRadiusLable(tStr: String, frame: CGRect, tColor: UIColor, bColor: UIColor, textA: NSTextAlignment, fSize: CGFloat, radius: CGFloat) -> UILabel {
        
        let lable = UILabel.init(frame: frame)
        lable.text = tStr
        lable.backgroundColor = bColor
        lable.textColor = tColor
        lable.textAlignment = textA
        lable.layer.cornerRadius = radius
        lable.layer.masksToBounds = true
        
        return lable
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
