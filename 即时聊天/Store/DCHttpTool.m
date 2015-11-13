//
//  DCHttpTool.m
//  即时聊天
//
//  Created by  Edward on 15/11/11.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "DCHttpTool.h"

@implementation DCHttpTool


+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString*)url
                   params:(NSDictionary*)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError* err))failure
{
    NSURL* baseURL = [NSURL URLWithString:ClientServerURL];
    //获得请求管理者
    AFHTTPRequestOperationManager* mgr = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
#ifdef ContentType
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:ContentType];
#endif
    mgr.requestSerializer.HTTPShouldHandleCookies = YES;
    
    switch (methodType) {
        case RequestMethodTypeGet:
        {
            //GET请求
            [mgr GET:url parameters:params
             success:^(AFHTTPRequestOperation* operation, NSDictionary* responseObj) {
                 if (success) {
                     success(responseObj);
                 }
             } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                 if (failure) {
                     failure(error);
                 }
             }];
            
        }
            break;
        case RequestMethodTypePost:
        {
            //POST请求
            [mgr POST:url parameters:params
              success:^(AFHTTPRequestOperation* operation, NSDictionary* responseObj) {
                  if (success) {
                      success(responseObj);
                  }
              } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                  if (failure) {
                      failure(error);
                  }
              }];
        }
            break;
        default:
            break;
    }
}

+(void)loginWithAccount:(NSString *)account password:(NSString *)password success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = @{@"account":account,@"password":password};
    [DCHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"im/login"
                           params:params
                          success:success
                          failure:failure];
}


+(void)registerWithEmail:(NSString *)email mobile:(NSString *)mobile userAccount:(NSString *)userAccount password:(NSString *)password gender:(NSString *)gender success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    //http://192.168.199.112:8080/im/register?account=111&password=122&phone=13913542172&email=zzzz&sex=1
    
    NSDictionary *params = @{@"account":userAccount,
                             @"password":password,
                             @"phone":mobile,
                             @"email":email,
                             @"sex":gender};
    [DCHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"im/register"
                           params:params
                          success:success
                          failure:failure];

}

+(void)requestFriend:(NSString *)userId friendName:(NSString *)friendName  success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //http://192.168.199.112:8080/im/addfriend?userid=11&friendname=account1
    
    NSDictionary *params = @{@"userid":userId,
                             @"friendname":friendName};
    [DCHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"im/addfriend"
                           params:params
                          success:success
                          failure:failure];
}


+(void)deleteFriend:(NSString *)userId friendID:(NSString *)friendID success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
//    http://192.168.199.112:8080/im/deletefriend?userid=1&friendid=5
    
    NSDictionary *params = @{@"userid":userId,
                             @"friendid":friendID};
    [DCHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"im/deletefriend"
                           params:params
                          success:success
                          failure:failure];
}

+(void)getFriendListFromServerWithUserID:(NSString *)userId Success:(void (^)(id))success failure:(void (^)(NSError *))failure

{
  //   http://192.168.199.112:8080/im/getfriends?uid=1
    
    NSDictionary *params = @{@"uid":userId};
    [DCHttpTool requestWihtMethod:RequestMethodTypePost
                              url:@"im/getfriends"
                           params:params
                          success:success
                          failure:failure];
}


//+(void)createGroupFromRongCloudServerWithUsers:(NSArray *)users success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    RCIMClient 
//}


@end
