//
//  MainViewController.swift
//  slideViewEx
//
//  Created by KimJingyu on 2017. 5. 1..
//  Copyright © 2017년 jingyu. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    var sideMenu: MenuViewController
    
    required init?(coder aDecoder: NSCoder) {
        sideMenu = MenuViewController()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        sideMenu.delegate = self
        self.view.addSubview(sideMenu.view)
        sideMenu.hide()
        // Do any additional setup after loading the view.
    }
    
    func show() {
        sideMenu.show(true)
    }

}

extension NavigationViewController: MenuDelegate {
    func selectMenuIndex(index: MenuType) {
        switch index {
        case .Main:
            break
        case .Detail:
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            pushViewController(vc, animated: true)
        }
    }
}
