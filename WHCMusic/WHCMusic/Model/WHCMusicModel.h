//
//  WHCMusicModel.h
//  WHCMusic
//
//  Created by 王红超 on 2018/1/18.
//  Copyright © 2018年 WHC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHCMusicModel : NSObject
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *lrc;
@property (nonatomic, copy) NSString *mp3;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *singer;
@property (nonatomic, copy) NSString *zhuanji;
@property (nonatomic, assign) NSNumber *type;
@end
