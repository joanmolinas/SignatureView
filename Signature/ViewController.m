//
//  ViewController.m
//  Signature
//
//  Created by Joan Molinas on 07/07/2015.
//  Copyright (c) 2015 Joan Molinas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet SignatureView *signatureView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getImageSignature:(UIButton *)sender {
    self.imageView.image = [self.signatureView getSignatureImage];
}

@end
