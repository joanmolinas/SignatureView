//
//  DecorationView.m
//  Signature
//
//  Created by Joan Molinas on 08/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "DecorationView.h"

@implementation DecorationView

#pragma mark - Class methods
+ (Class)layerClass {
    return [LinesDecorationLayer class];
}
+ (UIColor *)lineColor{
    return [UIColor colorWithWhite:0.9 alpha:1.0];
}

#pragma mark - Add Lines
-(void)awakeFromNib {
    [super awakeFromNib];
    ((LinesDecorationLayer *)self.layer).color = [[self class] lineColor].CGColor;
}
- (void)layoutSubviews {
    [super layoutSubviews];
}


@end
