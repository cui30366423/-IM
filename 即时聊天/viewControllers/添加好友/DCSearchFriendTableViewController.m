//
//  DCSearchFriendTableViewController.m
//  即时聊天a
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "DCSearchFriendTableViewController.h"

@interface DCSearchFriendTableViewController ()

@end

@implementation DCSearchFriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _searchResult=[[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _searchResult.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCSearchFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchFriendsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    RCDUserInfo * info = _searchResult[indexPath.row];
    
    [cell.UserIconImageView sd_setImageWithURL:[NSURL URLWithString:info.portraitUri] placeholderImage:[UIImage imageNamed:@"default.jpg"]];

    cell.UserNameInfo.text = [NSString stringWithFormat:@"UserID:%@ UserName:%@",info.userId,info.name];
    
    NSLog(@"%@",info.status);
    
//    [RCDHTTPTOOL isMyFriendWithUserInfo:info completion:^(BOOL isFriend) {
        if ([info.status isEqualToString:@"1"]) {
            cell.AddUserButton.hidden=YES;
        }
        else
        {
            cell.AddUserButton.hidden=NO;
        }
//    }];
    
    
    cell.UserInfo = info;
    return cell;
}




#pragma mark 查找代理
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    [_searchResult removeAllObjects];
    
    if ([searchText length]) {
        [RCDHTTPTOOL searchFriendListByEmail:searchText complete:^(NSMutableArray *result) {
            if (result) {
                [_searchResult addObjectsFromArray:result];
    dispatch_async(dispatch_get_main_queue(), ^{
                    //reload
                    [self.tableView reloadData];
                });
            }
        }];
        
        [RCDHTTPTOOL searchFriendListByName:searchText complete:^(NSMutableArray *result) {
            if (result) {
                [_searchResult addObjectsFromArray:result];
                dispatch_async(dispatch_get_main_queue(), ^{
                    //reload
                    [self.tableView reloadData];
                });
            }
            
        }];
        
    }
}
@end
