### FBCScoreStar
以星星的样式显示分数

### 截图
![image](https://github.com/SYFH/FBCScoreStart/blob/master/PrintScreen.gif)

### 使用方法
```
ScoreStart *star = [[ScoreStart alloc] initWithFrame:CGRectMake(10, 100, 250, 50)];
star.starBGColor = [UIColor redColor];//星星的背景颜色
star.startColor = [UIColor orangeColor];
star.score = 3;
[self.view addSubview:star];
```

### 注意
1. 本视图一颗星星代表2分
2. 在使用时, 视图的宽必须大于高度, 若不符合标准则Crash!
3. 如果在使用中遇到问题与BUG, 请提交issue
4. 感谢各位的使用, 如果用的称心, 可以star

### License
All source code is licensed under the [MIT License](https://github.com/SYFH/FBCScoreStar/blob/master/LICENSE).
