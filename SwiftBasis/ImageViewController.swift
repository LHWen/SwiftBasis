//
//  ImageViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UIImageView"
        view.backgroundColor = .white
        
        let tImgView = UIImageView(image: UIImage(named: "he"))
        tImgView.frame = CGRect(x: 13, y: 20, width: 200, height:200)
        tImgView.backgroundColor = UIColor.orange
        tImgView.contentMode = .scaleAspectFill // 填充满裁剪
        tImgView.clipsToBounds = true
        view.addSubview(tImgView)
        
        let stfImgView = UIImageView(image: UIImage(named: "he"))
        stfImgView.frame = CGRect(x: 13.0, y: 225, width: 200, height: 200)
        stfImgView.backgroundColor = .orange
        stfImgView.contentMode = .scaleToFill // 填充满不裁剪
        view.addSubview(stfImgView)
        
        let safitImgView = UIImageView(image: UIImage(named: "he"))
        safitImgView.frame = CGRect(x: 13.0, y: 430, width: 200, height: 200)
        safitImgView.backgroundColor = .orange
        safitImgView.contentMode = .scaleAspectFit // 自适应图片高度
        view.addSubview(safitImgView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
