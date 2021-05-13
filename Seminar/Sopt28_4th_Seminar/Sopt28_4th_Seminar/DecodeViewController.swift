//
//  DecodeViewController.swift
//  Sopt28_4th_Seminar
//
//  Created by 김루희 on 2021/05/10.
//

import UIKit


// Decodable이라는 프로토콜은 JSON 파일을 데이터 모델로 변환해주는 것
struct CoffeeDataModel : Decodable {
    var drink : String
    var price : Int
    var orderer : String
    

    enum CodingKeys : String, CodingKey {
        
        case drink
        case price = "coffee_price"
        case orderer = "coffee_orderer"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}

class DecodeViewController: UIViewController {

    
    // 원래는 서버를 통해서 데이터를 넘겨받지만 여기서는 더미데이터로 구현
    let dummyData = """
        {
            "drink" : "아아",
            
            "coffee_order" : "heerucan"
        }
    """.data(using: .utf8)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonDecoder = JSONDecoder()
        
        do {
            // try를 써준 이유는 decode함수에 throws가 있기 때문
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("decode 성공")
            dump(order) // dump 함수는 자세한 정보를 출력하는 부분 -> JSON을 decode 해준 경우 데이터를 order에 저장했음
            
        } catch {
            print(error)
        }

    }
    
}
