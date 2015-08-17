//
//  SignatureView.m
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "SignatureView.h"
#import "FreehandDrawingView.h"

@interface SignatureView ()

@end

@implementation SignatureView

- (UIImage *)getSignatureImage {
    for (UIView *v in self.subviews) {
        if ([v class] == [FreehandDrawingView class]) {
            return [(FreehandDrawingView *)v getSignatureImage];
        }
    }
    return nil;
}

@end
