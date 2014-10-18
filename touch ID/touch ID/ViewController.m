//
//  ViewController.m
//  touch ID
//
//  Created by huangyipeng on 14-10-17.
//  Copyright (c) 2014年 hyp. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@property (nonatomic, strong) LAContext *ctx;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化上下文
    LAContext *ctx = [[LAContext alloc] init];
    self.ctx = ctx;
}

- (void)viewWillAppear:(BOOL)animated
{
    // 判断能否使用指纹解锁
    BOOL touch = [self.ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    if (touch) {
        NSLog(@"能够使用指纹解锁");
        // 使用指纹解锁
        [self.ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"使用指纹解锁" reply:^(BOOL success, NSError *error) {
            
            if (error) {
                NSLog(@"%@", error.localizedDescription);
            }
            
            if (success) {
                NSLog(@"解锁成功");
            }
        }];
    }
}


@end
