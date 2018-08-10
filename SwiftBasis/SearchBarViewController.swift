//
//  SearchBarViewController.swift
//  SwiftBasis
//
//  Created by LHWen on 2018/8/10.
//  Copyright © 2018年 LHWen. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UISearchBar"
        view.backgroundColor = .orange
        
        let searchBar = UISearchBar(frame: CGRect(x: 13.0, y: 40.0, width: 260.0, height: 28.0))
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage(named: "tab_")
        searchBar.layer.cornerRadius = 6.0
        searchBar.layer.borderColor = UIColor.init(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0).cgColor
        searchBar.layer.borderWidth = 0.5
        searchBar.layer.masksToBounds = true
        searchBar.barStyle = UIBarStyle.default
        searchBar.returnKeyType = UIReturnKeyType.search
        searchBar.placeholder = "请输入"
        searchBar.tintColor = UIColor.blue
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("searchBar text change: " + searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBar search text: " + searchBar.text!)
        searchBar.resignFirstResponder()
    }
}
