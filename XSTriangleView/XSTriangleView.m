//
//  XSTriangleView.m
//  XSTriangleView
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "XSTriangleView.h"

@interface XSTriangleView()

@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGPoint middlePoint;
@property (assign, nonatomic) CGPoint endPoint;

@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) XSTriangleViewStyle style;

@end

@implementation XSTriangleView

- (instancetype)initWithColor:(UIColor *)color style:(XSTriangleViewStyle)style{
    if ([super init]) {
        _color = color;
        _style = style;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self resetPoint];
}

- (void)resetPoint{
    CGRect rect = self.bounds;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    switch (_style) {
        case XSTriangleViewTop:
            _startPoint = CGPointMake(0, height);
            _middlePoint = CGPointMake(width/2.0, 0);
            _endPoint = CGPointMake(width, height);
            break;
        case XSTriangleViewLeft:
            _startPoint = CGPointMake(width, 0);
            _middlePoint = CGPointMake(0, height/2.0);
            _endPoint = CGPointMake(width, height);
            break;
        case XSTriangleViewBottom:
            _startPoint = CGPointMake(0, 0);
            _middlePoint = CGPointMake(width/2.0, height);
            _endPoint = CGPointMake(width, 0);
            break;
        case XSTriangleViewRight:
            _startPoint = CGPointMake(0, 0);
            _middlePoint = CGPointMake(width, height/2.0);
            _endPoint = CGPointMake(0, height);
            break;
        default:
            break;
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context, _startPoint.x, _startPoint.y);
    CGContextAddLineToPoint(context,_middlePoint.x, _middlePoint.y);
    CGContextAddLineToPoint(context,_endPoint.x, _endPoint.y);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [_color setFill]; //设置填充色
    [_color setStroke];//边框也设置为_color，否则为默认的黑色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
}


#pragma mark public-method
- (void)TriangleView_setColor:(UIColor *)color style:(XSTriangleViewStyle)style{
    if (color) {
        _color = color;
    }
    
    if (style) {
        _style = style;
    }
    
    [self resetPoint];
    [self setNeedsDisplay];
}

@end
