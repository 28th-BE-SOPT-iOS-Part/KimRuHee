//
//  LoginViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/05.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.placeholder = "이메일 또는 전화번호"
        pwTextField.placeholder = "비밀번호"
        
        loginButton.layer.cornerRadius = 5
        accountButton.layer.cornerRadius = 5
    }

    //MARK: - Helpers
    
    @IBAction func loginButton(_ sender: Any) {
        
        if emailTextField.hasText == true && pwTextField.hasText == true {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController")
                    as? CompleteViewController else { return }
            
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.comment = emailTextField.text
                
            self.present(nextVC, animated: true, completion: nil)
            
        } else {
            return
        }
    }
    
    @IBAction func newAccountButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController")
                as? SignUpViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

