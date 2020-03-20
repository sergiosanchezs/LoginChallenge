//
//  SingUpViewController.swift
//  LoginChallenge
//
//  Created by Sergio Sanchez on 19/3/20.
//  Copyright © 2020 Sergio Sanchez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SingUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
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
        CustomUtils.styleTextField(firstNameTextField)
        CustomUtils.styleTextField(lastNameTextField)
        CustomUtils.styleTextField(emailTextField)
        CustomUtils.styleTextField(passwordTextField)
        CustomUtils.styleFilledButton(signUpButton)
        CustomUtils.styleHollowButton(backButton)
    }
    
    // Check the fields and validate that the data is correct.
    // If everything is correct this method returns nil.
    // Otherwise,, it returns the error message.
    func validateFields() -> String? {
         // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            errorLabel.textAlignment = .center
            return "Please fill in all fields."
        }
        
        // Check if the email is secure
        let cleanedUEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if CustomUtils.isEmailValid(cleanedUEmail) == false {
            // Password isn't secure enough
            errorLabel.textAlignment = .center
            return "Please enter a valid email!"
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if CustomUtils.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            errorLabel.textAlignment = .left
            return "Please make sure your password is:\n" +
                    " - At least 8 characters long.\n" +
                    " - Contains at least 1 special character.\n" +
                    " - Contains at least 1 number."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        
        if error != nil { // There was an error
            // Show error message
            showError(error!)
        } else {
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    // User was created successfully
                    // Store firts and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid":result!.user.uid]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    // Transition to home screen
                    self.transitionToHome()
                    
                }
            }
        
        // Transition to home screen
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
