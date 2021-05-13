//
//  NetworkResult.swift
//  Sopt28_4th_Seminar
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
