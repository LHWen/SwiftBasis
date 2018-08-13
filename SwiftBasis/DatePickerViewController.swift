//
//  DatePickerViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/13.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "DatePicker"
        self.view.backgroundColor = UIColor.orange
        
        let lDatePicker = UIDatePicker(frame: CGRect(x: 60, y: 70, width: 300, height: 160))
        // 轮廓
        lDatePicker.layer.borderWidth = 1.0
        lDatePicker.layer.borderColor = UIColor.blue.cgColor
        // 设置当前时间
        lDatePicker.date = NSDate() as Date
        // 显示日期形式
         lDatePicker.datePickerMode = .dateAndTime  // 日期跟时间
        // lDatePicker.datePickerMode = .countDownTimer // 分秒
        // lDatePicker.datePickerMode = .date  // 日期选择
        // lDatePicker.datePickerMode = .time  // 时 分
        // 时间本地化
        lDatePicker.locale = Locale(identifier: "zh_CN")
        // 监控变化
        lDatePicker.addTarget(self, action: #selector(chooseDateFormater(datePicker:)), for: .valueChanged)
        
        view.addSubview(lDatePicker)
    }
    
    // 时间格式化
    @objc func chooseDateFormater(datePicker: UIDatePicker) {
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY-MM-dd HH-mm-ss"
        print(dateFormater.string(from: chooseDate))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
