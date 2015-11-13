//
//  DCMyInfoViewController.h
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCDLoginViewController.h"
@interface DCMyInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *UserID;
@property (weak, nonatomic) IBOutlet UILabel *UserLoginAcount;
@property (weak, nonatomic) IBOutlet UILabel *Token;
@property (weak, nonatomic) IBOutlet UILabel *UserNickName;
- (IBAction)Logout:(id)sender;

@end
