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
        
        dataArr = ["UILable", "UIButton", "UIImageView", "UITextField", "UISearchBar", "UIProgressView", "UISlider"]
        p_setTableViewLayout()
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
                     SliderViewController()]
        self.navigationController?.pushViewController(vcArr[indexPath.row], animated: true)
    }
    
}

