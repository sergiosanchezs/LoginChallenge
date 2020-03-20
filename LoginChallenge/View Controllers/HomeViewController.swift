//
//  HomeViewController.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Sergio Sanchez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpelements()
    }
    
    func setUpelements(){
        CustomUtils.styleHollowButton(logOutButton)
    }

    @IBAction func logOutTapped(_ sender: Any) {
        transitionToRoot()
    }
    
    func transitionToRoot(){
        
        let rootViewController = storyboard?.instantiateViewController(identifier: Constants.Stroyboard.rootViewController) as? ViewController
        
        view.window?.rootViewController = rootViewController
        view.window?.makeKeyAndVisible()
        
    }
}
