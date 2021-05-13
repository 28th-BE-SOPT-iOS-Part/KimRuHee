//
//  ViewController.swift
//  Sopt28_4th_Seminar
//
//  Created by 김루희 on 2021/05/04.
//

import UIKit
import Alamofire

// Encodable은 우리의 데이터 모델을 JSON 형식으로 변환해주는 것
struct PersonDataModel2 : Encodable {
    var name : String
    var age : Int
}

class EncodeViewController: UIViewController {
    
    let personData = PersonDataModel2(name: "철수", age: 10)

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted // JSON을 보기 좋게 출력하기 위한 프로퍼티
       
        // 오류를 처리해주기 위한 구문 - do catch
        do {
            // 오류가 발생하는 함수(= throw가 붙어 있는 함수)를 실행하기 위해서는 필요한 키워드가 try
            // 여기서 try를 써준 이유는 encode 함수는 throws가 붙어 있기 때문
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
            
        } catch {
            // catch는 던진 오류를 잡기 위해서 예외처리해주는 곳
            print(error)
        }
    }


}

