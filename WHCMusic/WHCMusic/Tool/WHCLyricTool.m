//
//  WHCLyricTool.m
//  WHCMusic
//
//  Created by 王红超 on 2018/1/18.
//  Copyright © 2018年 WHC. All rights reserved.
//

#import "WHCLyricTool.h"
#import "WHCLrcModel.h"

@implementation WHCLyricTool
+(NSArray *)lyricListWithName:(NSString *)name {
    NSMutableArray *resArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    NSString *originString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [originString componentsSeparatedByString:@"\n"];
    
    for (NSString *line in lines) {
        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"\\[[0-9][0-9]:[0-9][0-9]\\.[0-9][0-9]\\]" options:0 error:nil];
        NSArray *arr = [regular matchesInString:line options:NSMatchingReportCompletion range:NSMakeRange(0, line.length)];
        NSTextCheckingResult *lastResult = [arr lastObject];
        NSString *strText = [line substringFromIndex: lastResult.range.location + lastResult.range.length ];
        
        for (NSTextCheckingResult *result in arr) {
            NSString *strTimer = [line substringWithRange:result.range];
            WHCLrcModel *model = [[WHCLrcModel alloc]init];
            model.text = strText;
        
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"[mm:ss.SS]";
            NSDate *dateModel =  [formatter dateFromString:strTimer];
            
            NSDate *dateZero =  [formatter dateFromString:@"[00:00.00]"];
            model.time = [dateModel timeIntervalSinceDate:dateZero];
            
            [resArray addObject:model];
        }
    }
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES];
    return [resArray sortedArrayUsingDescriptors:@[sort]];
    
}
@end
