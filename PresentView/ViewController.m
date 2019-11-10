//
//  ViewController.m
//  PresentView
//
//  Created by GR on 2019/10/31.
//  Copyright © 2019 gaor. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (@available(iOS 9.0,*)) {
       self.view.backgroundColor = [UIColor redColor];
    }
//    SecondViewController *control = [[SecondViewController alloc]init];
//    [self.navigationController pushViewController:control animated:YES];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //presentViewController方法，如果写在viewDidLoad方法里，会报Presenting view controllers on detached view controllers is discouraged或whose view is not in the window hierarchy
   SecondViewController *control = [[SecondViewController alloc]init];
   [self presentViewController:control animated:YES completion:nil];
}

@end
