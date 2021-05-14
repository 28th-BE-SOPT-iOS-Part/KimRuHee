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
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // 로그인 버튼 누를 경우 홈화면(카톡 친구 목록 창)으로 이동
        if emailTextField.hasText == true && pwTextField.hasText == true {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let nextVC = storyboard.instantiateViewController(identifier: "MainTabBarController")
                    as? MainTabBarController else { return }
            
            self.makeRequestAlert(title: "알림",
                                  message: "로그인을 하시겠습니까?",
                                  okAction: { _ in
                                    self.loginAction()
                                  })

            self.navigationController?.pushViewController(nextVC, animated: true)
            
        } else {
            return
        }
    }
    
    @IBAction func newAccountButtonTapped(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController")
                as? SignUpViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func loginAction() {
        
        LoginService.shared.login(email: self.emailTextField.text!, password: self.pwTextField.text!) { result in
            
            switch result {
            
            case .success(let message):
                
                if let message = message as? String {
                    
                    self.makeAlert(title: "알림", message: message, okAction: { _ in
                        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MainTabBarController") as? MainTabBarController
                        else { return }
                    
                        nextVC.navigationController?.pushViewController(nextVC, animated: true)
                        
                    }, completion: nil)

                }
                
            case .requestErr(let message):
                
                if let message = message as? String {
                    
                    self.makeAlert(title: "알림", message: message)
                    
                }
                
            default :
                print("ERROR")
                
            }
        }
    }
    
}

