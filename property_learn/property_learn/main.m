//
//  main.m
//  property_learn
//
//  Created by jack on 14-8-6.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"
#import "Child.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Parent * p = [[Parent alloc] init];
        p.a = 10;
        NSLog(@"%ld", p.a);
        
        Child * c = [[Child alloc] init];
        [c changeA:10];
        NSLog(@"%ld", c.a);
    }
    return 0;
}

