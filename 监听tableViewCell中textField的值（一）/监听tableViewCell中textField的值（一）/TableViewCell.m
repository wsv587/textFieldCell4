//
//  TableViewCell.m
//  监听tableViewCell中textField的值（一）
//
//  Created by wangsong on 16/5/3.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()


@end


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentTextField addTarget:self action:@selector(textfieldTextDidChange:) forControlEvents:UIControlEventEditingChanged];
// 注意：不是 UIControlEventValueChanged
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.contentTextField becomeFirstResponder];
}

#pragma mark - private method
- (void)textfieldTextDidChange:(UITextField *)textField
{
    self.block(self.contentTextField.text);
}

@end
