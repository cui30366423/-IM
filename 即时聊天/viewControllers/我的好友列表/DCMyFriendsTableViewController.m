//
//  DCMyFriendsTableViewController.m
//  即时聊天
//
//  Created by  Edward on 15/11/10.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "DCMyFriendsTableViewController.h"

@interface DCMyFriendsTableViewController ()
{
    NSMutableArray * _myFriends;
}
@end

@implementation DCMyFriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myFriends = [[NSMutableArray alloc]initWithCapacity:1];
    
    
    [self loadMyFriends];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, TabBarHeight, 0)];
    
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
    titleView.text = @"通讯录";
    self.tabBarController.navigationItem.titleView = titleView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载好友列表

-(void)loadMyFriends
{
    [_myFriends removeAllObjects];
    
    
    NSString * userId = [DEFAULTS objectForKey:@"userId"];
    
    [DCHttpTool getFriendListFromServerWithUserID:userId Success:^(id response) {
        
        if ([response[responseCode] integerValue]==0) {
             DCUserInfosArrayModel * friends = [[DCUserInfosArrayModel alloc]initWithDictionary:response error:nil];
            [_myFriends addObjectsFromArray:friends.data];
            
            [self.tableView reloadData];
            
        }
        else
        {
            //出错
            DLog(@"%@",response[@"msg"]);
            
        }
        
       
        
        
 
    } failure:^(NSError *err) {
        
        
        DLog(@"%@",err);
    }];
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCUserInfoModel * userInfo = _myFriends[indexPath.row];
    
    RCConversationViewController * vc = [[RCConversationViewController alloc]init];
    
    vc.conversationType =ConversationType_PRIVATE;
    
    vc.targetId =@"11";
    
    vc.userName = userInfo.username;
    
    vc.title = userInfo.username;
    vc.displayUserNameInCell=NO;
    vc.enableUnreadMessageIcon = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _myFriends.count;
    
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCMyFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myFriendCell" forIndexPath:indexPath];
    
    DCUserInfoModel * userInfo = _myFriends[indexPath.row];
    
    
    
    [cell.UserIcon sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"default"]];
    
    cell.UserName.text = userInfo.username;
    
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
