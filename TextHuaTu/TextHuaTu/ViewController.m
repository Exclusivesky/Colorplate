//
//  PictureViewController.m
//  This colour
//
//  Created by 韩一博 on 2017/3/31.
//  Copyright © 2017年 韩一博. All rights reserved.
//

#import "ViewController.h"
#import "SDAutoLayout.h"
#import "MyimageView.h"
#import "UIImageView+MyWebiamge.h"
#import "SVProgressHUD.h"
#import "NSString+Common.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIButton *shapeButton;//返回
@property (nonatomic, strong)UIButton *keepButton;//保存
@property (nonatomic, strong)UIButton *shareButton;//分享
@property (nonatomic, strong)UIButton *revokeButton;//撤销
@property (nonatomic,strong) MyimageView *myimageview;

@property (nonatomic,strong)UIScrollView * scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setNav];
    [self stUI];
    
}


-(void)stUI
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, screenW, screenW)];
    //_scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_scrollView];
    self.myimageview = [[MyimageView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenW)];
    //self.myimageview.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:self.myimageview];
    //设置内容大小
    _scrollView.contentSize = _myimageview.frame.size;
    //设置代理为控制器
    _scrollView.delegate = self;
    //设置最小缩放比例
    _scrollView.minimumZoomScale = 1;
    //设置最大缩放比例
    _scrollView.maximumZoomScale = 4;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    //设置手势点击数,双击：点2下
    tapGesture.numberOfTapsRequired=2;
    //    self.imageView.userInteractionEnabled = YES;
    [_scrollView addGestureRecognizer:tapGesture];
    
    NSString *urlstr = [[NSString stringWithFormat:@"%@",@"besta1"] md5Str];
    //拿到图片
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/%@.png",paths[0],urlstr];
    NSLog(@"imagepath=============%@",path);
    
    
    //设置一个图片的存储路径
    // 拿到沙盒路径图片
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:path];
    if (imgFromUrl3) {
        self.myimageview.image  = imgFromUrl3;
        
    }else {
        self.myimageview.image = [UIImage imageNamed:@"beast_1"];
    }
    
        CGFloat sc =  (screenW/self.myimageview.image.size.width);
        self.myimageview.frame = CGRectMake(0, 0, screenW, self.myimageview.image.size.height * sc);
        self.myimageview.scaleNum = 1/sc;
        self.myimageview.newcolor = [UIColor redColor];
    
    
    NSArray *colorarray = @[[UIColor blackColor],[UIColor redColor ],[UIColor greenColor],[UIColor yellowColor],[UIColor brownColor],[UIColor blueColor],[UIColor grayColor]];
    CGFloat  buttonjianju = ([UIScreen mainScreen].bounds.size.width - 20 * colorarray.count)/(colorarray.count +1);
    
    
    for (int a = 0;  a < colorarray.count;  a ++) {
        UIColor *color = colorarray[a];
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(buttonjianju + a *(20 + buttonjianju), [UIScreen mainScreen].bounds.size.height - 20 - 100, 20, 30);
        button.backgroundColor = color;
        [button addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:button];
        button.showsTouchWhenHighlighted=YES;
        
    }
    
}
//放大缩小
-(void)handleTapGesture:(UIGestureRecognizer*)sender
{
    if(_scrollView.zoomScale > 1.0){
        [_scrollView setZoomScale:1.0 animated:YES];
    }else{
        [_scrollView setZoomScale:4.0 animated:YES];
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return _myimageview;
}


- (void)setNav
{
    
    
    
    //返回
    self.shapeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.shapeButton.sd_layout.heightIs(24).widthIs(24);
    [self.shapeButton setImage:[UIImage imageNamed:@"Shape"] forState:UIControlStateNormal];
    [self.shapeButton addTarget:self action:@selector(shapeButtonBarButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    //保存
    self.keepButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.keepButton.sd_layout.heightIs(24).widthIs(24);
    [self.keepButton setImage:[UIImage imageNamed:@"保存"] forState:UIControlStateNormal];
    [self.keepButton addTarget:self action:@selector(keepButtonBarButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    //分享
    self.shareButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.shareButton.sd_layout.heightIs(24).widthIs(24);
    [self.shareButton setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(shareButtonBarButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    //撤销
    self.revokeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.revokeButton.sd_layout.heightIs(24).widthIs(24);
    [self.revokeButton setImage:[UIImage imageNamed:@"撤销"] forState:UIControlStateNormal];
    [self.revokeButton addTarget:self action:@selector(revokeButtonBarButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    
    /**
     width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和  边界间距为5pix，所以width设为-5时，间距正好调整为0；width为正数 时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = 50;
    self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:_shapeButton],negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:_keepButton],negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:_shareButton],negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:_revokeButton]];
}
// 返回
- (void)shapeButtonBarButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.myimageview saveImage:self.myimageview.image with:@"besta1"];
    
    
}
// 保存 到相册
- (void)loadImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}
// 保存到相册回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    
    [SVProgressHUD showSuccessWithStatus:@"Success"];
    
}

// 保存到相册按钮
- (void)keepButtonBarButtonAction
{
    
    UIAlertController *ale = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存到相册" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self loadImageFinished:self.myimageview.image];
        
    }];
    UIAlertAction *cancelAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [ale addAction:cancelAction];
    [ale addAction:cancelAction1];
    
    [self presentViewController:ale animated:YES completion:nil];
    
    
    
    
    
}
// 分享按钮
- (void)shareButtonBarButtonAction
{
    
}
// 撤销 按钮
- (void)revokeButtonBarButtonAction
{
    
    self.myimageview .image = [UIImage imageNamed:@"beast_1"];
    
    
    
}
// 颜色的选择button的
-(void)action:(UIButton*)button
{
    self.myimageview.newcolor = button.backgroundColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
