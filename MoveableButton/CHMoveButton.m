//
//  CHMoveButton.m
//  MoveableButton
//
//  Created by 楊利嘉 on 2016/9/22.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "CHMoveButton.h"


@interface CHMoveButton ()

@property(nonatomic, assign)BOOL isMoved;

@end
@implementation CHMoveButton


-(instancetype)init{
    
    if (self=[super init]) {
        
        self.backgroundColor=[UIColor whiteColor];
        
        self.alpha=0.8;
    }
    
    
    return self;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    
    //本次
    CGPoint current = [touch locationInView:self];
    //上次
    CGPoint previous = [touch previousLocationInView:self];
    
    CGPoint center = self.center;
    
    //中心移动
    center.x += current.x-previous.x;
    center.y += current.y-previous.y;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    CGFloat xMIN = self.frame.size.width *0.5f;
    CGFloat xMAX = screenSize.width -xMIN;
    
    CGFloat yMIN = self.frame.size.height *0.5;
    
    
//TODO: 这里添加navigationBar,tabbar高度,或者自定义高度
    CGFloat yMAX = screenSize.height - self.frame.size.height *0.5f;
    
    
//    if (center.x > xMAX) center.x = xMAX;
//    
//    if (center.x < xMIN) center.x = xMIN;
//    
//    if (center.y > yMAX) center.y = yMAX;
//    
//    if (center.y < yMIN) center.y = yMIN;
   
    center.x = (center.x > xMAX)? xMAX :center.x;
    center.x = (center.x < xMIN)? xMIN :center.x;
    center.y = (center.y > yMAX)? yMAX :center.y;
    center.y = (center.y < yMIN)? yMIN :center.y;
    
    self.center = center;
    
    if (current.x-previous.x >= 0.5f || current.y-previous.y >=0.5) {
        self.isMoved = YES;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.isMoved) {
        [super touchesEnded:touches withEvent:event];
    }
    
    self.isMoved = NO;
    
}
@end
