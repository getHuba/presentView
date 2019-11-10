//
//  SecondViewController.m
//  CDVWkWebView
//
//  Created by 高瑞 on 2019/10/24.
//  Copyright © 2019 gaor. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

-(void)viewDidAppear:(BOOL)animated
{
    ThreeViewController *three = [[ThreeViewController alloc]init];
    [self presentViewController:three animated:YES completion:nil];
}

@end
