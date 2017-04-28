//
//  NSString+Common.h
//  ZhangcaiLicaishi
//
//  Created by Wujg on 15/4/13.
//  Copyright (c) 2015年 hetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Common)

- (NSString *)md5Str;
- (NSString *)sha1Str;

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

+ (NSString *)sizeDisplayWithByte:(CGFloat)sizeOfByte;

- (NSRange)rangeByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;
- (NSRange)rangeByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;

- (NSString *)stringByTrimmingLeftCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingRightCharactersInSet:(NSCharacterSet *)characterSet;

//转换拼音
- (NSString *)transformToPinyin;

#pragma mark -
#pragma mark - 验证
- (NSString *)trimString;
- (NSString *)trimWhitespace;
- (BOOL)isEmpty;
- (BOOL)isEmptyOrNull;
//判断字符串是否都为空格“ ”
- (BOOL)isAllSpaceText;
//手机号验证
- (BOOL)isPhoneNumber;
//Email验证
- (BOOL)isEmail;
//判断是否为整形
- (BOOL)isPureInt;
//判断是否为浮点形
- (BOOL)isPureFloat;
//去除字符串前后的空白,不包含换行符
- (NSString *)trim;
/**
 Returns a new UUID NSString
 e.g. "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 */
+ (NSString *)stringWithUUID;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode;
- (CGSize)textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)breakMode align:(NSTextAlignment)alignment;

/** 时间数据转化 */
+ (NSString *)timeIntervalToMMSSFormat:(NSTimeInterval)interval;

/** 时间戳转时间 **/
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

//文件下载保存的路径
+ (NSString *)downloadUrlPath;
//根据id获取本地文件下载路径
+ (NSString *)getDownloadUrlLocalPath:(NSString *)fileIdentifier;
/* 存取字符串 NSUserDefault */
+ (id)getUserDefaultKey:(NSString *)keyID;
+ (void)setUserDefault:(id)string withKey:(NSString *)keyID;

- (NSString *)removeSpacesLowercaseString;
@end
