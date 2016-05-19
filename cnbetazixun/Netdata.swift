//
//  Netdata.swift
//  cnbetazixun
//
//  Created by 尤献利 on 16/1/13.
//  Copyright © 2016年 尤献利. All rights reserved.
//

//获取首页新闻
//https://cnbeta1.com/api/getArticles
//获取更多新闻
//https://cnbeta1.com/api/getMoreArticles/{fromArticleID} {fromArticleID}是上次获取的最后一条新闻的ID
//获取新闻详情
//https://cnbeta1.com/api/getArticleDetail/{ArticleID} {ArticleID}是新闻的ID

import UIKit

class Netdate: NSObject {
    var m_CnbetaUrl = "https://cnbeta1.com/api/"
    func netCnbeta(article:String,completion:(([CnbetaObject]?)->Void)){
        m_CnbetaUrl += article
//        print(m_CnbetaUrl)
        let url = NSURL(string: m_CnbetaUrl)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let urlsession = NSURLSession(configuration: config)
        let task = urlsession.dataTaskWithURL(url!) { (data, _, error) -> Void in
            
            if error != nil{
                print("error!.userInfo:\(error!.userInfo)")
    
            }else{
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? [NSDictionary]
                    let m_json_Dic = json!.map({ (danarray:NSDictionary) -> CnbetaObject in
                        var newitem = ["article_id" : danarray["article_id"] as! String]
                        newitem["title"] = danarray["title"] as? String
                        newitem["Description"] = danarray["intro"] as? String
                        newitem["img"] = danarray["topic"] as? String
                      //  newitem["readed"] = "false"
//                        print("newitem:\(newitem)")
                        return CnbetaObject(dict: newitem)
                    })
//                    print("m_json_Dic:\(m_json_Dic[0].m_Description!)")
                    dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                        completion(m_json_Dic)
                        print("获取完成！！！！！！！！！！")
                    })
                }catch {
                    
                        print("error:\(error)")
                    
                }
            }
        }
        task.resume()
    }
    
}
