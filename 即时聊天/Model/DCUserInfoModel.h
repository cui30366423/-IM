//
//  DCUserInfoModel.h
//  即时聊天
//
//  Created by  Edward on 15/11/11.
//  Copyright © 2015年  Edward. All rights reserved.
//

#import "JSONModel.h"

@protocol DCUserInfoModel <NSObject>



@end

@interface DCUserInfoModel : JSONModel<NSCoding>


@property(nonatomic,strong,nonnull) NSString *  email;

@property(nonatomic,strong,nullable) NSString<Optional> *  imtoken;

@property(nonatomic,strong,nonnull)NSString *  password;

@property(nonatomic,strong,nonnull)NSString *  phone;

@property(nonatomic,strong,nonnull)NSString *  sex;

@property(nonatomic,strong,nonnull)NSString * username;

@end

@interface DCUserInfosArrayModel : JSONModel

@property(nonatomic,strong,nonnull)NSMutableArray<DCUserInfoModel> * data;

@end
