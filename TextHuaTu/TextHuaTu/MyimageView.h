//
//  MyimageView.h
//  TextHuaTu
//
//  Created by 赵红亮 on 2017/3/24.
//  Copyright © 2017年 赵红亮. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MyimageView : UIImageView
/*
 记录 开始时候的图片 就是为填充时候图片
 **/
@property (nonatomic,strong) UIImage *baseimage;
/*
当前需要填充的颜色
 **/
@property (nonatomic,strong) UIColor  *newcolor;
@end
