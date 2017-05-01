//
//  MenuViewController.swift
//  slideViewEx
//
//  Created by KimJingyu on 2017. 4. 6..
//  Copyright © 2017년 jingyu. All rights reserved.
//

import UIKit

enum MenuType:Int {
    case Main = 0
    case Detail = 1
}

protocol MenuDelegate: NSObjectProtocol {
    func selectMenuIndex(index: MenuType)
}

class MenuViewController: UIViewController {

    open weak var delegate: MenuDelegate?
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var menuTableViewLeading: NSLayoutConstraint!
    
    @IBAction func tapView(_ sender: Any) {
        hide(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }

    
    func hide(_ animated:Bool = false) {
        UIView.animate(withDuration: 0.2, animations: { 
            self.menuTableViewLeading.constant = -(self.view.bounds.size.width * 3.0 / 4.0)
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { (_: Bool) in
            self.view.frame = CGRect(x: -self.view.bounds.size.width,
                                     y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.bounds.size.height)
        }
    }
    
    func show(_ animated:Bool = false) {
        
        self.view.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.bounds.size.width,
                                 height: self.view.bounds.size.height)
        UIView.animate(withDuration: 0.2, animations: {
            self.menuTableViewLeading.constant = 0
            self.backgroundView.alpha = 1.0
            self.view.layoutIfNeeded()
        })
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        if indexPath.row == 0 {
            cell.lbTitle.text = "HOME"
        } else {
            cell.lbTitle.text = "DETAIL"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectMenuIndex(index: MenuType(rawValue: indexPath.row)!)
        hide()
    }
}
