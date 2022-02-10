//
//  NetworkService.swift
//  Dummy API Example
//
//  Created by Emre Alpago on 10.02.2022.
//

import Foundation

struct Constants{
    static let baseURL = "http://dummy.restapiexample.com/api/v1/"
}

public enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


public enum NetworkRouter{
    case getEmployee(id:String)
    case getEmployees
    case createEmployee(employee:CreateEmployeeData)
    case deleteEmployee(id:String)
    case updateEmployee(id:String)
    
    
    
    public var method:HTTPMethod {
        switch self {
        case .getEmployee( _):
            return .get
        case .getEmployees:
            return .get
        case .createEmployee:
            return .post
        case .deleteEmployee(_):
            return .delete
        case .updateEmployee( _):
            return .put
        }
    }
    
    public var path:String{
        switch self {
        case .getEmployee(let id):
            return Constants.baseURL + "employee/\(id)"
        case .getEmployees:
            return Constants.baseURL + "employees"
        case .createEmployee:
            return Constants.baseURL + "create"
        case .deleteEmployee(id: let id):
            return Constants.baseURL + "delete/\(id)"
        case .updateEmployee(id: let id):
            return Constants.baseURL + "update/\(id)"
        }
    }
    
    public var body: [String:Any]? {
        switch self{
        case.createEmployee(let employee):
            return employee.dictionary 
        default:
            return nil
        }
    }
}

class NetworkManager {
    static let service = NetworkManager()
    //urlRequest Body nasıl gönderilir
    public func request<T: Codable>(requestRoute: NetworkRouter, responseModel:T.Type, completion:@escaping (_ details: T) -> Void){
        if let url = URL(string: requestRoute.path){
            var request = URLRequest(url: url)
            request.httpMethod = requestRoute.method.rawValue
            if let body = requestRoute.body {
                let jsonData = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                request.httpBody = jsonData
            }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                do {
                    let data = try JSONDecoder().decode(T.self, from: data!)
                    completion(data)
                } catch let e as NSError {
                    print("error : \(e)")
                }
            }
            task.resume()
        }
    }
}


//let url = URL(string: "http://www.thisismylink.com/postName.php")!
//var request = URLRequest(url: url)
//request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//request.httpMethod = "POST"
//let parameters: [String: Any] = [
//    "id": 13,
//    "name": "Jack & Jill"
//]
//request.httpBody = parameters.percentEncoded()
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    guard let data = data,
//        let response = response as? HTTPURLResponse,
//        error == nil else {                                              // check for fundamental networking error
//        print("error", error ?? "Unknown error")
//        return
//    }
//
//    guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
//        print("statusCode should be 2xx, but is \(response.statusCode)")
//        print("response = \(response)")
//        return
//    }
//
//    let responseString = String(data: data, encoding: .utf8)
//    print("responseString = \(responseString)")
//}
//
//task.resume()


//urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])


