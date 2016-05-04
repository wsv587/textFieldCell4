//
//  TableViewController.m
//  监听tableViewCell中textField的值（一）
//
//  Created by wangsong on 16/5/3.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "CustomTextField.h"

@interface TableViewController ()
/**
 *  标题
 */
@property(nonatomic, strong) NSArray *titles;
/**
 *  占位文字
 */
@property(nonatomic, strong) NSArray *placeHolders;

/**
 *  姓名
 */
@property(nonatomic, copy) NSString *name;

/**
 *  年龄
 */
@property(nonatomic, copy) NSString *age;

/**
 *  地址
 */
@property(nonatomic, copy) NSString *address;
@end

@implementation TableViewController
    static NSString * const ID = @"textFieldCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubmitButton];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *customCell = (TableViewCell *)cell;
    customCell.titleLabel.text = self.titles[indexPath.row];
    customCell.contentTextField.placeholder = self.placeHolders[indexPath.row];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                customCell.block = ^(NSString *text){
                    self.name = text;
                };
                break;
            }
            case 1:
            {
                customCell.block = ^(NSString *text){
                    self.age = text;
                };
                break;
            }
            case 2:
            {
                customCell.block = ^(NSString *text){
                    self.address = text;
                };
                break;
            }
            default:
                break;
        }
    } else if (indexPath.section == 1) {
        // 同上，请自行脑补
    } else {
        // 同上，请自行脑补
    }
}

#pragma mark - private method
- (void)setupSubmitButton
{
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 60)];
    [self.view addSubview:submitButton];
    [submitButton setBackgroundColor:[UIColor redColor]];
    [submitButton setTitle:@"提交" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickButton:(UIButton *)button
{
    NSLog(@"姓名：%@,年龄：%@，地址：%@",self.name,self.age,self.address);
}

- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"姓名",@"年龄",@"地址"];
    }
    return _titles;
}

- (NSArray *)placeHolders
{
    if (!_placeHolders) {
        _placeHolders = @[@"请输入姓名",@"请输入年龄",@"请输入地址"];
    }
    return _placeHolders;
}

@end
