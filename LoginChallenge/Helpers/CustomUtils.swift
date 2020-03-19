//
//  Utilities.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Sergio Sanchez. All rights reserved.
//

import Foundation
import UIKit

class CustomUtils {

    static func styleTextField(_ textfield: UITextField){
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 42/255, green: 138/255, blue: 175/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle =  .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton){
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 42/255, green: 138/255, blue: 175/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton){
        // Filled rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password:String) -> Bool {
        let passwordTester = NSPredicate(format: "SELF MATCHES %@",
                    "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTester.evaluate(with: password)
    }
    
}
