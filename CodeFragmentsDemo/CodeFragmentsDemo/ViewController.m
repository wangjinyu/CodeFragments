//
//  ViewController.m
//  CodeFragmentsDemo
//
//  Created by jinyu on 15/11/17.
//  Copyright © 2015年 Jeevan. All rights reserved.
//

#import "ViewController.h"
#import "CodeFragments.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"==%ld", [NetworkManager getNetworkTypeWithNetworkChangedBlock:nil]);
    
    NetWorkType type = [NetworkManager getNetworkTypeWithNetworkChangedBlock:^(NetWorkType networkType) {
        NSLog(@"**%ld", networkType)
    }];
    
    NSLog(@"--%ld", type);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
