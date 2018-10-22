//
//  SignUpController.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    enum TagTextField : Int{
        case email = 0
        case password
        case rePassword
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLable: UILabel! {
        didSet {
            titleLable.text = "kSignupTitle".localized
        }
    }
    
    @IBOutlet var textFields: [UITextField]! {
        didSet {
            for textField in textFields {
                switch textField.tag {
                case TagTextField.email.rawValue: textField.placeholder = "kLoginEmail".localized
                case TagTextField.password.rawValue: textField.placeholder = "kLoginPassword".localized
                case TagTextField.rePassword.rawValue: textField.placeholder = "kSignupRepeatPassword".localized
                default:
                    break
                }
            }
        }
    }
    
    @IBOutlet weak var signUpOutlet: UIButton!  {
        didSet {
            signUpOutlet.setTitle("kSignupButton".localized, for: .normal)
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        var email : String = ""
        var password : String = ""
        var rePassword : String = ""
        
        for textField in textFields {
            switch textField.tag {
            case TagTextField.email.rawValue:
                email = textField.text ?? ""
            case TagTextField.password.rawValue:
                password = textField.text ?? ""
            case TagTextField.rePassword.rawValue:
                rePassword = textField.text ?? ""
            default:
                break
            }
        }
        
        guard !email.isEmpty && !password.isEmpty && !rePassword.isEmpty else {
            let alert = UIAlertController(title: "kAlertLoginFailedEmptyLabelsTitle".localized, message: "kAlertLoginFailedEmptyLabelsMessage".localized, preferredStyle: .alert)
            let ok = UIAlertAction(title: "kAlertOkButton".localized, style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
    }
    
    
    @IBOutlet weak var goToLogin: UIButton!  {
        didSet {
            goToLogin.setTitle("kSignupGoToLogin".localized, for: .normal)
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
