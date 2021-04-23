//
//  MyProfileViewController.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/04/14.
//

import UIKit

class MyProfileViewController: UIViewController {
    
    //MARK: - Properties
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    var viewVelocity = CGPoint(x: 0, y: 0)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalDismiss()
    }
    
    //MARK: - Helpers
    
    func modalDismiss() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc func handleDismiss(_ sender: UIPanGestureRecognizer) {
        
        viewTranslation = sender.translation(in: view)
        viewVelocity = sender.velocity(in: view)
        
        switch sender.state {
        case .changed:
            // 상하로 스와이프 할 때 위로 스와이프가 안되게 해주기 위해서 조건 설정
            if abs(viewVelocity.y) > abs(viewVelocity.x) {
                if viewVelocity.y > 0 {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                    })
                }
            }
        case .ended:
            // 해당 뷰의 y값이 400보다 작으면(작게 이동 시) 뷰의 위치를 다시 원상복구하겠다. = 즉, 다시 y=0인 지점으로 리셋
            if viewTranslation.y < 400 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.transform = .identity
                })
                // 뷰의 값이 400 이상이면 해당 화면 dismiss
            } else {
                dismiss(animated: true, completion: nil)
            }
            
        default:
            break
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
