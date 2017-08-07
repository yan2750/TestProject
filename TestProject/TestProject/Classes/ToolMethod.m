 //
//  ToolMethod.m
//  Easyto
//
//  Created by cherrydemo M on 16/8/29.
//  Copyright © 2016年 cherry. All rights reserved.
//

#import "ToolMethod.h"
#import <SSKeychain/SSKeychain.h>


@implementation ToolMethod

#pragma mark - 获取UUID
+ (NSString *)UUIDString
{
    // uuid
    NSString *UUID = [SSKeychain passwordForService:@"com.easyto" account:@"UUID"];
    
    if (UUID == nil || [UUID isEqualToString:@""]) {
        NSString* uuid = [[NSUUID UUID] UUIDString];
        [SSKeychain setPassword:uuid forService:@"com.easyto" account:@"UUID"];
        UUID = uuid;
    }
    return UUID;
}

//应用信息
- (NSDictionary *)applicationInformation
{
    NSDictionary *applicationInformation = [[NSBundle mainBundle] infoDictionary];
    return applicationInformation;
}



#pragma mark - 时间处理
//yyyyMMddHHmmss时间，转成mm:ss，昨天，星期x，yy/MM/dd
+ (NSString *)dealSureDateWithString:(NSString *)dateString isShowToday:(BOOL)isShowToday
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSDate *createDate = [formatter dateFromString:dateString];
    
    //    secondsFromGMT 取得格林威治时间差秒
    NSTimeInterval interval = [[NSTimeZone systemTimeZone] secondsFromGMT];
    createDate = [createDate dateByAddingTimeInterval:interval-8*60*60];
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *component = [calender componentsInTimeZone:[NSTimeZone systemTimeZone] fromDate:createDate];
    NSDateComponents *currentComponent = [calender componentsInTimeZone:[NSTimeZone systemTimeZone] fromDate:[NSDate date]];
    
    BOOL todayFlag = [calender isDateInToday:createDate];
    BOOL yesterdayFlag = [calender isDateInYesterday:createDate];
    BOOL weekFlag = currentComponent.weekOfYear == component.weekOfYear;
    NSString *endString = [NSString string];
    
    if (todayFlag) {
        formatter.dateFormat = @"HH:mm";
        endString = isShowToday?@"今天":[formatter stringFromDate:createDate];
        //        endString = [formatter stringFromDate:createDate];
    }else if (yesterdayFlag){
        endString = @"昨天";
    }else if (weekFlag){
        NSInteger num = component.weekday;
        switch (num) {
            case 1:
                endString = @"星期日";
                break;
                
            case 2:
                endString = @"星期一";
                break;
                
            case 3:
                endString = @"星期二";
                break;
                
            case 4:
                endString = @"星期三";
                break;
                
            case 5:
                endString = @"星期四";
                break;
                
            case 6:
                endString = @"星期五";
                break;
                
            case 7:
                endString = @"星期六";
                break;
                
            default:
                break;
        }
    }else{
        formatter.dateFormat = @"yy/M/d";
        endString = [formatter stringFromDate:createDate];
    }
    return endString;
}

//yyyy-MM-dd HH:mm:ss时间，转成昨天，MM月dd日
+ (NSString *)transitionDateWithString:(NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *createDate = [formatter dateFromString:dateString];
    
    //    secondsFromGMT 取得格林威治时间差秒
    NSTimeInterval interval = [[NSTimeZone systemTimeZone] secondsFromGMT];
    createDate = [createDate dateByAddingTimeInterval:interval-8*60*60];
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    BOOL todayFlag = [calender isDateInToday:createDate];
    BOOL yesterdayFlag = [calender isDateInYesterday:createDate];
    NSString *endString = [NSString string];
    
    formatter.dateFormat = @"HH:mm";
    endString = [formatter stringFromDate:createDate];
    if (todayFlag) {
        
    }else if (yesterdayFlag){
        endString = [endString stringByAppendingString:[NSString stringWithFormat:@"\n%@", @"昨天"]];
    }else{
        formatter.dateFormat = @"M月d日";
        NSString *formatterString = [formatter stringFromDate:createDate];
        endString = [endString stringByAppendingString:[NSString stringWithFormat:@"\n%@", formatterString]];
    }
    return endString;
}

//yyyyMMddHHmmss时间，转成“HH:mm”
+ (NSString *)dealDetailDateWithDateString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSDate *date = [formatter dateFromString:dateString];
    formatter.dateFormat = @"HH:mm";
    return [formatter stringFromDate:date];
}

//xxx时长(秒)，转换成 mm:ss
+ (NSString *)dealIntervalDateWithString:(NSString *)intervalString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSDate *durationDate = [NSDate dateWithTimeIntervalSince1970:[intervalString integerValue]];
    formatter.dateFormat = @"mm:ss";
    return [formatter stringFromDate:durationDate];
}

//获取该时区的当前时间
+ (NSDate *)dateWithTimeZone:(int)timeZone
{
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate:date];
    date = [date dateByAddingTimeInterval:timeZone*60*60 - interval];
    return date;
}

+ (NSString *)isNullToString:(id)string
{
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"])
    {
        return nil;
        
        
    }else
    {
        
        return (NSString *)string;
    }
}


@end
