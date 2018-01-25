//
//  WHCMusicTool.h
//  WHCMusic
//
//  Created by 王红超 on 2018/1/18.
//  Copyright © 2018年 WHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WHCMusicTool : NSObject
+(instancetype)shareMusicTool;
/// 播放
/// @param name 歌曲名称
-(void)playMusicWithMusicName:(NSString *)name;
/// 暂停
-(void)pause;
/// 歌曲总时长字符串
-(NSString *)durationMusicString;
/// 总时长
-(NSTimeInterval)durationMusic;
/// 当前播放时长
-(NSString *)currentTimeString;
/// 当前时长
-(NSTimeInterval)currentTime;
/// 进度
-(CGFloat)musicProgress;
@end
