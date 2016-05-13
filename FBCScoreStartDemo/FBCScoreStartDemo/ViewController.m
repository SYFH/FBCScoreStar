//
//  ViewController.m
//  FBCScoreStartDemo
//
//  Created by 云翼天 on 16/5/11.
//  Copyright © 2016年 云翼天. All rights reserved.
//

#import "ViewController.h"
#import "FBCScoreStar.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<FBCScoreStar *> *starArr;
@property (nonatomic, strong) NSMutableArray<UILabel *> *scoreArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.starArr = [NSMutableArray arrayWithCapacity:5];
    self.scoreArr = [NSMutableArray arrayWithCapacity:5];
    
    CGFloat y = 80;
    for (int i = 0; i < 5; i ++) {
        
        FBCScoreStar *start = [[FBCScoreStar alloc] initWithFrame:CGRectMake(10, i * y + 50, 50 * (i + 1), 50)];
        start.startColor = [UIColor orangeColor];
        start.score = 1;
        [self.view addSubview:start];
        [self.starArr addObject:start];
        
        UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(start.frame) + 10, i * y + 65, 80, 20)];
        score.text = [NSString stringWithFormat:@"%.2f", start.score];
        score.textColor = [UIColor blackColor];
        [self.view addSubview:score];
        [self.scoreArr addObject:score];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    for (int i = 0; i < 5; i ++) {
        
        FBCScoreStar *star = self.starArr[i];
        UILabel *scoreLB = self.scoreArr[i];
        
        u_int32_t max = star.frame.size.width / star.frame.size.height * 200;
        CGFloat score = arc4random_uniform(max) * 0.01;
        star.score = score;
        scoreLB.text = [NSString stringWithFormat:@"%.2f", score];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
