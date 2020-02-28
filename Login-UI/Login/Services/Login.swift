//
//  File.swift
//  LoginExample
//
//  Created by 蔡奕民 on 2020/2/12.
//

import Foundation

/*
let session = URLSession.shared
let url = "http://127.0.0.1:3000/api/sign-in"
let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
request.httpMethod = "POST"
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
var params :[String: Any]?
params = ["Some_ID" : "111", "REQUEST" : "SOME_API_NAME"]
do{
    request.httpBody = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
    let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
        if let response = response {
            let nsHTTPResponse = response as! HTTPURLResponse
            let statusCode = nsHTTPResponse.statusCode
            print ("status code = \(statusCode)")
        }
        if let error = error {
            print ("\(error)")
        }
        if let data = data {
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                print ("data = \(jsonResponse)")
            }catch _ {
                print ("OOps not good JSON formatted response")
            }
        }
    })
    task.resume()
}catch _ {
    print ("Oops something happened buddy")
}*/
 
/*
func makePostCall() {
    guard let todosURL = URL(string: SignInURL) else {
        print("Error: cannot create URL")
        return
    }
var todosUrlRequest = URLRequest(url: todosURL)
todosUrlRequest.httpMethod = "POST"
let newTodo: [String: Any] = ["title": "My First todo", "completed": false, "userId": 1]
let jsonTodo: Data
do {
    jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
    todosUrlRequest.httpBody = jsonTodo
} catch {
    print("Error: cannot create JSON from todo")
    return
}

let session = URLSession.shared

let task = session.dataTask(with: todosUrlRequest) {
    (data, response, error) in
    guard error == nil else {
        print("error calling POST on /todos/1")
        print(error!)
        return
    }
    guard let responseData = data else {
        print("Error: did not receive data")
        return
    }
    
    // parse the result as JSON, since that's what the API provides
    do {
        guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
                                                                  options: []) as? [String: Any] else {
                                                                    print("Could not get JSON from responseData as dictionary")
                                                                    return
        }
        print("The todo is: " + receivedTodo.description)
        
        guard let todoID = receivedTodo["id"] as? Int else {
            print("Could not get todoID as int from JSON")
            return
        }
        print("The ID is: \(todoID)")
    } catch  {
        print("error parsing response from POST on /todos")
        return
    }
    }
    task.resume()
}
    /*
class getLoginInfoApi{
    func getinfoURLsession(){
        
        guard let url = URL(string: SignInURL) else {return}
        
        let task = URLSession.shared.dataTask(with:url){(data, response, error) in
            
            guard error == nil else{
                debugPrint(error.debugDescription)
                return
            }
            
      /*     guard let data = data else {return}
            
            do{
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String:Any] else{return}
                print(json)
            } catch{
                debugPrint(error.localizedDescription)
                return
            }
 */
            print("Data: = \(data)")
            print("Response: = \(response)")
        }
        task.resume()
    }
}*/*/
