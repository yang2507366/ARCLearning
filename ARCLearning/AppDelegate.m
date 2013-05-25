//
//  AppDelegate.m
//  ARCLearning
//
//  Created by yangzexin on 5/25/13.
//  Copyright (c) 2013 yangzexin. All rights reserved.
//

#import "AppDelegate.h"
#import "ARCObject.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /**
        CFBridgingRetain(__bridge_retained)用于将NSString对象转换为CoreFoundation对象时，作用是解除ARC对该对象的所有权，将对象的释放交给CoreFoundation来做
     */
    CFStringRef stringRef = (CFStringRef)CFBridgingRetain([NSString stringWithFormat:@"testCaseToCFStringRef"]);
    NSLog(@"%@", stringRef);
    
    /**
        CFBridgingRelease(__bridge_transfer)用于将CoreFoundation对象转换为NSString对象时，作用是给予ARC对该对象的所有权，将对象的释放交给ARC去做
     */
    NSString *string = (NSString *)CFBridgingRelease(CFStringCreateWithCString(kCFAllocatorDefault, "testCastToNSSting", NSASCIIStringEncoding));
    NSLog(@"%@", string);
    
    /**
     __bridge 只做类型转换，不改变对象所有权。
     */
    NSString *bridingString = (__bridge NSString *)stringRef;
    NSLog(@"%@", bridingString);
    
    ARCObject *arcObj = [ARCObject new];
    [arcObj test];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
