//
//  Utility.swift
//  CoreData with Multiple Relation Ships
//
//  Created by Mohd Imran on 3/5/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func isValidEmail(withEmail email:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    class func isValidLogin(withEmail email:String, withPassword password:String) -> Bool{
        
        let correct_email = "test@example.com"
        let correct_password = "123456"
        
        if Utility.isValidEmail(withEmail: email) == false{
            return false
        }
        
        if email == correct_email && password == correct_password{
            
            return true
        }
        
        return false
        
    }
    
}
