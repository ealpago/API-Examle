//
//  CreateEmployeeData.swift
//  Dummy API Example
//
//  Created by Emre Alpago on 10.02.2022.
//

import Foundation

public class CreateEmployeeData: Codable{
    var name:String
    var salary:String
    var age:String
    var id:Int?
    
    init(name:String, salary:String, age:String){
        self.name = name
        self.salary = salary
        self.age = age
    }
//
    enum CodingKeys:String,CodingKey{
        case name = "name"
        case salary = "salary"
        case age = "age"
    }
//
    public var dictionary: [String: Any]{
        get {
            return [
                "name":name,
                "salary":salary,
                "age":age,
            ]
        }
    }
}


//{
//    "status": "success",
//    "data": {
//        "name": "test",
//        "salary": "123",
//        "age": "23",
//        "id": 4460
//    },
//    "message": "Successfully! Record has been added."
//}



// MARK: - EmployeeDataResponse
public struct EmployeeDataResponse: Codable {
    let status: String
    let dataResponse: DataClass
    let message: String
    
    enum CodingKeys:String,CodingKey{
        case dataResponse = "data"
        case status
        case message
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let name, salary, age: String
    let id: Int
}
