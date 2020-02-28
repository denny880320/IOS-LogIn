

import UIKit
import SwiftKeychainWrapper//https://medium.com/ios-os-x-development/securing-user-data-with-keychain-for-ios-e720e0f9a8e2

class ViewController: UIViewController {
   // var LoginInfoApi = makePostCall()
    

    @IBOutlet weak var emailAddr: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //makePostCall()//.getinfoURLsession()
        
        /*old code to paste
        let session = URLSession.shared
        let url = "http://127.0.0.1:3000/api/sign-in"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var params :[String: Any]?
        params = ["email" : "admin@adsmodo.com", "password" : "admin"]
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
        }
        */
        
        /*
        let preferences = UserDefaults.standard
        
        if(preferences.object(forKey: "session") != nil)
        {
            LoginDone()
        }
        else
        {
            LoginToDo()
        }

*/
    }

    
    @IBAction func Button(_ sender: Any) {
      /*  if(signIn.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
            return
        }
        */
        
        let username = emailAddr.text

        /*let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "userPassword")
        print("Retrieved passwork is: \(retrievedPassword!)")*/
        
       let password = self.password.text
        
        if(username == "")
        {
            return
        }
        
        let session = URLSession.shared
        let url = "http://127.0.0.1:3000/api/sign-in"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue(token, forHTTPHeaderField: "Authorization")
     
        
        /*if let password = self.password.text {
            let saveSuccessful: Bool = KeychainWrapper.standard.set(password, forKey: "admin")
            print("Save was successful: \(saveSuccessful)")
        }
        let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "admin")
        print("Retrieved passwork is: \(retrievedPassword!)")
*/

        var params :[String: Any]?
        params = ["email" : username/*"admin@adsmodo.com"*/, "password" : password/*"admin"*/]
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
                
               /*weird codes
                 guard let server_response = jsonResponse as? NSDictionary else
                {
                    return
                }
            if let data_block = server_response["data"] as? NSDictionary
                {
                    if let session_data = data_block["session"] as? String
                    {
                        let preferences = UserDefaults.standard
                        preferences.set(session_data, forKey: "session")
                        
                        DispatchQueue.main.async (
                            execute:self.LoginDone
                        )
                    }
                }*/
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
    }
        let saveSuccessful: Bool = KeychainWrapper.standard.set(password!, forKey: "passw")
        print("Save was successful: \(saveSuccessful)")
        let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "passw")
        print("Retrieved passwork is: \(retrievedPassword!)")
    }
    //In order to remove
    //let removeSuccessful: Bool = KeychainWrapper.standard.remove(key: "myKey")
    
    
    /*Unused function
    func LoginToDo()
    {
        emailAddr.isEnabled = true
        password.isEnabled = true
        
        signIn.setTitle("Login", for: .normal)
    }
    
    func LoginDone()
    {
        emailAddr.isEnabled = false
        password.isEnabled = false
        
        signIn.setTitle("Logout", for: .normal)
    }*/

}
