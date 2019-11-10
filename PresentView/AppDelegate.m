//
//  AppDelegate.m
//  PresentView
//
//  Created by GR on 2019/10/31.
//  Copyright © 2019 gaor. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

   self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   ViewController *homePage = [[ViewController alloc] init];
   UINavigationController *naControl = [[UINavigationController alloc]initWithRootViewController:homePage];
   self.window.rootViewController = naControl;
   [self.window makeKeyAndVisible];
  
    return YES;
}


@end
