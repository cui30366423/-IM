//
//  DCSearchFriendsTableViewCell.h
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCSearchFriendsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *UserIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *UserNameInfo;
- (IBAction)AddThisFriend:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *AddUserButton;

@property(nonatomic,strong)RCUserInfo * UserInfo;
@end
