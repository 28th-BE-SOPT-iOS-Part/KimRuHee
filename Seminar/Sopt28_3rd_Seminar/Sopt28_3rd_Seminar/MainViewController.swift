//
//  MainViewController.swift
//  Sopt28_3rd_Seminar
//
//  Created by 김루희 on 2021/04/24.
//

import UIKit

class MainViewController: UIViewController, SampleProtocol {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func dataSend(data: String) {
        
        dataLabel.text = data
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "DelegateViewController") as? DelegateViewController else { return }
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("sample"), object: nil)
        
        
//        nextVC.delegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            dataLabel.text = text
        }
    }
}
