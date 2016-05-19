//
//  CnbetaObject.swift
//  cnbetazixun
//
//  Created by 尤献利 on 16/1/13.
//  Copyright © 2016年 尤献利. All rights reserved.
//

import Foundation

class CnbetaObject: NSObject {
    var m_article_id:String!
    var m_title:String?
    var m_Description:String?
    var m_img:String?
   // var m_readed:String!
    
    init(dict:NSDictionary){
        m_article_id = dict["article_id"] as? String
        m_title = dict["title"] as? String
        m_Description = dict["Description"] as? String
        m_img = dict["img"] as? String
       // m_readed = dict["readed"] as! String
    }
    
}
