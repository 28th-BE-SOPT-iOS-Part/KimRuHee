//
//  SignupDataModel.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/05/14.
//

import Foundation

//MARK: - SignupDataModel

struct SignupDataModel : Codable {
    let success : Bool
    let message : String
    let data : NewUserData?
    
    enum CodingKeys : String, CodingKey {
        case success
        case message
        case data
    }
    
    // data가 없으면 decode가 안될 경우가 발생하니까 직접 decode 부분 작성해야 함
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(NewUserData.self, forKey:.data)) ?? nil
    }
}

//MARK: - NewUserData

struct NewUserData : Codable {
    let userID: Int
    let userNickname, token: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
