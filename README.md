### FBCScoreStar
以星星的样式显示分数

### 截图
![image](https://github.com/SYFH/FBCScoreStart/blob/master/PrintScreen.gif)

### 使用方法
```
ScoreStart *star = [[ScoreStart alloc] initWithFrame:CGRectMake(10, 100, 250, 50)];
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
The MIT License (MIT)

Copyright (c) 2016 SYFH

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
