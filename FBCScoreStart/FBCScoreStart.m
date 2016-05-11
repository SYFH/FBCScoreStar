//
//  ScoreStart.m
//  评分视图
//
//  Created by 云翼天 on 16/5/10.
//  Copyright © 2016年 云翼天. All rights reserved.
//

#import "FBCScoreStart.h"

@interface FBCScoreStart ()

@property (nonatomic, weak) CAShapeLayer *backgroudLayer;

@end

@implementation FBCScoreStart

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //使用时, 视图的宽度必须大于高度
        NSAssert(!(frame.size.width < frame.size.height), @"视图的宽度小于高度!");
        
        self.backgroundColor = [UIColor clearColor];
        NSInteger num = frame.size.width / frame.size.height;//个数
        
        //底层
        UIBezierPath *backgroudPath = [UIBezierPath bezierPath];
        [backgroudPath moveToPoint:CGPointMake(0, frame.size.height * 0.5)];
        [backgroudPath addLineToPoint:CGPointMake(frame.size.width, frame.size.height * 0.5)];
        CAShapeLayer *backgroudLayer = [CAShapeLayer layer];
        backgroudLayer.path = backgroudPath.CGPath;
        backgroudLayer.lineWidth = frame.size.height;
        [self.layer addSublayer:backgroudLayer];
        self.backgroudLayer = backgroudLayer;
        
        //画图
        UIBezierPath *start = [[UIBezierPath alloc] init];
        for (int i = 1; i < num * 2; i ++) {
            if (i % 2 != 0) {
                CGFloat startX = frame.size.width / (frame.size.width / frame.size.height) * i;
                CGPoint center = CGPointMake(startX * 0.5, frame.size.height * 0.5);
                CGFloat radius = frame.size.height * 0.5;
                CGFloat angle = 4 * M_PI / 5;
                
                //画五角星
                [start moveToPoint:CGPointMake(startX * 0.5, 0)];
                for (int i = 0; i < 5; i ++) {
                    CGFloat x = center.x - sinf((i + 1) * angle) * radius;
                    CGFloat y = center.y - cosf((i + 1) * angle) * radius;
                    [start addLineToPoint:CGPointMake(x, y)];
                }
                [start addLineToPoint:CGPointMake(startX * 0.5, 0)];
            }
        }
        
        //遮罩
        CAShapeLayer *startLayer = [CAShapeLayer layer];
        startLayer.path = start.CGPath;
        self.layer.mask = startLayer;
    }
    return self;
}

- (void)setStartColor:(UIColor *)startColor {
    _startColor = startColor;
    self.backgroudLayer.strokeColor = startColor.CGColor;
    self.backgroudLayer.fillColor = startColor.CGColor;
}

- (void)setScore:(CGFloat)score {
    NSInteger num = self.frame.size.width / self.frame.size.height;
    if (score > num * 2) {//设置上限
        score = num * 2;
    }
    _score = score;
    self.backgroudLayer.strokeEnd = score / (num * 2);
}

@end
