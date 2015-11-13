//
//  DCHttpTool.h
//  即时聊天
//
//  Created by  Edward on 15/11/11.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHttpTool.h"
#import "AFNetworking.h"



//服务器
#define ClientServerURL @"http://192.168.199.112:8080/"


@interface DCHttpTool : NSObject


/**
 *  发送一个请求
 *
 *  @param methodType   请求方法
 *  @param url          请求路径
 *  @param params       请求参数
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+(void) requestWihtMethod:(RequestMethodType)
methodType url : (NSString *)url
                   params:(NSDictionary *)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure;



/**登陆*/
+(void) loginWithAccount:(NSString *) account
              password:(NSString *) password
//                   env:(int) env
               success:(void (^)(id response))success
               failure:(void (^)(NSError* err))failure;



/**注册*/
+(void) registerWithEmail:(NSString *) email
                   mobile:(NSString *) mobile
                 userAccount:(NSString *) userAccount
                 password:(NSString *) password
                   gender:(NSString *)gender
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError* err))failure;

/**添加好友
 *  @param userId   当前用户id
 */
+(void)requestFriend:(NSString*) userId
          friendName:(NSString *)friendName
             success:(void (^)(id response))success
             failure:(void (^)(NSError* err))failure;

/**删除好友
 *  @param userId   当前用户id
 */
+(void)deleteFriend:(NSString*) userId
           friendID:(NSString *)friendID
            success:(void (^)(id response))success
            failure:(void (^)(NSError* err))failure;



/**获取好友列表
 *  @param userId   当前用户id 
 */
+(void)getFriendListFromServerWithUserID:(NSString *)userId
                       Success:(void (^)(id response))success
                              failure:(void (^)(NSError* err))failure;

/**
 *  创建群组
 *
 *  @param users   用户数
 */
+(void)createGroupFromRongCloudServerWithUsers:(NSArray*)users
                                       success:(void (^)(id response))success
                                       failure:(void (^)(NSError* err))failure;

@end
