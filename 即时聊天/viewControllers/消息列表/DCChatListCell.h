//
//  DCChatListCell.h
//  即时聊天
//
//  Created by  Edward on 15/11/11.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface DCChatListCell : RCConversationBaseCell

@property (nonatomic,strong) UIImageView *ivAva;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UILabel *lblDetail;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, strong) UILabel *labelTime;

@end
