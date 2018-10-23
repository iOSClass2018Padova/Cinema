//
//  ViewController.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "access_token")
        
        GeneralUtils.share.reloadGenericViewController(storyboardName: "Login", controllerIdentifier: "Login")
    }
    
}

