//
//  HomeViewController.m
//  iChat
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController (){
    NSArray *userData;
    NSInteger index;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    __weak typeof(self) weakSelf = self;
    [CCParseData loadUserDataWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            userData = [[NSArray alloc] initWithArray:objects];
            [weakSelf.usersList reloadData];
        } else {
            [CCInfoAlert showAlertWithTitle: @"Error"
                              andMessage: [error userInfo][@"error"]];
        }
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Users";
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return userData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    PFObject *obj = [userData objectAtIndex:indexPath.row];
    cell.textLabel.text = obj[@"username"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@/%@", obj[@"firstName"], obj[@"lastName"]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    index = indexPath.row;
    [self performSegueWithIdentifier:@"chatRoomSegue" sender:self];
}


@end
