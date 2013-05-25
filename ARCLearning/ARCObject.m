//
//  ARCObject.m
//  ARCLearning
//
//  Created by yangzexin on 5/25/13.
//  Copyright (c) 2013 yangzexin. All rights reserved.
//

#import "ARCObject.h"

@implementation ARCObject {
    NSString *string;
}

- (void)test
{
    [self testInvokeInstanceVariable];
}

- (void)testInvokeInstanceVariable
{
    string = [self testString];
    NSLog(@"%@", string);
}

- (NSString *)testString
{
    return [NSString stringWithFormat:@"test"];
}

@end
