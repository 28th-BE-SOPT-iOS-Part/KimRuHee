//
//  FriendViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit

class FriendViewController: UIViewController {

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Helpers
    
    @IBAction func profileButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "MyProfileViewController") as? MyProfileViewController else { return }
        
        nextVC.modalPresentationStyle = .overFullScreen
        
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
}
