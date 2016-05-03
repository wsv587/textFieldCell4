//
//  CustomTextField.h
//  监听tableViewCell中textField的值（一）
//
//  Created by wangsong on 16/5/3.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextField : UITextField
/**
 *  indexPath属性用于区分不同的cell
 */
@property (strong, nonatomic) NSIndexPath *indexPath;
@end
