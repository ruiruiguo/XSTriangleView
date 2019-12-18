//
//  XSTriangleView.h
//  XSTriangleView
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XSTriangleViewStyle) {
    XSTriangleViewTop,
    XSTriangleViewLeft,
    XSTriangleViewBottom,
    XSTriangleViewRight,
};

@interface XSTriangleView : UIView


/**
 @param color 填充颜色
 @param style 三角形样式
 @return TriangleView
 */
- (instancetype)initWithColor:(UIColor *)color style:(XSTriangleViewStyle)style;

/**
设置
*/
- (void)TriangleView_setColor:(UIColor *)color style:(XSTriangleViewStyle)style;


@end
