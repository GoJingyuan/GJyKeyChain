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

#pragma mark - 存
- (IBAction)writeKeyChainBtnClick:(id)sender {
  
    NSMutableDictionary *userNameAndToken = [NSMutableDictionary dictionary];
    [userNameAndToken setObject:@"userName" forKey:KEY_USERNAME];
    [userNameAndToken setObject:@"token" forKey:KEY_Token];
    NSLog(@"%@", userNameAndToken);
    
    // A、将用户名和密码写入keychain
    [GJyKeyChain save:KEY_KeyChainKey data:userNameAndToken];
}

#pragma mark - 取
- (IBAction)readKeyChainBtnClick:(id)sender {

    // 2、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[GJyKeyChain load:KEY_KeyChainKey];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *token = [readUsernamePassword objectForKey:KEY_Token];
    
    NSLog(@"username = %@ && token = %@", userName, token);
}

#pragma mark - 删
- (IBAction)deleteKeyBtnClick:(id)sender {
    
    // 3、将用户名和密码从keychain中删除
    [GJyKeyChain delete:KEY_KeyChainKey];
    
    [self readKeyChainBtnClick:nil];
}



@end
