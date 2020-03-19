//
//  ViewController.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Maria Fernanda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpelements()
    }

    func setUpelements(){
        // Style the elements in the View
        CustomUtils.styleFilledButton(signUpButton)
        CustomUtils.styleHollowButton(loginButton)
    }

}

