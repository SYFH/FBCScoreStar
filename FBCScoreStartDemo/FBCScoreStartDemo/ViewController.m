//
//  ViewController.m
//  FBCScoreStartDemo
//
//  Created by 云翼天 on 16/5/11.
//  Copyright © 2016年 云翼天. All rights reserved.
//

#import "ViewController.h"
#import "FBCScoreStart.h"

@interface ViewController ()

@property (nonatomic, weak) FBCScoreStart *start;
@property (nonatomic, weak) UILabel *score;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FBCScoreStart *start = [[FBCScoreStart alloc] initWithFrame:CGRectMake(10, 100, 250, 50)];
    start.startColor = [UIColor orangeColor];
    start.score = 3;
    [self.view addSubview:start];
    self.start = start;
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(300, 115, 80, 20)];
    score.text = @"3.00";
    score.textColor = [UIColor blackColor];
    [self.view addSubview:score];
    self.score = score;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGFloat score = arc4random_uniform(1000) * 0.01;
    self.start.score = score;
    self.score.text = [NSString stringWithFormat:@"%.2f", score];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
