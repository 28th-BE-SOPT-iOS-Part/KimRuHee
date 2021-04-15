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
        // 로그인 버튼 누를 경우 홈화면(카톡 친구 목록 창)으로 이동
        if emailTextField.hasText == true && pwTextField.hasText == true {
//            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FriendViewController")
//                    as? FriendViewController else { return }

            // 탭바 스토리보드로 연결했더니 안 떠서 우선,, 코드로 해봄..
            guard let first = storyboard?.instantiateViewController(withIdentifier: "FriendViewController") as? FriendViewController else { return }
            guard let second = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController else { return }
            guard let third = storyboard?.instantiateViewController(withIdentifier: "TagViewController") as? TagViewController else { return }
            guard let fourth = storyboard?.instantiateViewController(withIdentifier: "ShoppingViewController") as? ShoppingViewController  else { return }
            guard let fifth = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }

            let tb = UITabBarController()
            tb.tabBar.tintColor = .black // 선택 시 검정색
            tb.setViewControllers([first, second, third, fourth, fifth], animated: true)
            self.navigationController?.pushViewController(tb, animated: true)
            
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

