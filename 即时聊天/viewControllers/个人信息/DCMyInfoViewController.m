//
//  DCMyInfoViewController.m
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "DCMyInfoViewController.h"

@interface DCMyInfoViewController ()

@end

@implementation DCMyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RCUserInfo * userInfo =[[RCIMClient sharedRCIMClient]currentUserInfo];
    
    self.UserID.text = [ NSString stringWithFormat:@"ID:%@",userInfo.userId];
    self.UserNickName.text=@"";
    [[RCDRCIMDataSource shareInstance]getUserInfoWithUserId:[RCIMClient sharedRCIMClient].currentUserInfo.userId completion:^(RCUserInfo *userInfo) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.UserNickName.text=[NSString stringWithFormat:@"昵称:%@",userInfo.name];
        });
    }];
    
    
 
    
    NSString *token =[[NSUserDefaults standardUserDefaults] objectForKey:@"userToken"];
    NSString *userId=[DEFAULTS objectForKey:@"userId"];
    NSString *userName = [DEFAULTS objectForKey:@"userName"];
    NSString *password = [DEFAULTS objectForKey:@"userPwd"];
    
    self.UserLoginAcount.text = [NSString stringWithFormat:@"loginAcount:%@",userName];
    
    self.Token.text =[NSString stringWithFormat:@"token:%@",token] ;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationItemTitleView];
}

- (void)setNavigationItemTitleView {
    UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:19];
    titleView.textColor = [UIColor whiteColor];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.text = @"我";
    self.tabBarController.navigationItem.titleView = titleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Logout:(id)sender {

    //    [DEFAULTS removeObjectForKey:@"userName"];
    //    [DEFAULTS removeObjectForKey:@"userPwd"];
    [DEFAULTS removeObjectForKey:@"userToken"];
    [DEFAULTS removeObjectForKey:@"userCookie"];
    [DEFAULTS removeObjectForKey:@"isLogin"];
    [DEFAULTS synchronize];
    
    

    RCDLoginViewController *loginVC = [[RCDLoginViewController alloc] init];
    // [loginVC defaultLogin];
    // RCDLoginViewController* loginVC = [storyboard
    // instantiateViewControllerWithIdentifier:@"loginVC"];
    UINavigationController *_navi =
    [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.view.window.rootViewController = _navi;
    [[RCIMClient sharedRCIMClient]logout];
    //[[RCIMClient sharedRCIMClient]disconnect:NO];
    
}
@end
