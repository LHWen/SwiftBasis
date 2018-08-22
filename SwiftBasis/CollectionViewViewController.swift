//
//  CollectionViewViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController {
    
    var flowLayout: UICollectionViewFlowLayout?
    var collectionView: UICollectionView?
    var dataArr: NSArray? = []
    let kCell = "CollectionCell"
    let kHeader = "CollectionHeader"
    let kFooter = "CollectionFooter"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "CollectionView"
        self.view.backgroundColor = .white
        
        dataArr = ["第一项", "第二项", "第三项", "第四项", "第五项", "第六项", "第七项", "第八项", "第九项"]
        setCollectionViewLayout()
    }
    
    func setCollectionViewLayout() {
        
        if flowLayout == nil {
            flowLayout = UICollectionViewFlowLayout()
            flowLayout?.sectionInset = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
            flowLayout?.minimumInteritemSpacing = 0
            flowLayout?.minimumLineSpacing = 10
            
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout!)
            collectionView?.backgroundColor = .gray
            collectionView?.delegate = self
            collectionView?.dataSource = self
            collectionView?.register(TCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: kCell)
            collectionView?.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeader)
            collectionView?.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: kFooter)
            view.addSubview(collectionView!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CollectionViewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("data array count is \(String(describing: self.dataArr?.count))")
        return (self.dataArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: TCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCell, for: indexPath) as! TCollectionViewCell
        
        cell.titleLable.text = (self.dataArr![indexPath.row] as! String)
        cell.backgroundColor = .white
        
        return cell
    }
    
    // 定义大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize: CGSize = CGSize(width: 100, height: 44.0);
        return itemSize;
    }
    
    // 设置是否可以选择cell
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 设置是否支持高亮
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 选择项
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("click collection view item row is \(indexPath.row)")
    }
}

