//
//  SignUpViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/05.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var checkPwTextField: UITextField!
    
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var checkPwView: UIView!
    
    @IBOutlet weak var accountButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.placeholder = "이메일 또는 전화번호"
        pwTextfield.placeholder = "비밀번호"
        checkPwTextField.placeholder = "비밀번호 확인"
        
        accountButton.layer.cornerRadius = 5
    }
    
    //MARK: - Helpers
    
    @IBAction func newAccountButton(_ sender: Any) {
        
        if  pwTextfield.text != checkPwTextField.text {
            
            // 비번 일치하지 않을 경우
            pwView.backgroundColor = .red
            checkPwView.backgroundColor = .red
            
            let alert = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        
        } else if (emailTextField.hasText == true && pwTextfield.hasText == true && checkPwTextField.hasText == true) && (pwTextfield.text == checkPwTextField.text) {
            
            // 비번 일치할 경우 원래대로 해주기
            pwView.backgroundColor = .systemGray4
            checkPwView.backgroundColor = .systemGray4
            
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FriendViewController")
                    as? FriendViewController else { return }
            
            nextVC.modalPresentationStyle = .fullScreen
//            nextVC.comment = emailTextField.text
            
            self.present(nextVC, animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            return
        }
    }  
}
