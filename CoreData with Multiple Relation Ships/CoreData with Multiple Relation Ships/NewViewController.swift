//
//  NewViewController.swift
//  CoreData with Multiple Relation Ships
//
//  Created by Mohd Imran on 2/21/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String?
    var age:Int?
    
    convenience init(withData data:[String:Any]) {
        self.init()
        
        name = data["name"] as? String
        age  = data["age"] as? Int
    }
}

class NewViewController: UIViewController {

    var objPerson:Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getPersonName() -> String? {
        
        return objPerson?.name
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
