//
//  Extension + VC .swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2021/04/19.
//  Copyright © 2021 송지훈. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var classStaticName: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className : String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
}

 // 클래스 이름 반환하는 프로퍼티
