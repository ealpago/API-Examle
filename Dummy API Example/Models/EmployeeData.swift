//
//  EmployeeData.swift
//  Dummy API Example
//
//  Created by Emre Alpago on 10.02.2022.
//

import Foundation

class EmployeeData:Codable {
    var id:Int?
    var employeeName:String?
    var employeeSalary:Int?
    var employeeAge:Int?
    var profileImage:String?
    
    init(id:Int?, employee_name:String?, employee_salary:Int?, employee_age:Int?, profile_image:String?){
        self.id = id
        self.employeeName = employee_name
        self.employeeSalary = employee_salary
        self.employeeAge = employee_age
        self.profileImage = profile_image
    }

    enum CodingKeys:String,CodingKey{
        case id = "id"
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
    
    public var dictionary: [String: Any?]{
        get {
            return [
                "id":id,
                "employee_name":employeeName,
                "employee_salary":employeeSalary,
                "employee_age":employeeAge,
                "profile_image":profileImage
            ]
        }
    }
}
