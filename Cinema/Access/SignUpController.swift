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
            self.present(GeneralUtils.share.alertError(title: "kAlertLoginFailedEmptyLabelsTitle".localized, message: "kAlertLoginFailedEmptyLabelsMessage".localized), animated: true, completion: nil)
            return
        }
        
        guard email.isValidEmail() else {
            self.present(GeneralUtils.share.alertError(title: "kAlertLoginFailedInvalidEmailTitle".localized, message: "kAlertLoginFailedInvalidEmailMessage".localized), animated: true, completion: nil)
            return
        }
        
        guard password == rePassword else {
            self.present(GeneralUtils.share.alertError(title: "kAlertLoginFailedDifferentPasswordsTitle".localized, message: "kAlertLoginFailedDifferentPasswordsMessage".localized), animated: true, completion: nil)
            return
        }
        
        guard password.count > 5 else {
            self.present(GeneralUtils.share.alertError(title: "kAlertLoginFailedInvalidPasswordTitle".localized, message: "kAlertLoginFailedInvalidPasswordTitle".localized), animated: true, completion: nil)
            return
        }
        
        
        User(email: email, password: password).save()
        
        self.present(GeneralUtils.share.alertError(title: nil, message: "Utente salvato corretamente 🤓"), animated: true, completion: nil)
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
