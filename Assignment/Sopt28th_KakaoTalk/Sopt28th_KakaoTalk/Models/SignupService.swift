//
//  SignupService.swift
//  Sopt28th_1st_Assignment
//
//  Created by 김루희 on 2021/05/14.
//

//import Foundation
//import Alamofire
//
//struct SignupService {
//    
//    static let shared = SignupService()
//    
//    private func makeParameter(email : String, password : String) -> Parameters {
//        
//        return ["email" : "test1",
//                "password" : "1111",
//                "sex" : "0",
//                "nickname" : "sopt_test",
//                "phone" : "010-1010-2020",
//                "birth" : "1996-02-24"]
//    }
//    
//    
//    func signup(email : String,
//               password : String,
//               
//               completion : @escaping ((NetworkResult<Any>) -> Void)) {
//        
//        // 필요한 헤더를 Key - Value 형태로 작성
//        // 보통 json 형태로 받아오기 위해서는 해당 header를 작성함
//        let header : HTTPHeaders = ["Content-Type" : "application/json"]
//        
//        // APIConstants의 loginURL을 가지고, POST 방식을 통해, JSONEncoding 인코딩 방식으로, 헤더 정보와 함께
//        // Request를 보내기 위한 정보를 묶어서 dataRequest에 저장해둡니다.
//        let dataRequest = AF.request(APIConstants.loginURL,
//                                     method: .post,
//                                     parameters: makeParameter(email: email, password: password),
//                                     encoding: JSONEncoding.default,
//                                     headers: header)
//        
//        
//        // 위에서 적어둔 요청설르 가지고 진짜 서버에 보내서 통신 Request를 하는 중
//        // 통신이 완료되면 클로저를 통해서 dataRequest라는 이름으로 결과가 도착
//        dataRequest.responseData { (dataResponse) in
//            dump(dataResponse) // 가져온 데이터를 보기 위해서 dump 처리
//            
//            // dataResponse가 도착했으니, 그 안에는 통신에 대한 결과물이 있다
//            // dataResponse.result는 통신 성공했는지 / 실패했는지 여부
//            switch dataResponse.result {
//            
//            // dataResponse가 성공이면 statusCode와 response(결과데이터)를 guard let 구문을 통해서 저장해 둡니다.
//            case .success:
//                
//                // dataResponse.statusCode는 Response의 statusCode - 200/400/500
//                guard let statusCode = dataResponse.response?.statusCode else { return }
//                
//                // dataResponse.value는 Response의 결과 데이터
//                guard let value = dataResponse.value else { return }
//                
//                // judgeStatus라는 함수에 statusCode와 response(결과데이터)를 실어서 보냅니다.
//                let networkResult = self.judgeStatus(by: statusCode, value)
//                completion(networkResult)
//                
//                
//            // 통신 실패의 경우, completion에 pathErr값을 담아서 뷰컨으로 날려줍니다.
//            // 타임아웃 / 통신 불가능의 상태로 통신 자체에 실패한 경우입니다.
//            case .failure: completion(.pathErr)
//                
//            }
//        }
//    }
//}