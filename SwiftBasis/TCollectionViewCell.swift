//
//  TCollectionViewCell.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class TCollectionViewCell: UICollectionViewCell {
    
    var titleLable: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLableLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLableLayout() {
        
        if titleLable == nil {
            
            titleLable = UILabel(frame: CGRect(x: 20, y: 10, width: 60, height: 20))
            titleLable.font = UIFont.systemFont(ofSize: 15.0)
            titleLable.textAlignment = .center
            titleLable.textColor = UIColor.orange
            self.addSubview(titleLable)
        }
    }
    
}
