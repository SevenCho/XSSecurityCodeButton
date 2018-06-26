# 简介
XSSecurityCodeButton 是一个简约的验证码按钮, 本功能完全参考[summertian4/CFSecurityCodeButton](https://github.com/summertian4/CFSecurityCodeButton)源码进行仿写。

![XSSecurityCodeButton演示](http://7xnrog.com1.z0.glb.clouddn.com/github_iOS-CFSecurityCodeButton-show.gif)

# 功能

1. 自定义 Normal 状态下文字和 Disabled 状态下文字XS
2. 自动根据Normal 和 Disabled 状态下文字设置宽高
3. 自定义定时时间
4. 自动根据按钮的主题色调整文字颜色
5. 提供了代理方法监控按钮开始计时和计时结束
6. 提供了一些好看的颜色供使用者选择

# 安装

1. 手动安装
将 `XSSecurityCodeButton.h`、`XSSecurityCodeButton.m` 拖入你的项目中

2. CocoaPods

	```
	pod ‘XSSecurityCodeButton’
	```

# 使用

1. 创建
	通过主题色创建一个 XSSecurityCodeButton

	```objc
	XSSecurityCodeButton *btSecurityCode_Blue = [[XSSecurityCodeButton alloc] initWithColor:XSColorDodgerBlue];
	```
	提供了一些颜色供使用者选择
	
	```objc
	XSColorCoral
	XSColorDodgerBlue
	XSColorDeepSkyBlue
	XSColorTurquoise
	XSColorWarmYellow
	XSColorMediumPurple
	XSColorSeaGreen
	```

2. 设置文字
	如果没有设置，默认 Normal 状态会显示"发送验证码"，Disabled 状态会显示"再次发送(倒计时)"
	如果需要自定义可以设置`normalTitle`和`disabledTitle`属性
	
	```objc
	btSecurityCode.normalTitle = @"自定义normal状态文字内容";
	btSecurityCode.disabledTitle = @"自定义disabled状态文字内容";
	```
	![XSSecurityCodeButton演示](http://7xnrog.com1.z0.glb.clouddn.com/github_iOS-CFSecurityCodeButton-02.png)
	
3. 设置倒计时
	如果没有设置，默认倒计时为 60 秒
	如果需要自定义可以设置`time`属性
	
	```objc
	btSecurityCode.time = 60;
	```

4. 自动调节文字颜色
	XSSecurityCodeButton 会根据自身的颜色调节文字颜色，当颜色过深时文字将会变成白色，当颜色过浅时文字颜色将会变成黑色
	![XSSecurityCodeButton演示](http://7xnrog.com1.z0.glb.clouddn.com/github_iOS-CFSecurityCodeButton-03.png)

5. 代理
	提供了两个代理方法监控按钮
	
	```objc
	- (void)didClickedSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton;
    - (void)timingEndedOfSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton;
	```
	只需要实现 `XSSecurityCodeButtonDelegate`，重写代理方法

6. 为了避免内存泄露：

	```objc
	/**
	 invalidate NSTimer
	 */
	- (void)stopTiming;
	```


