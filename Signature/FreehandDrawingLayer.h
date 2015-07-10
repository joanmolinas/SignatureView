//
//  FreehandDrawingLayer.h
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface FreehandDrawingLayer : CAShapeLayer
- (void)drawPointInContext:(CGContextRef)context from:(CGPoint)from to:(CGPoint)to color:(CGColorRef)color;

@end
