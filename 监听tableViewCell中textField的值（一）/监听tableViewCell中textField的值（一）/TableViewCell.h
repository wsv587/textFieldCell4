//
//  TableViewCell.h
//  监听tableViewCell中textField的值（一）
//
//  Created by wangsong on 16/5/3.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
/**
 *  cell的标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 *  cell的文本框
 */
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

/**
 *  block 参数为textField.text
 */
@property (copy, nonatomic) void(^block)(NSString *);

@end
