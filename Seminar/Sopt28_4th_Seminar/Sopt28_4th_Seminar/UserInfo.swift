//
//  UserInfo.swift
//  Sopt28_4th_Seminar
//
//  Created by 김루희 on 2021/05/13.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    var id: String?
    var pw : String?
    var name : String?
}
