//
//  UIImage+Common.m
//  UIImage_Clip
//
//  Created by jack on 14-8-27.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

- (UIImage *)imageClip:(CGRect)srcRect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, srcRect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

@end
