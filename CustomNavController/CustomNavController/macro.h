//
//  Header.h
//  miltoday
//
//  Created by jack on 14-7-30.
//  Copyright (c) 2014年 com.yuzhuangbao.miltoday. All rights reserved.
//

#ifndef miltoday_Header_h
#define miltoday_Header_h

#define COLOR(r,g,b,a)          [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define COLORF(r,g,b,a)         [UIColor colorWithRed:r green:g blue:b alpha:a]

#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define IOS6 [[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif
