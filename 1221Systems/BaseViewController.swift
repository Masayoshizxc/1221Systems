//
//  BaseViewController.swift
//  1221Systems
//
//  Created by Adilet on 23/8/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let back = UIBarButtonItem()
        back.title = ""
        back.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = back
    }
    
}
