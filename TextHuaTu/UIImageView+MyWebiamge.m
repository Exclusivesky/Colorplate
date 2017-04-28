
//
//  UIImageView+MyWebiamge.m
//  This colour
//
//  Created by 赵红亮 on 2017/4/26.
//  Copyright © 2017年 韩一博. All rights reserved.
//

#import "UIImageView+MyWebiamge.h"

@implementation UIImageView (MyWebiamge)
-(void)my_setImageWithURL:(NSURL*)url completed:(completed)block;
{
  
    NSString *urlstr = [[NSString stringWithFormat:@"%@",url] md5Str];
    //拿到图片
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/%@.png",paths[0],urlstr];
    NSLog(@"imagepath=============%@",path);
    
    
    //设置一个图片的存储路径
        // 拿到沙盒路径图片
    UIImage *imgFromUrl3=[[UIImage alloc]initWithContentsOfFile:path];
    if (imgFromUrl3) {
        self.image = imgFromUrl3;
        block(imgFromUrl3,nil);

    }else {
        
        [self sd_setImageWithURL:url completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            block(image,error);
        }];
    }
    
}
/*
 保存图片
 **/
-(void)saveImage:(UIImage *)image with:(NSString*)url;
{
    url = [url md5Str];
    //拿到图片
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [NSString stringWithFormat:@"%@/%@.png",paths[0],url];
    //设置一个图片的存储路径
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(image) writeToFile:path atomically:NO];

}

@end
