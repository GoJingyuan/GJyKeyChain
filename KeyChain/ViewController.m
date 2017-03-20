//
//  ViewController.m
//  KeyChain
//
//  Created by cnmobi on 2017/3/20.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "ViewController.h"
#import "GJyKeyChain.h"
#import "Const.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 增
- (IBAction)writeKeyChainBtnClick:(id)sender {
  
    NSMutableDictionary *userNameAndToken = [NSMutableDictionary dictionary];
    [userNameAndToken setObject:@"userName" forKey:KEY_UserName];
    [userNameAndToken setObject:@"token" forKey:KEY_Token];
    NSLog(@"%@", userNameAndToken);
    
    // 1、将用户名和密码写入keychain
    [GJyKeyChain save:KEY_KeyChainKey data:userNameAndToken];
}

#pragma mark - 查
- (IBAction)readKeyChainBtnClick:(id)sender {

    // 2、从keychain中读取用户名和密码
    NSMutableDictionary *userNameAndToken = (NSMutableDictionary *)[GJyKeyChain load:KEY_KeyChainKey];
    NSString *userName = [userNameAndToken objectForKey:KEY_UserName];
    NSString *token = [userNameAndToken objectForKey:KEY_Token];
    
    NSLog(@"取值 : username = %@ && token = %@", userName, token);
}

#pragma mark - 改
- (IBAction)KeyChainBtnClick:(id)sender {
    
    NSMutableDictionary *userNameAndToken = (NSMutableDictionary *)[GJyKeyChain load:KEY_KeyChainKey];
    [userNameAndToken setObject:@"newUserName" forKey:KEY_UserName];
    [userNameAndToken setObject:@"newToken" forKey:KEY_Token];
    [GJyKeyChain save:KEY_KeyChainKey data:userNameAndToken];
    
    NSLog(@"修改后 : \nusername = %@ && token = %@", [userNameAndToken objectForKey:KEY_UserName], [userNameAndToken objectForKey:KEY_Token]);
}


#pragma mark - 删
- (IBAction)deleteKeyChainBtnClick:(id)sender {
    
    // 3、将用户名和密码从keychain中删除
    [GJyKeyChain delete:KEY_KeyChainKey];
    
    [self readKeyChainBtnClick:nil];
}



@end
