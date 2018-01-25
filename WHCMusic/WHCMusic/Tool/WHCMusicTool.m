//
//  WHCMusicTool.m
//  WHCMusic
//
//  Created by 王红超 on 2018/1/18.
//  Copyright © 2018年 WHC. All rights reserved.
//

#import "WHCMusicTool.h"
#import <AVFoundation/AVFoundation.h>

@interface WHCMusicTool ()
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, copy) NSString *currentName;
@property (nonatomic, assign) CGFloat musicProgre;

@end

@implementation WHCMusicTool
// 单例
+(instancetype)shareMusicTool {
    static WHCMusicTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WHCMusicTool alloc]init];
        
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
    });
    return instance;
}
// 播放
-(void)playMusicWithMusicName:(NSString *)name {
    
    if (name == nil) {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    
    if (path == nil) {
        return;
    }
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    if (![self.currentName isEqualToString:name]) {
        
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    }
    self.currentName = name;
    [self.player prepareToPlay];
    [self.player play];
}
// 暂停
-(void) pause {
    
    if (self.player.playing) {
        
        [self.player pause];
    }
}
/// 总时长字符串
-(NSString *)durationMusicString {
    
    return [NSString stringWithFormat:@"%02d:%02d",(int)self.player.duration / 60, (int)self.player.duration % 60];
    
}
/// 总时长
-(NSTimeInterval)durationMusic {
    
    return self.player.duration;
}
/// 返回当前时长字符串
-(NSString *)currentTimeString {
    
    return [NSString stringWithFormat:@"%02d:%02d",(int)self.player.currentTime / 60, (int)self.player.currentTime % 60];
    
}
/// 返回当前时长
-(NSTimeInterval)currentTime {
    
    return self.player.currentTime;
    
}

/// 当前进度
-(CGFloat)musicProgress {
    
    return self.player.currentTime / self.player.duration;
}
@end
