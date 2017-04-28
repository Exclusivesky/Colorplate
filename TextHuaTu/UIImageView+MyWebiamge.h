//
//  UIImageView+MyWebiamge.h
//  This colour
//
//  Created by 赵红亮 on 2017/4/26.
//  Copyright © 2017年 韩一博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completed) (UIImage *image,NSError *error);

@interface UIImageView (MyWebiamge)
/*
 获取图片
 **/
-(void)my_setImageWithURL:(NSURL*)url completed:(completed)block;
/*
 保存图片
 **/
-(void)saveImage:(UIImage *)image with:(NSString*)url;

@end
