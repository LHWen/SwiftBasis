//
//  TextFieldViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    var _passWordTextF: UITextField?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UITextField"
        view.backgroundColor = .orange
        
        let tTestText = UITextField(frame: CGRect(x: 13.0, y: 40, width: 200, height: 28.0))
//        tTestText.backgroundColor = UIColor.white
        tTestText.delegate = self
        tTestText.layer.borderWidth = 0.5
        tTestText.layer.borderColor = UIColor.green.cgColor
        tTestText.tintColor = UIColor.black   // 光标颜色
        tTestText.placeholder = "请输入"
        tTestText.font = UIFont.systemFont(ofSize: 14.0)
        tTestText.textColor = UIColor.blue
        tTestText.clearButtonMode = UITextFieldViewMode.whileEditing
        tTestText.returnKeyType = UIReturnKeyType.done
        view.addSubview(tTestText)
        
        // 密码
        _passWordTextF = UITextField(frame: CGRect(x: 13.0, y: 75, width: 200, height: 28.0))
        _passWordTextF?.delegate = self
        // 开启密码不可见
        _passWordTextF?.isSecureTextEntry = true
        _passWordTextF?.backgroundColor = UIColor.white
        // 富文本设置提示语
        _passWordTextF?.attributedPlaceholder = NSAttributedString.init(string: "please PassWord", attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange])
        _passWordTextF?.font = UIFont.systemFont(ofSize: 14.0)
        _passWordTextF?.textColor = UIColor.blue
        _passWordTextF?.clearButtonMode = UITextFieldViewMode.whileEditing
        _passWordTextF?.returnKeyType = UIReturnKeyType.done
        _passWordTextF?.addTarget(self, action: #selector(passwordChangeValue), for: .editingChanged)
        view.addSubview(_passWordTextF!)
    }
    
    @objc func passwordChangeValue() {
        print("get pass word value change: " + (_passWordTextF?.text)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TextFieldViewController: UITextFieldDelegate {
    
    // 点击键盘右下角return按钮 放弃第一响应者
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
