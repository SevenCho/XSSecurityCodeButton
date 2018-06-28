//
//  ViewController.m
//  XSSecurityCodeButton
//
//  Created by 曹雪松 on 2018/6/26.
//  Copyright © 2018 曹雪松. All rights reserved.
//

#import "ViewController.h"
#import "XSSecurityCodeButton/XSSecurityCodeButton.h"

@interface ViewController () <XSSecurityCodeButtonDeletate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XSSecurityCodeButton *btSecurityCode_Blue = [[XSSecurityCodeButton alloc] initWithColor:XSColorDodgerBlue];
    btSecurityCode_Blue.frame = CGRectMake(100, 100, 0, 0);
    btSecurityCode_Blue.timeDuration = 60;
    btSecurityCode_Blue.delegate = self;
    [self.view addSubview:btSecurityCode_Blue];
    
    XSSecurityCodeButton *btSecurityCode_DeepSkyBlue = [[XSSecurityCodeButton alloc] initWithColor:XSColorDeepSkyBlue];
    btSecurityCode_DeepSkyBlue.frame = CGRectMake(100, 150, 0, 0);
    btSecurityCode_DeepSkyBlue.timeDuration = 10;
    btSecurityCode_DeepSkyBlue.normalTitle = @"自定义normal状态文字内容";
    btSecurityCode_DeepSkyBlue.delegate = self;
    [self.view addSubview:btSecurityCode_DeepSkyBlue];
    
    XSSecurityCodeButton *btSecurityCode_SeaGreen = [[XSSecurityCodeButton alloc] initWithColor:XSColorSeaGreen];
    btSecurityCode_SeaGreen.frame = CGRectMake(100, 200, 0, 0);
    btSecurityCode_SeaGreen.timeDuration = 20;
    btSecurityCode_SeaGreen.disabledTitle = @"自定义disabled状态文字内容";
    btSecurityCode_SeaGreen.delegate = self;
    [self.view addSubview:btSecurityCode_SeaGreen];
    
    XSSecurityCodeButton *btSecurityCode_Coral = [[XSSecurityCodeButton alloc] initWithColor:XSColorCoral];
    btSecurityCode_Coral.frame = CGRectMake(100, 250, 0, 0);
    btSecurityCode_Coral.timeDuration = 30;
    btSecurityCode_Coral.normalTitle = @"自定义定时时间";
    btSecurityCode_Coral.delegate = self;
    [self.view addSubview:btSecurityCode_Coral];
    
    XSSecurityCodeButton *btSecurityCode_Turquoise = [[XSSecurityCodeButton alloc] initWithColor:XSColorTurquoise normalTitle:@"别忘了设置代理" disabledTitle:nil];
    btSecurityCode_Turquoise.frame = CGRectMake(100, 300, 0, 0);
    btSecurityCode_Turquoise.timeDuration = 40;
    btSecurityCode_Turquoise.delegate = self;
    [self.view addSubview:btSecurityCode_Turquoise];
    
    XSSecurityCodeButton *btSecurityCode_WarmYellow = [[XSSecurityCodeButton alloc] initWithColor:XSColorWarmYellow normalTitle:@"根据主题色自动调节文字颜色" disabledTitle:nil timeDuration:0];
    btSecurityCode_WarmYellow.frame = CGRectMake(100, 350, 0, 0);
    btSecurityCode_WarmYellow.delegate = self;
    [self.view addSubview:btSecurityCode_WarmYellow];
}

#pragma mark - XSSecurityCodeButtonDeletate
- (void)didClickedSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton
{
    NSLog(@"didClickedSecurityCodeButton:");
}

- (void)timingEndedOfSecurityCodeButton:(XSSecurityCodeButton *)SecurityCodeButton
{
    NSLog(@"timingEndedOfSecurityCodeButton:");
}


@end
