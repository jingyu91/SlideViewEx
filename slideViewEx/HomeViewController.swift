//
//  ViewController.swift
//  slideViewEx
//
//  Created by KimJingyu on 2017. 4. 6..
//  Copyright © 2017년 jingyu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickMenu(_ sender: Any) {
        (navigationController as! NavigationViewController).show()
    }

}

