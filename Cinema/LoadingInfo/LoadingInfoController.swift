//
//  LoadingInfoController.swift
//  Cinema
//
//  Created by stefano vecchiati on 23/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit

class LoadingInfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        NetworkManager.checkToken { (success) in
            if success {
                NetworkManager.getUser(completion: { (success) in
                    if success {
                        self.performSegue(withIdentifier: "segueToMain", sender: self)
                    } else {
                       self.performSegue(withIdentifier: "segueToLogin", sender: self)
                    }
                })
            } else {
                self.performSegue(withIdentifier: "segueToLogin", sender: self)
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
