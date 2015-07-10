//
//  LinesDecorationLayer.m
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "LinesDecorationLayer.h"

@implementation LinesDecorationLayer
+(int)separatorSize {
    return 30;
}
-(void)layoutSublayers{
    [super layoutSublayers];
    [self drawLines];
}
#pragma mark - Draw Lines
-(void)drawLines {
    int separatorSize = [[self class] separatorSize];
    int filesInGrid = round(CGRectGetHeight(self.bounds)/separatorSize);
    float width = CGRectGetWidth(self.bounds);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    for (int i = 1; i <= filesInGrid; i++) {
        CGPoint pointMove = CGPointMake(0, separatorSize * i);
        CGPoint pointLine = CGPointMake(width, separatorSize * i);
        CGPathMoveToPoint(path, nil, pointMove.x, pointMove.y);
        CGPathAddLineToPoint(path, nil, pointLine.x, pointLine.y);
    }
    
    self.fillColor = nil;
    self.path = path;
    self.lineWidth = 1.5f;
    self.lineJoin = kCALineJoinRound;
}
-(void)setColor:(CGColorRef)color {
    self.strokeColor = color;
}
@end
