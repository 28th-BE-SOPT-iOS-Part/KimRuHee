//
//  UIViewController + makeAlerts.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/05/14.
//

import UIKit
import Foundation

extension UIViewController {
    
    
    // 이거는 취소, 확인 버튼이 있는 알림창
    func makeRequestAlert(title : String,
                          message : String,
                          okAction : ((UIAlertAction) -> Void)?,
                          cancelAction : ((UIAlertAction) -> Void)? = nil,
                          completion : (() -> Void)? = nil) {
        
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        
        self.present(alertViewController, animated: true, completion: completion)
        
    }
    
    // 이거는 확인 버튼만 있는 알림창
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil) {
        
        
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
    
   
}
