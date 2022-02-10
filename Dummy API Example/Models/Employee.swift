//
//  Employee.swift
//  Dummy API Example
//
//  Created by Emre Alpago on 10.02.2022.
//

import Foundation

class Employee: Codable {
    var status:String?
    var data: EmployeeData?
    
    init(status:String?, data:EmployeeData?){
        self.status = status
        self.data = data
    }
    
    public var dictionary: [String: Any?]{
        get {
            return [
                "status":status,
                "data":data?.dictionary
            ]
        }
    }
}
