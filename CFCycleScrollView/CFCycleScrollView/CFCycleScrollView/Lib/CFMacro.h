//
//  CFMacro.h
//  CFCycleScrollView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#ifndef CFMacro_h
#define CFMacro_h

/**
 *  颜色相关 宏
 */
#define UIColorFromHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
// 随机色
#define CFRandomColor RGBA(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1.0)



/**
 *  字体相关 宏
 */
#define CF_Font_16 [UIFont systemFontOfSize:16]

/**
 *  尺寸相关 宏
 */
#define CFScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define CFScreenHeight  ([UIScreen mainScreen].bounds.size.height)


#endif /* CFMacro_h */
