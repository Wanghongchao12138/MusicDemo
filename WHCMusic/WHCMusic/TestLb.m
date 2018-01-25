//
//  TestLb.m
//  WHCMusic
//
//  Created by 王红超 on 2018/1/25.
//  Copyright © 2018年 WHC. All rights reserved.
//

#import "TestLb.h"

@implementation TestLb

-(void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    //    CGFloat labelHeight = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)].height;
    //    int count = (int)(labelHeight / self.font.lineHeight);
    
    [[UIColor greenColor] setFill];
    UIRectFillUsingBlendMode(CGRectMake(0, 0, _progress * rect.size.width, rect.size.height), kCGBlendModeSourceIn);
}


@end
