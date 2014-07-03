//
//  XMIconsView.m
//  Animation_Sequence
//
//  Created by jack on 14-7-2.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMIconsView.h"

const float ICON_WIDTH = 60.0f;
const float ICON_HEIGHT = 60.0f;
const float ICON_SPACING = 80.0f;

@implementation XMIconsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"predefinedApps" ofType:@"bundle"];
        NSBundle * bundle = [[NSBundle alloc] initWithPath:path];
        NSArray * paths = [bundle pathsForResourcesOfType:@"png" inDirectory:@"ios6"];
        
        for( NSUInteger i = 0; i < [paths count]; ++i )
        {
            UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(i*ICON_SPACING, 20.0f, ICON_WIDTH, ICON_HEIGHT)];
            view.image = [UIImage imageNamed:[paths objectAtIndex:i]];
        }
    }
    return self;
}

@end
