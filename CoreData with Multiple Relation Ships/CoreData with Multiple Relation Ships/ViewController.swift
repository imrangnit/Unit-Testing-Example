//
//  ViewController.swift
//  CoreData with Multiple Relation Ships
//
//  Created by Mohd Imran on 2/20/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataSource:[[String:Any]] = []
    @IBOutlet weak var tableview:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        downloadArticles()
        
//        CoreDataManager.sharedInstance.getArticles()
//        return
//        
        
        if let path = Bundle.main.path(forResource: "article_data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                guard let dic = jsonResult as? [String:Any] else {
                    return
                }
                
                guard let article_data = dic["data"] as? [String:Any] else {
                    return
                }
                
                guard let articles = article_data["articles"] as? [[String:Any]] else {
                    return
                }
                
                dataSource = articles
                tableview.reloadData()
                
//                for objArticles in articles{
//
//                    CoreDataManager.sharedInstance.addArticle(withArticle: objArticles)
//
//                    print("Articles ----> ",objArticles)
//                }
                
            } catch {
                // handle error
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        let dic:[String:Any] = dataSource[indexPath.row]
        
        let titleInfo = dic["title"] as? [String:Any]
        let eng_title = titleInfo?["en"] as? String
        let publicationinfo = dic["publication"] as? [String:Any]
        let name = publicationinfo?["name"] as? [String:Any]
        let eng_name = name?["en"] as? String
        
        let publishedDate = (dic["publish_date"] as? String)
        
        cell.articleTitle.text = eng_title
        cell.articlePublisher.text = eng_name
        cell.articlePublishedDate.text = publishedDate
        
        return cell
    }
    
}

extension ViewController{
    
    func downloadArticles() -> Void {
        
        guard let url = URL(string:"http://localhost/api/api.php") else {
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = "GET"
        
        
        
        
        let sConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sConfig)
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {(data:Data?,response:URLResponse?,error:Error?)->Void in
            
            if let value = data {
                //JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions.prettyPrinted)
                let jsonObject = try? JSONSerialization.jsonObject(with: value, options: JSONSerialization.ReadingOptions.mutableLeaves)
                
                print(jsonObject)
            }
            
            
        })
        
        dataTask.resume()
    }
    
}

