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
/**
 *  公司
 */
@property(nonatomic, copy) NSString *company;
/**
 *  性别
 */
@property(nonatomic, copy) NSString *gender;
/**
 *  爱好
 */
@property(nonatomic, copy) NSString *Hobby;
/**
 *  身高
 */
@property(nonatomic, copy) NSString *height;
/**
 *  体重
 */
@property(nonatomic, copy) NSString *weight;

@end

@implementation TableViewController
    static NSString * const ID = @"textFieldCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubmitButton];
    self.tableView.rowHeight = 150.f;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:ID];
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
            case 3:
            {
                customCell.block = ^(NSString *text){
                    self.company = text;
                };
                break;
            }
            case 4:
            {
                customCell.block = ^(NSString *text){
                    self.gender = text;
                };
                break;
            }
            case 5:
            {
                customCell.block = ^(NSString *text){
                    self.Hobby = text;
                };
                break;
            }
            case 6:
            {
                customCell.block = ^(NSString *text){
                    self.height = text;
                };
                break;
            }
            case 7:
            {
                customCell.block = ^(NSString *text){
                    self.weight = text;
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
    return customCell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *customCell = (TableViewCell *)cell;
    customCell.titleLabel.text = self.titles[indexPath.row];
    customCell.contentTextField.placeholder = self.placeHolders[indexPath.row];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            customCell.contentTextField.text = self.name;
        } else if (indexPath.row == 1) {
            customCell.contentTextField.text = self.age;
        } else if (indexPath.row == 2){
            customCell.contentTextField.text = self.address;
        } else if (indexPath.row == 3){
            customCell.contentTextField.text = self.company;
        } else if (indexPath.row == 4){
            customCell.contentTextField.text = self.gender;
        } else if (indexPath.row == 5){
            customCell.contentTextField.text = self.Hobby;
        } else if (indexPath.row == 6){
            customCell.contentTextField.text = self.height;
        } else if (indexPath.row == 7){
            customCell.contentTextField.text = self.weight;
        } else {
            customCell.contentTextField.text = nil;
        }
        // 必须有else!
    } else {
        // 切记：对于cell的重用，有if，就必须有else。因为之前屏幕上出现的cell离开屏幕被缓存起来时候，cell上的内容并没有清空，当cell被重用时，系统并不会给我们把cell上之前配置的内容清空掉，所以我们在else中对contentTextField内容进行重新配置或者清空（根据自己的业务场景而定）
        customCell.contentTextField.text = [NSString stringWithFormat:@"第%ld组,第%ld行",indexPath.section,indexPath.row];
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
        _titles = @[@"姓名",@"年龄",@"地址",@"公司",@"性别",@"爱好",@"身高",@"体重"];
    }
    return _titles;
}

- (NSArray *)placeHolders
{
    if (!_placeHolders) {
        _placeHolders = @[@"请输入姓名",@"请输入年龄",@"请输入地址",@"请输入公司",@"请输入性别",@"请输入爱好",@"请输入身高",@"请输入体重"];
    }
    return _placeHolders;
}

@end
