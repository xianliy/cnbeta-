//
//  customTableViewCell.swift
//  cnbetazixun
//
//  Created by 尤献利 on 16/5/18.
//  Copyright © 2016年 尤献利. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    var cellimageView :UIImageView!
    var cellmainLable:UILabel!
    var cellsubLable:UILabel!
    var cellreaded:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellimageView = UIImageView()//frame:CGRectMake(self.frame.width - 32, 3, 64, 64)
        cellimageView.frame = CGRectZero
//        cellimageView.center = CGPoint(x: self.frame.height/2, y: self.frame.width + 32)
        cellimageView.layer.cornerRadius = 32
        cellimageView.layer.borderWidth = 5.0
        cellimageView.layer.borderColor = UIColor(red:0.31, green:0.51, blue:0.71, alpha:1.00).CGColor
        cellimageView.layer.masksToBounds = true
        self.contentView.addSubview(cellimageView)
    
        cellreaded = UIImageView()
        cellreaded.frame = CGRectZero
        self.contentView.addSubview(cellreaded)

        cellmainLable = UILabel()//frame:CGRectMake(10,0,self.frame.width - 64,32)
        cellmainLable.frame = CGRectZero
        cellmainLable.numberOfLines = 0
        cellmainLable.font = UIFont.systemFontOfSize(14)
        cellmainLable.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentView.addSubview(cellmainLable)
        
        cellsubLable = UILabel()//frame: CGRectMake(10,33,self.frame.width - 64,32)
        cellsubLable.frame = CGRectZero
        cellsubLable.numberOfLines = 0
        cellsubLable.font = UIFont.systemFontOfSize(12)
        cellsubLable.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentView.addSubview(cellsubLable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
