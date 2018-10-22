//
//  GeneralUtils.swift
//  Cinema
//
//  Created by stefano vecchiati on 22/10/2018.
//  Copyright © 2018 com.stefanovecchiati. All rights reserved.
//

import UIKit

class GeneralUtils: NSObject {
    
    static let share = GeneralUtils()
    
    func alertError(title: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "kAlertOkButton".localized, style: .cancel, handler: nil)
        alert.addAction(ok)
        return alert
    }
    

}
