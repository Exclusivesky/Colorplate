//
//  ViewController.m
//  TextHuaTu
//
//  Created by 赵红亮 on 2017/3/24.
//  Copyright © 2017年 赵红亮. All rights reserved.
//

#import "ViewController.h"
#import "MyimageView.h"


@interface ViewController ()


@property (nonatomic,strong) MyimageView *myimageview;


@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myimageview = [[MyimageView alloc]initWithFrame:CGRectMake(0, 100, 588/2, 330/2)];
    [self.view addSubview:self.myimageview];
    self.myimageview.image = [UIImage imageNamed:@"12"];
    self.myimageview.baseimage = [UIImage imageNamed:@"12"];
    self.myimageview.newcolor = [UIColor redColor];

    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(10, 400, 20, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(red) forControlEvents:(UIControlEventTouchUpInside)];

    
    
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button1.frame = CGRectMake(40, 400, 20, 30);
    button1.backgroundColor = [UIColor greenColor];
    [button1 addTarget:self action:@selector(green) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *button11 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button11.frame = CGRectMake(70, 400, 20, 30);
    button11.backgroundColor = [UIColor blackColor];
    [button11 addTarget:self action:@selector(black) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *button111 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button111.frame = CGRectMake(100, 400, 20, 30);
    button111.backgroundColor = [UIColor blueColor];
    [button111 addTarget:self action:@selector(blue) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *button1111 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button1111.frame = CGRectMake(130, 400, 20, 30);
    button1111.backgroundColor = [UIColor orangeColor];
    [button1111 addTarget:self action:@selector(orange) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *button11111 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button11111.frame = CGRectMake(160, 400, 20, 30);
    button11111.backgroundColor = [UIColor yellowColor];
    [button11111 addTarget:self action:@selector(yellow) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *button111111 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button111111.frame = CGRectMake(190, 400, 20, 30);
    button111111.backgroundColor = [UIColor purpleColor];
    [button111111 addTarget:self action:@selector(purple) forControlEvents:(UIControlEventTouchUpInside)];
    
    

    
    
    [self.view addSubview:button];
    [self.view addSubview:button1];
    [self.view addSubview:button11];
    [self.view addSubview:button111];
    [self.view addSubview:button1111];
    [self.view addSubview:button11111];
    [self.view addSubview:button11111];
    [self.view addSubview:button111111];

}
-(void)purple
{
    self.myimageview.newcolor = [UIColor purpleColor];

}
-(void)yellow
{
    self.myimageview.newcolor = [UIColor yellowColor];

}
-(void)orange
{
    self.myimageview.newcolor = [UIColor orangeColor];

}
-(void)blue
{
    self.myimageview.newcolor = [UIColor blueColor];

}
-(void)black
{
    self.myimageview.newcolor = [UIColor blackColor];

}
-(void)green
{
    self.myimageview.newcolor = [UIColor greenColor];

}
-(void)red
{
    self.myimageview.newcolor = [UIColor redColor];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
