//
//  ScoreStart.m
//  评分视图
//
//  Created by 云翼天 on 16/5/10.
//  Copyright © 2016年 云翼天. All rights reserved.
//

#import "FBCScoreStar.h"

@interface FBCScoreStar ()

@property (nonatomic, weak) CAShapeLayer *backgroudLayer;

@end

@implementation FBCScoreStar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawStarWithRect:frame];
    }
    return self;
}

- (void)awakeFromNib {
    [self drawStarWithRect:self.frame];
}

- (void)drawStarWithRect:(CGRect)frame {
    
    //使用时, 视图的宽度必须大于高度
    NSAssert(!(frame.size.width < frame.size.height), @"视图的宽度小于高度!");
    
    self.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    NSInteger num = frame.size.width / frame.size.height;//个数
    
    //进度
    UIBezierPath *backgroudPath = [UIBezierPath bezierPath];
    [backgroudPath moveToPoint:CGPointMake(0, frame.size.height * 0.5)];
    [backgroudPath addLineToPoint:CGPointMake(frame.size.width, frame.size.height * 0.5)];
    CAShapeLayer *backgroudLayer = [CAShapeLayer layer];
    backgroudLayer.path = backgroudPath.CGPath;
    backgroudLayer.lineWidth = frame.size.height;
    backgroudLayer.strokeColor = [UIColor orangeColor].CGColor;
    backgroudLayer.fillColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:backgroudLayer];
    self.backgroudLayer = backgroudLayer;
    
    //画图
    UIBezierPath *star = [[UIBezierPath alloc] init];
    for (int i = 1; i < num * 2; i ++) {
        if (i % 2 != 0) {
            CGFloat startX = frame.size.width / (frame.size.width / frame.size.height) * i;
            CGPoint center = CGPointMake(startX * 0.5, frame.size.height * 0.5);
            CGFloat radius = frame.size.height * 0.5;
            CGFloat angle = 4 * M_PI / 5;
            
            //画五角星
            [star moveToPoint:CGPointMake(startX * 0.5, 0)];
            for (int i = 0; i < 5; i ++) {
                CGFloat x = center.x - sinf((i + 1) * angle) * radius;
                CGFloat y = center.y - cosf((i + 1) * angle) * radius;
                [star addLineToPoint:CGPointMake(x, y)];
            }
            [star addLineToPoint:CGPointMake(startX * 0.5, 0)];
        }
    }
    
    //遮罩
    CAShapeLayer *starLayer = [CAShapeLayer layer];
    starLayer.path = star.CGPath;
    self.layer.mask = starLayer;
}

- (void)setStarBGColor:(UIColor *)starBGColor {
    _starBGColor = starBGColor;
    self.backgroundColor = starBGColor;
}

- (void)setStarColor:(UIColor *)startColor {
    _starColor = startColor;
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
