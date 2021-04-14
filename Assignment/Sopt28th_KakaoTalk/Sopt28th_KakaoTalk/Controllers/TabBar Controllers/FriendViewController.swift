//
//  FriendViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit

class FriendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController") as? MyProfileViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
}
