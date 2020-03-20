//
//  LoginViewController.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Sergio Sanchez. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpelements()
    }
    
    func setUpelements(){
        // Hide the error label
        errorLabel.alpha = 0
        // Style the elements in the View
        CustomUtils.styleTextField(usernameTextField)
        CustomUtils.styleTextField(passwordTextField)
        CustomUtils.styleFilledButton(loginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // Check the fields and validate that the data is correct.
    // If everything is correct this method returns nil.
    // Otherwise,, it returns the error message.
    func validateFields() -> String? {
         // Check that all fields are filled in
        if usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all the fields."
        }
        
        // Check if the email is secure
        let cleanedUsername = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if CustomUtils.isEmailValid(cleanedUsername) == false {
            // Password isn't secure enough
            return "Please enter a valid email!"
        }
        
        return nil
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // Validate Text Fields
        let error = validateFields()
        
        // Check for errors
        if error != nil { // There was an error
            // Show error message
            showError(error!)
        } else {
            // Create cleaned versions of the data
            let userName = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: userName, password: password) {(result, error) in
                // Check for errors
                if error != nil {
                    // There was an error signIn the user
                    self.showError(error!.localizedDescription)
                } else {
                    self.transitionToHome()
                }
                
            }
            
        }
        
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Stroyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
    
}
