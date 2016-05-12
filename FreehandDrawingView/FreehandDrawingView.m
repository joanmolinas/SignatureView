//
// Copyright (c) Badoo Trading Limited, 2010-present. All rights reserved.
//

#import "FreehandDrawingView.h"

@interface FreehandDrawingView ()
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, assign) CGPoint previousPoint;
@end

@implementation FreehandDrawingView

#pragma mark - Class Methods

+ (NSInteger)lineWidth {
    return 2;
}

#pragma mark - Life cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupComponentsFromView];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    [self.path stroke];
}

#pragma mark - Private api

- (void)setupComponentsFromView {
    self.previousPoint = CGPointZero;
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(gesture:)];
    
    gesture.maximumNumberOfTouches = gesture.minimumNumberOfTouches = 1;
    [self addGestureRecognizer:gesture];
}

- (void)setupBezierPath {
    self.path = [UIBezierPath bezierPath];
    [self.path setLineWidth:[[self class] lineWidth]];
}

- (void)gesture:(UIGestureRecognizer *)sender {
    CGPoint currentPoint = [sender locationInView:self];
    CGPoint middlePoint = [self middlePointWithLastPoint:self.previousPoint toPoint:currentPoint];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        if (self.path == nil) {
            [self setupBezierPath];
        }
        [self.path moveToPoint:currentPoint];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.path addQuadCurveToPoint:middlePoint controlPoint:self.previousPoint];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.delegate) {
            [self.delegate freeHandDrawingViewDidFinishDrawing:self];
        }
    }
    
    self.previousPoint = currentPoint;
    [self setNeedsDisplay];
}

- (CGPoint)middlePointWithLastPoint:(CGPoint)lastPoint toPoint:(CGPoint)toPoint {
    return CGPointMake((lastPoint.x + toPoint.x) / 2.0f, (lastPoint.y + toPoint.y) / 2.0f);
}

#pragma mark - Public api

- (void)removeSignature {
    self.previousPoint = CGPointZero;
    self.path = nil;
    [self setNeedsDisplay];
}

- (UIImage *)signatureImage {
    return [self signatureImageWithLineWidth:0];
}

- (UIImage *)signatureImageWithLineWidth:(CGFloat)lineWidth {
    if (self.path == nil) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    self.path.lineWidth = lineWidth ?: [[UIScreen mainScreen] scale];
    [self.path stroke];
    UIImage *signatureImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return signatureImage;
}

@end
