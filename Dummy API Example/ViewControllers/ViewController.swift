//
//  ViewController.swift
//  Dummy API Example
//
//  Created by Emre Alpago on 10.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        NetworkManager.service.request(requestRoute: .getEmployee(id: "1"), responseModel: Employee.self) { details in
//            print(details.data?.employeeName ?? "employeeName")
//            print(details.data?.employeeAge ?? "employeeAge")
//        }
//        
//        NetworkManager.service.request(requestRoute: .getEmployees, responseModel: Employees.self) { details in
//            print(details.data?[3].id ?? "Employees 4 id")
//        }
//        
        let requestModel = CreateEmployeeData(name: "Emre", salary: "123", age: "456")
//
//
        NetworkManager.service.request(requestRoute: .createEmployee(employee: requestModel), responseModel: EmployeeDataResponse.self) { details in
//            if details.data.name == requestModel.name{
//                print("true")
//            } else{
//                print("false")
//            }
        }
        
    }
}

