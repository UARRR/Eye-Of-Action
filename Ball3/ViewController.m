//
//  ViewController.m
//  Ball3
//
//  Created by Marcel Wichmann on 1/24/13.
//  Copyright (c) 2013 Marcel Wichmann. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () {    
    CAGradientLayer *gradient;
    NSArray *predictionArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    predictionArray = @[@"ACTION",@"BOOM",@"EXPLOSION",@"GIRL POWER",@"#aufschrei",@"CHUCK NORRIS",@"RUMBLE"];
    
    self.predictionLabel.layer.cornerRadius = 150;
    
    gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0] CGColor],(id)[[UIColor grayColor] CGColor]];
    [self.view.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    NSUInteger zufallskatze = arc4random_uniform(predictionArray.count);
    self.predictionLabel.text = predictionArray[zufallskatze];
    
    CGFloat red = arc4random_uniform(100)/100.0;
    CGFloat green = arc4random_uniform(100)/100.0;
    CGFloat blue = arc4random_uniform(100)/100.0;
    self.predictionLabel.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.predictionLabel.textColor = [UIColor whiteColor];
    
    red = arc4random_uniform(100)/100.0;
    green = arc4random_uniform(100)/100.0;
    blue = arc4random_uniform(100)/100.0;
    gradient.colors = @[(id)[[UIColor colorWithWhite: 1.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:red green:green blue:blue alpha:1.0] CGColor]];
}

@end
