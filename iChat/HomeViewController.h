//
//  HomeViewController.h
//  iChat
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCParseData.h"
#import "CCInfoAlert.h"

@interface HomeViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *usersList1;
@property (weak, nonatomic) IBOutlet UITableView *usersList;

@end
