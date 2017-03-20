//
//  KeyChain.h
//  KeyChain
//
//  Created by cnmobi on 2017/3/20.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

//KeyChain工具,使用前需依赖Security.framework和<Security/Security.h>
#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface GJyKeyChain : NSObject

/** 取钥匙串 */
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

/** 
 保存内容
 */
+ (void)save:(NSString *)service data:(id)data;

/**
 加载内容
 */
+ (id)load:(NSString *)service;

/**
 删除内容
 */
+ (void)delete:(NSString *)serviece;

@end
