//
//  CnbetaNewsViewController.swift
//  cnbetazixun
//
//  Created by 尤献利 on 16/1/13.
//  Copyright © 2016年 尤献利. All rights reserved.
//

import UIKit

class CnbetaNewsViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    var m_tableView : UITableView?
    var Identifier = "m_cell"
    let ii = Netdate()
   
//    var m_news:Dictionary<String,String> = [:]
    var m_new:[CnbetaObject] = []//{
//        didSet{
//            m_tableView?.reloadData()
//            print("刷新完成")
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CNbeta新闻"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red:0.31, green:0.51, blue:0.71, alpha:1.00)]
        
        self.view.backgroundColor = UIColor.whiteColor()
//        UIcnbeta()
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UIcnbeta(){
        m_tableView = UITableView(frame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64), style: UITableViewStyle.Plain)
//        let nib = UINib(nibName: "customTableViewCell", bundle: nil)
//        m_tableView?.registerNib(nib, forCellReuseIdentifier: Identifier)
        
        m_tableView?.tableFooterView = UIView()
        m_tableView?.registerClass(customTableViewCell.self, forCellReuseIdentifier: Identifier)
        m_tableView?.delegate = self
        m_tableView?.dataSource = self
        m_tableView?.estimatedRowHeight = 60
        m_tableView?.rowHeight = UITableViewAutomaticDimension
        m_tableView?.showsHorizontalScrollIndicator = false
        m_tableView?.showsVerticalScrollIndicator = false
//        m_tableView?.tableFooterView = UIView()
        self.view.addSubview(m_tableView!)
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let zhuangtai = UIApplication.sharedApplication()
        zhuangtai.networkActivityIndicatorVisible = true
        ii.netCnbeta("getArticles") { (m_n) in
            self.m_new = m_n!
            self.UIcnbeta()
        }
        zhuangtai.networkActivityIndicatorVisible = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m_new.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: Identifier)
//        cell.textLabel?.text = m_new[indexPath.item].m_title!
//        cell.detailTextLabel?.text = m_new[indexPath.item].m_Description!
//        print(m_new[indexPath.item].m_img)
//        let url = NSURL(string: m_new[indexPath.item].m_img!)
//        let data = NSData(contentsOfURL: url!)!
//        let image = UIImage(data: data, scale: 1.0)
//        cell.imageView?.image = image
//        cell.imageView?.frame = CGRectMake(32, 32, 32, 32)
//        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        cell.textLabel?.numberOfLines = 0
//        cell.detailTextLabel?.numberOfLines = 0
//        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        let cell = tableView.dequeueReusableCellWithIdentifier(Identifier, forIndexPath: indexPath) as! customTableViewCell
        cell.cellmainLable.text = m_new[indexPath.item].m_title
        cell.cellsubLable.text = m_new[indexPath.item].m_Description
        let sortUrl = m_new[indexPath.item].m_img
        if (sortUrl! as NSString).pathExtension != "gif"{
            let url = NSURL(string: sortUrl!)!
            let data = NSData(contentsOfURL: url)
            let image = UIImage(data: data!, scale: 1.0)
            cell.cellimageView.image = image
        }else{
            cell.cellimageView.image = UIImage(named: "cnbetalogo")
        }
        cell.cellimageView.frame = CGRectMake(self.view.frame.width - 100, 3, 64, 64)
        cell.cellmainLable.frame = CGRectMake(10, 0, self.view.frame.width - 110, 70)
//        cell.cellreaded.image = UIImage(named: "readed")
        
//        if (m_new[indexPath.item].m_readed != "false"){
//            cell.cellreaded.frame = CGRectMake(self.view.frame.width - 100, 3, 64, 64)
//        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.item)
        print(m_new[indexPath.item].m_title!)
        //取消灰色标识
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //m_new[indexPath.item].m_readed = "true"
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 70
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
