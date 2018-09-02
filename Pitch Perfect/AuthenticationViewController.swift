//
//  AuthenticationViewController.swift
//  Pitch Perfect
//
//  Created by Chetan Bhasin on 02.09.18.
//  Copyright © 2018 Chetan Bhasin. All rights reserved.
//

import UIKit
import Foundation
import LocalAuthentication

class AuthenticationViewController: UIViewController {
    
    var authenticated: Bool = false

    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var authenticationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authButton.isEnabled = true

        // Do any additional setup after loading the view.
    }
    
    func navigateToNextVC() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "authenticated", sender: self)
        }
    }
    
    @IBAction func pressAuthButton(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authentication required for accessing the application."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {
                (success, error) in
                if success {
                    print("Authentication successful. Preparing for segue.")
                    self.authenticated = true
                    self.navigateToNextVC()
                } else {
                    self.authenticated = false
                    self.authenticationLabel.text = "Authentication failed. Please try again."
                }
            })
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
