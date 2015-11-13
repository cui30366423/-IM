//
//  AppDelegate.h
//  即时聊天
//
//  Created by  Edward on 15/11/9.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate,RCIMConnectionStatusDelegate,RCIMReceiveMessageDelegate>


@property (strong, nonatomic) UIWindow *window;



@end

