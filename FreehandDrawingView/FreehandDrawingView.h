//
// Copyright (c) Badoo Trading Limited, 2010-present. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FreehandDrawingView;

@protocol FreehandDrawingViewDelegate
- (void)freeHandDrawingViewDidFinishDrawing:(FreehandDrawingView *)drawingView;
@end

@interface FreehandDrawingView : UIView

@property (weak, nonatomic) id<FreehandDrawingViewDelegate> delegate;

- (void)removeSignature;
- (UIImage *)signatureImage;
- (UIImage *)signatureImageWithLineWidth:(CGFloat)lineWidth;

@end
