//
//  ViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/9.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _tableView: UITableView?   // 定义tableView
    var dataArr: NSArray = [] // 定义数组
    let baseCell = "BasisCell"
    let baseColor = UIColor.init(red: 238.0/255.0, green: 234.0/255.0, blue: 247.0/255.0, alpha: 0.9)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Swift Basis"
        self.view.backgroundColor = baseColor
        
        dataArr = ["UILable", "UIButton", "UIImageView", "UITextField", "UISearchBar", "UIProgressView", "UISlider", "SegmentedControl", "UIActivityIndicatorView", "UICollectionView", "DatePicker"]
        p_setTableViewLayout()
        
//        testString(toConvert: "0X2390342")
        testString(toConvert: "#effi00")
    }
    
    func testString(toConvert: String) {
        var cString: String = toConvert.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        // strip 0X if it appears
        if cString.hasPrefix("0X") {
            cString = String(cString.suffix(from: cString.index(cString.startIndex, offsetBy: 2)))
            print("test string is \(cString)")
        }
        if cString.hasPrefix("#") {
            cString = String(cString.suffix(from: cString.index(cString.startIndex, offsetBy: 1)))
            print("test string # is \(cString)")
            
            let startIndex = cString.index(cString.startIndex, offsetBy: 1)
            let endIndex = cString.index(startIndex, offsetBy: 3)
            
            let tct = cString[startIndex ..< endIndex]
            
            print("c String ffi : \(tct)")
        }
        
    }
    
    // set table view
    func p_setTableViewLayout() {
        
        if _tableView == nil {
            
            let tableFrame = CGRect.init(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
            _tableView = UITableView.init(frame: tableFrame)
            _tableView?.backgroundColor = baseColor
            _tableView?.tableFooterView = UIView.init()
            _tableView?.delegate = self
            _tableView?.dataSource = self
            _tableView?.separatorColor = UIColor.gray
            _tableView?.separatorInset = UIEdgeInsetsMake(0, 13.0, 0, 0)
            _tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: baseCell)
            view.addSubview(_tableView!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 分区多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: baseCell)
        cell?.selectionStyle = UITableViewCellSelectionStyle.default
        // 强转string
        cell?.textLabel?.text = dataArr[indexPath.row] as?String
        
        return cell!
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        
        let vcArr = [LableViewController(),
                     ButtonViewController(),
                     ImageViewController(),
                     TextFieldViewController(),
                     SearchBarViewController(),
                     ProgressViewController(),
                     SliderViewController(),
                     SegmentedControlViewController(),
                     ActivityViewController(),
                     CollectionViewViewController(),
                     DatePickerViewController()]
        self.navigationController?.pushViewController(vcArr[indexPath.row], animated: true)
    }
    
}

