//
//  ToolMethod.h
//  Easyto
//
//  Created by cherrydemo M on 16/8/29.
//  Copyright © 2016年 cherry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolMethod : NSObject

//获取设备唯一标示UUID
+ (NSString *)UUIDString;

//获取当前controller
+ (UIViewController *)getCurrentViewController;

//默认格式弹框
+ (void)alertWithString:(NSString *)alertString;


#pragma mark - 时间处理
//yyyyMMddHHmmss时间，转成mm:ss，昨天，星期x，yy/MM/dd
//isShowToday YES:显示“今天”  NO:显示“mm:ss”
+ (NSString *)dealSureDateWithString:(NSString *)dateString isShowToday:(BOOL)isShowToday;

//yyyy-MM-dd HH:mm:ss时间，转成昨天，MM月dd日
+ (NSString *)transitionDateWithString:(NSString *)dateString;



//yyyyMMddHHmmss时间，转成“HH:mm”
+ (NSString *)dealDetailDateWithDateString:(NSString *)dateString;

//xxx时长(秒)，转换成 mm:ss
+ (NSString *)dealIntervalDateWithString:(NSString *)intervalString;

//获取该时区的当前时间
+ (NSDate *)dateWithTimeZone:(int)timeZone;

//字符串非空判断
+ (NSString *)isNullToString:(id)string;

@end
