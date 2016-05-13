//
//  ScoreStart.h
//  评分视图
//
//  Created by 云翼天 on 16/5/10.
//  Copyright © 2016年 云翼天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBCScoreStar : UIView

/*!
 @author SYFH
 
 @brief 星星的背景颜色, 有默认值
 默认值为: [UIColor colorWithWhite:0.85 alpha:1]
 */
@property (nonatomic, strong) UIColor *starBGColor;

/*!
 @author SYFH
 
 @brief 星星的颜色, 有默认值
 默认值为: [UIColor orangeColor]
 */
@property (nonatomic, strong) UIColor *starColor;

/*!
 @author SYFH
 
 @brief 分数, 最小为0, 最大为星星的个数的两倍
 eg. 5颗星星的最高分数为 5 * 2 ＝ 10
 */
@property (nonatomic, assign) CGFloat score;

@end
