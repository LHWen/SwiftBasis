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
        
        let helloFrame = CGRect.init(x: 13.0, y: 40.0, width: 100, height: 20)
        let helloLbl = setLableInit(textStr: "Hello", frame: helloFrame, tColor: UIColor.black, bColor: UIColor.orange, textA: NSTextAlignment.center, fSize: 16.0)
        view.addSubview(helloLbl)
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
