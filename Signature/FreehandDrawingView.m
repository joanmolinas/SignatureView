//
//  FreehandDrawingView.m
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "FreehandDrawingView.h"

@interface FreehandDrawingView ()
@property (nonatomic, strong) UIImage *buffer;
@property (nonatomic, strong) UIColor *drawColor;
@property (nonatomic, assign) CGPoint lastPoint;
@end

@implementation FreehandDrawingView

+ (Class)layerClass {
    return [FreehandDrawingLayer class];
}
+ (UIColor *)drawColor {
    return [UIColor blackColor];
}
#pragma mark - init
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupGestureRecognizers];
    [self setupDrawColor];
}

#pragma mark - Setups
- (void)setupDrawColor {
    self.drawColor = [FreehandDrawingView drawColor];
}
- (void)setupGestureRecognizers {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:panGesture];
}

#pragma mark - Gesture actions
- (void)handlePan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            [self startAtPoint:point];
            break;
        case UIGestureRecognizerStateChanged:
            [self continueAtPoint:point];
            break;
        case UIGestureRecognizerStateEnded:
            [self endAtPoint:point];
            break;
        case UIGestureRecognizerStateCancelled:
            [self endAtPoint:point];
            break;
        default:
            NSAssert(false, @"State not handled");
            break;
    }
}

- (UIImage *)drawLine:(CGPoint)a to:(CGPoint)b image:(UIImage *)imageBuffer {
    CGSize size = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    if (imageBuffer) {
        [imageBuffer drawInRect:self.bounds];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [(FreehandDrawingLayer *)self.layer drawPointInContext:context from:a to:b color:[UIColor clearColor].CGColor];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)startAtPoint:(CGPoint)point {
    self.lastPoint = point;
}

- (void)continueAtPoint:(CGPoint)point {
    @autoreleasepool {
        self.buffer = [self drawLine:self.lastPoint to:point image:self.buffer];
        self.layer.contents = (id)self.buffer.CGImage;
        self.lastPoint = point;
    }
}
- (void)endAtPoint:(CGPoint)point {
    self.lastPoint = CGPointZero;
}

#pragma mark - Get signature
- (UIImage *)getSignatureImage {
    return self.buffer;
}
@end
