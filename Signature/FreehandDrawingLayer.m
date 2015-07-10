//
//  FreehandDrawingLayer.m
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "FreehandDrawingLayer.h"

@implementation FreehandDrawingLayer
+ (float)lineWith {
    return 4.0;
}
- (void)drawPointInContext:(CGContextRef)context from:(CGPoint)from to:(CGPoint)to color:(CGColorRef)color{
    
    
    CGContextSetFillColorWithColor(context, color);
    CGContextFillRect(context, self.bounds);
    self.strokeColor = color;
    CGContextSetLineWidth(context, [[self class] lineWith]);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    CGContextStrokePath(context);
}
@end
