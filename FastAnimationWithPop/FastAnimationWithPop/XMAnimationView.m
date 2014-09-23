//
//  XMAnimationView.m
//  FastAnimationWithPop
//
//  Created by jack on 14-8-15.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMAnimationView.h"

@implementation XMAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 50, 50)];
        button.backgroundColor = [UIColor blueColor];
        [self addSubview:button];
        
        UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(65, 0, 50, 50)];
        button2.backgroundColor = [UIColor blueColor];
        [self addSubview:button2];
    }
    return self;
}

@end
