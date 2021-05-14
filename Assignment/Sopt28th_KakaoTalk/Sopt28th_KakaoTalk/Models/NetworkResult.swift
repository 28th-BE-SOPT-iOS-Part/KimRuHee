//
//  NetworkResult.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/05/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail

}
