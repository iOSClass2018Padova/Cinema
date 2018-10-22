//
//  LoginController.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    enum TagTextField : Int{
        case email = 0
        case password
        
    }

    @IBOutlet weak var titleOutlet: UILabel! {
        didSet {
            titleOutlet.text = "kLoginTitle".localized
        }
    }
    
    
    @IBOutlet var textFields: [UITextField]! {
        didSet {
            for textField in textFields {
                switch textField.tag {
                case TagTextField.email.rawValue: textField.placeholder = "kLoginEmail".localized
                case TagTextField.password.rawValue: textField.placeholder = "kLoginPassword".localized
                default:
                    break
                }
            }
        }
    }
    
    @IBOutlet weak var loginOutlet: UIButton! {
        didSet {
            loginOutlet.setTitle("kLoginButton".localized, for: .normal)
        }
    }
    
    @IBOutlet weak var signUpOutlet: UIButton! {
        didSet {
            signUpOutlet.setTitle("kLoginGoToSignup".localized, for: .normal)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
