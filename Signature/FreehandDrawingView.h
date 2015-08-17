//
//  FreehandDrawingView.h
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
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
@end
