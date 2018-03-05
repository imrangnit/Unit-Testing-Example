//
//  CoreData_with_Multiple_Relation_ShipsTests.swift
//  CoreData with Multiple Relation ShipsTests
//
//  Created by Mohd Imran on 2/20/18.
//  Copyright © 2018 Mohd Imran. All rights reserved.
//

import XCTest
@testable import CoreData_with_Multiple_Relation_Ships
import CoreData

class CoreData_with_Multiple_Relation_ShipsTests: XCTestCase {
    
    var objVC:NewViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSaveData() -> Void {
        
        let value1 = true
        let value2 = false
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveData(withVaue: value1), !value1)
        XCTAssertEqual(CoreDataManager.sharedInstance.saveData(withVaue: value2), !value2)
        
        
    }
    /*
    func testAssignPerson() -> Void {
       
       let objPerson = Person(withData: ["name":"mohd imran","age":30])
       
       let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! NewViewController
        
       vc.objPerson = objPerson
       XCTAssertEqual(vc.getPersonName(), objPerson.name)
       vc.objPerson = nil
       XCTAssertNil(vc.getPersonName(), "No Person is assign")
        
    }*/
    
    func testAddArticlewithoutTitle() -> Void {
        
        let dic5:[String:Any] = ["annotations": [],
                                 "article_id": "5a53654ebc7f86bebc672b93",
                                 "author": [],
                                 "description": [
                                    "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                                    "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                                 "images": [],
                                 "keywords": [],
                                 "location": [],
                                 "publication": [
                                    "name": [
                                        "cn": "中國時報",
                                        "en": "China Times"
                                    ],
                                    "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                                 "publish_date": "2018-01-06 20:01:00",
                                 "rank": 1,
                                 "saved": false,
                                 "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: dic5), false)
    }
    
    func testAddArticlewithoutPublication() -> Void {
        
        let publication = ["publication": [
            "name": [
                "cn": "中國時報",
                "en": "China Times"
            ],
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication), true)
        
        let publication5 = ["publication": ""]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication5), false)
        
        let publication2 = ["publication": [
            "name": "",
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication2), false)
        
        let publication3 = ["publication": [
            "name": [
                "cn": "中國時報",
                "en": 767875
            ],
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication3), false)
        
        
    }
    
    func testAddArticle() -> Void {
        
        let dic1:[String:Any] = ["annotations": [],
        "article_id": "5a53654ebc7f86bebc672b93",
        "author": [],
        "description": [
            "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
            "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
        ],
        "images": [],
        "keywords": [],
        "location": [],
        "original_lang": "zh",
        "publication": [
            "name": [
                "cn": "中國時報",
                "en": "China Times"
            ],
            "publication_id": "5a05a83363fd5b2dbd330714"
        ],
        "publish_date": "2018-01-06 20:01:00",
        "rank": 1,
        "saved": false,
        "title": [
            "cn": "地方掃描－妨害性自主加傷害 男子判刑",
            "en": "Local scanning - impeding autonomy plus injury to men sentenced"
        ],
        "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: dic1), true)
        
        let dic2:[String:Any] = ["annotations": [],
                                 "article_id": "5a53654ebc7f86bebc672b93",
                                 "author": [],
                                 "images": [],
                                 "keywords": [],
                                 "location": [],
                                 "original_lang": "zh",
                                 "publication": [
                                    "name": [
                                        "cn": "中國時報",
                                        "en": "China Times"
                                    ],
                                    "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                                 "publish_date": "2018-01-06 20:01:00",
                                 "rank": 1,
                                 "saved": false,
                                 "title": [
                                    "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                    "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                                 "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: dic2), false)
        
        let dic3:[String:Any] = ["annotations": [],
                                 "article_id": "5a53654ebc7f86bebc672b93",
                                 "author": [],
                                 "images": [],
                                 "keywords": [],
                                 "location": [],
                                 "original_lang": "zh",
                                 "publication": [
                                    "name": [
                                        "cn": "中國時報",
                                        "en": "China Times"
                                    ],
                                    
            ],
                                 "publish_date": "2018-01-06 20:01:00",
                                 "rank": 1,
                                 "saved": false,
                                 "title": [
                                    "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                    "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                                 "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: dic3), false)
        
        let dic4:[String:Any] = ["annotations": [],
                                 "article_id": "5a53654ebc7f86bebc672b93",
                                 "author": [],
                                 "description": [
                                    "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                                    "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                                 "images": [],
                                 "keywords": [],
                                 "location": [],
                                 "publication": [
                                    "name": [
                                        "cn": "中國時報",
                                        "en": "China Times"
                                    ],
                                    "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                                 "publish_date": "2018-01-06 20:01:00",
                                 "rank": 1,
                                 "saved": false,
                                 "title": [
                                    "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                    "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                                 "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: dic4), true)
        
        
        let publication:[String:Any] = ["annotations": [],
                           "article_id": "5a53654ebc7f86bebc672b93",
                           "author": [],
                           "description": [
                            "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                            "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                           "images": [],
                           "keywords": [],
                           "location": [],
                           "publication": [
                            "name": [
                                "cn": "中國時報",
                                "en": "China Times"
                            ],
                            "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                           "publish_date": "2018-01-06 20:01:00",
                           "rank": 1,
                           "saved": false,
                           "title": [
                            "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                            "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                           "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: publication), true)
        
        let publication5:[String:Any] = ["annotations": [],
                            "article_id": "5a53654ebc7f86bebc672b93",
                            "author": [],
                            "description": [
                                "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                                "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                            "images": [],
                            "keywords": [],
                            "location": [],
                            "publication": "",
                            "publish_date": "2018-01-06 20:01:00",
                            "rank": 1,
                            "saved": false,
                            "title": [
                                "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                            "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: publication5), false)
        
        let publication2:[String:Any] = ["annotations": [],
                            "article_id": "5a53654ebc7f86bebc672b93",
                            "author": [],
                            "description": [
                                "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                                "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                            "images": [],
                            "keywords": [],
                            "location": [],
                            "publication": [
                                "name": "",
                                "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                            "publish_date": "2018-01-06 20:01:00",
                            "rank": 1,
                            "saved": false,
                            "title": [
                                "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                            "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: publication2), false)
        
        let publication3:[String:Any] = ["annotations": [],
                            "article_id": "5a53654ebc7f86bebc672b93",
                            "author": [],
                            "description": [
                                "cn": "台中：在大陸工作的陳男利用返台休假時，與在交友網站認識的年僅12歲少女碰面，並2度發生性關係，陳男疑為增加刺激感，持藤條毆打少女臀部、呼巴掌。少女家人發現其臉部紅腫，追問後報警。台中高分院依妨害性自主罪判陳男4年6月徒刑、傷害罪部分判4月。\n(中國時報)",
                                "en": "Taichung: Chen, who works in mainland China, used to return to Taiwan for a break. She met with a 12-year-old girl who was acquainted with her dating website and had a sexual relationship of 2 degrees. Chan Chan-chan added a sense of excitement and rattled the girl&#39;s buttocks. hand. The girl&#39;s family found that her face was swollen and questioned after the police. Taichung High Branch Court sentenced Chen Nan to a sentence of 4 years in June and sentenced him to April for some injury. (China Times)"
            ],
                            "images": [],
                            "keywords": [],
                            "location": [],
                            "publication": [
                                "name": [
                                    "cn": "中國時報",
                                    "en": 12345
                                ],
                                "publication_id": "5a05a83363fd5b2dbd330714"
            ],
                            "publish_date": "2018-01-06 20:01:00",
                            "rank": 1,
                            "saved": false,
                            "title": [
                                "cn": "地方掃描－妨害性自主加傷害 男子判刑",
                                "en": "Local scanning - impeding autonomy plus injury to men sentenced"
            ],
                            "topics": []]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.addArticle(withArticle: publication3), false)
        
    }
    
    func testSaveAnnotation() -> Void {
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveAnnotation(withArticle: NSManagedObject(), withAnnotationArray: []), false)
        
        let dic:[String:Any] = ["annotation_id":"ajhjkh867868","language":"EN","path":"jkkjghghkjg","created_at":"2018-02-20 13:05:23","position":"TOP","text":"TESTING","text_range":"20,20","method":"DRAW"]
        
        let entityDesc = NSEntityDescription.entity(forEntityName: "Article", in: CoreDataManager.sharedInstance.persistentContainer.viewContext)
        

        let obj =  NSManagedObject(entity: entityDesc!, insertInto: CoreDataManager.sharedInstance.persistentContainer.viewContext) as! Article
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveAnnotation(withArticle: obj, withAnnotationArray: [dic]), true)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveAnnotation(withArticle: obj, withAnnotationArray: [["annotation_id":121313,"language":89.9090,"path":8908098,"created_at":"asdadads","position":121212,"text":121212,"text_range":20,"method":11212]]), true)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveAnnotation(withArticle: obj, withAnnotationArray: [["annotation_id":121313,"language":89.9090,"path":8908098,"created_at":"asdadads","position":121212,"text":121212,"text_range":20,"method":11212]]), true)
    }
    
    func testcheckPublicationData() -> Void {
        
        let publication = ["publication": [
            "name": [
                "cn": "中國時報",
                "en": "China Times"
            ],
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication), true)
        
        let publication5 = ["publication": ""]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication5), false)
        
        let publication2 = ["publication": [
            "name": "",
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication2), false)
        
        let publication3 = ["publication": [
            "name": [
                "cn": "中國時報",
                "en": 767875
            ],
            "publication_id": "5a05a83363fd5b2dbd330714"
            ]]
        
        XCTAssertEqual(CoreDataManager.sharedInstance.checkPublicationData(withArticle: publication3), false)
    }
    
    func testSaveTopic() -> Void {
        
        let topicObject = NSManagedObject()
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: topicObject, withTopicArray: []), false)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: topicObject, withTopicArray: [["name":["cn":"iuiyiuy","en":"kjhkjhjkh"],"id":"878979879"]]), false)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: topicObject, withTopicArray: [["name":["cn":"iuiyiuy","en":121312],"id":1212121]]), false)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: topicObject, withTopicArray: [["name":"","id":1212121]]), false)
        
        let entityDesc = NSEntityDescription.entity(forEntityName: "Article", in: CoreDataManager.sharedInstance.persistentContainer.viewContext)
        
        
        let obj =  NSManagedObject(entity: entityDesc!, insertInto: CoreDataManager.sharedInstance.persistentContainer.viewContext) as! Article
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: obj, withTopicArray: [["name":["cn":"iuiyiuy","en":"kjhkjhjkh"],"id":"878979879"]]), true)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.saveTopic(withArticle: obj, withTopicArray: [["name":["cn":"iuiyiuy","en":"kjhkjhjkh"],"id":123456]]), true)
    }
    
    func testGetContext() -> Void {
        
        XCTAssertEqual(CoreDataManager.sharedInstance.getContext(), CoreDataManager.sharedInstance.persistentContainer.viewContext)
        
    }
    
    func testGetAnnotationEntity() -> Void {
        
        let obj = NSEntityDescription.entity(forEntityName: "Annotation", in: CoreDataManager.sharedInstance.persistentContainer.viewContext)
        
        XCTAssertEqual(CoreDataManager.sharedInstance.getAnnotationEntity(), obj)
        
    }
    
}
