//
//  Child.m
//  property_learn
//
//  Created by jack on 14-8-6.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "Child.h"

@implementation Child

// 不可重写，会进入无限循环
//- (void)setA:(NSInteger)a
//{
//    self.a = 10 * a;
//}

- (void)changeA:(NSInteger)a
{
    self.a = 10*a;
}

@end
