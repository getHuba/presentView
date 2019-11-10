//
//  UIViewController+ChangeUI.m
//  CDVWkWebView
//
//  Created by 高瑞 on 2019/10/24.
//  Copyright © 2019 gaor. All rights reserved.
//

#import "UIViewController+ChangeUI.h"

#import <objc/runtime.h>

@implementation UIViewController (ChangeUI)

//自动调的，不需要单独在导入头文件调用
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([self class], @selector(presentViewController:animated:completion:), @selector(myPresentViewController:animated:completion:));
        });
}

void swizzling_exchangeMethod(Class class, SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



- (void)myPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    //设置满屏，不需要小卡片
    if(@available(iOS 13.0, *)) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self myPresentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end
