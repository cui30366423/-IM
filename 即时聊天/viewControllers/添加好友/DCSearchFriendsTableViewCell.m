//
//  DCSearchFriendsTableViewCell.m
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "DCSearchFriendsTableViewCell.h"

@implementation DCSearchFriendsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)AddThisFriend:(id)sender {
    
    [RCDHTTPTOOL requestFriend:self.UserInfo.userId complete:^(BOOL result) {
        
    }];
    
}
@end
