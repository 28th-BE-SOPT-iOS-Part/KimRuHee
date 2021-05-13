//
//  GetPersonDataService.swift
//  Sopt28_4th_Seminar
//
//  Created by 김루희 on 2021/05/14.
//

import Foundation
import Alamofire

struct GetPersonDataService {
    // 싱글턴 패턴 - static 키워드를 통해 shared 라는 프로퍼티에 싱글턴 인스턴스 저장하여 생성
    // 이를 통해서 여러 VC에서도 shared로 접근하면 같은 인스턴스에 접근할 수 있는 형태
    static let shared = GetPersonDataService()
    
    
    // getPersonInfo 함수 생성
    // completion 클로저를 @escaping closure로 정의
    // -> getPersonInfo 함수가 종료되든 말든 상관없이 completion은 탈출 클로저이기 때문에, 전달된다면 이후에 외부에서도 사용가능
    // ** 해당 completion 클로저에는 네트워크의 결과를 담아서 호출하게 되고, VC에서 꺼내서 처리할 예정
    func getPersonInfo(completion : @escaping (NetworkResult<Any>) -> Void) {
        
        // 데이터를 받아오려는 주소를 정의
        // 필요한 헤더를 Key - Value 형태로 작성
        // 보통 json 형태로 받아오기 위해서는 해당 header를 작성함
        let URL = "https://mocki.io/v1/e5b82f33-832c-43ae-83c8-c3e053a4ead7"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        // ** "나 요렇게 통신 요청 보낼거야!!" 라고 적어둔 요청서라고 보면 됨
        // URL 주소를 가지고, GET 방식을 통해, JSONEncoding 인코딩 방식으로, 헤더 정보와 함께
        // Request를 보내기 위한 정보를 묶어서 dataRequest에 저장해둡니다.
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 위에서 적어둔 요청설르 가지고 진짜 서버에 보내서 통신 Request를 하는 중
        // 통신이 완료되면 클로저를 통해서 dataRequest라는 이름으로 결과가 도착
        dataRequest.responseData { dataResponse in
            
            // dataResponse가 도착했으니, 그 안에는 통신에 대한 결과물이 있다
            // dataResponse.result는 통신 성공했는지 / 실패했는지 여부
            switch dataResponse.result {
            
            // dataResponse가 성공이면 statusCode와 response(결과데이터)를 guard let 구문을 통해서 저장해 둡니다.
            case .success:
                // dataResponse.statusCode는 Response의 statusCode - 200/400/500
                guard let statusCode = dataResponse.response?.statusCode else {return}
                // dataResponse.value는 Response의 결과 데이터
                guard let value = dataResponse.value else { return }
                
                // judgeStatus라는 함수에 statusCode와 response(결과데이터)를 실어서 보냅니다.
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
             
            // 통신 실패의 경우, completion에 pathErr값을 담아서 뷰컨으로 날려줍니다.
            // 타임아웃 / 통신 불가능의 상태로 통신 자체에 실패한 경우입니다.
            case .failure: completion(.pathErr)
            }
            
        }
    }
    
    // 아까 받은 statusCode를 바탕으로 어떻게 결과값을 처리할 건지 정의합니다.
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200: return isValidData(data: data) // 성공 -> 데이터를 가공해서 전달해줘야 하기 때문에 isValidData라는 함수로 데이터 넘격줌
        case 400: return .pathErr // -> 요청이 잘못됨
        case 500: return .serverErr // -> 서버 에러
        default: return .networkFail // -> 네트워크 에러로 분기 처리할 예정
            
        }
    }
    
    // 200대로 떨어졌을 때 데이터를 가공하기 위한 함수
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        // JSON 데이터를 해독하기 위해 JSONDecoder()를 하나 선언
        let decoder = JSONDecoder()
        
        // data를 우리가 만들어둔 PersonDataModel 형으로 decode 해준다.
        // 실패하면 pathErr로 빼고, 성공하면 decodedData에 값을 뺍니다.
        guard let decodedData = try? decoder.decode(PersonDataModel.self, from: data) else { return .pathErr }
        
        // 성공적으로 decode를 마치면 success에다가 data 부분을 담아서 completion을 호출합니다.
        return .success(decodedData.data)
    }
}
