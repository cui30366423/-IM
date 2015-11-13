//
//  DCSearchFriendTableViewController.h
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCSearchFriendsTableViewCell.h"
@interface DCSearchFriendTableViewController : UITableViewController<UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *searchResult;

@end
