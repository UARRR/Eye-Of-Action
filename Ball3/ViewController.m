//
//  ViewController.m
//  Ball3
//
//  Created by Marcel Wichmann on 1/24/13.
//  Copyright (c) 2013 Marcel Wichmann. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController () {
    
    CAGradientLayer *gradient;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    self.predictionArray = [[NSArray alloc] initWithObjects:
                            @"ACTION",
                            @"BOOM",
                            @"EXPLOSION",
                            @"GIRL POWER",
                            @"#aufschrei",
                            @"CHUCK NORRIS",
                            @"RUMBLE", nil];
    
    self.predictionLabel.layer.cornerRadius = 150;
    
    self.randomCat = [[NSArray alloc] initWithObjects:
                      @"cat01.png",
                      @"cat02.png",
                      @"cat03.png", nil];
    
    NSUInteger curiousCat = arc4random_uniform(self.randomCat.count);

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: [self.randomCat objectAtIndex:curiousCat]]];


    UIImage *bildBrueste = [UIImage imageNamed:@"ball3_icon.png"];
    UIImageView *bildBruesteContainer = [[UIImageView alloc] initWithImage:bildBrueste];
    [self.view insertSubview:bildBruesteContainer atIndex:30];
    
    

    
	// Do any additional setup after loading the view, typically from a nib.

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSUInteger zufallsText = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex: zufallsText];
   
    NSUInteger curiousCat = arc4random_uniform(self.randomCat.count);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: [self.randomCat objectAtIndex:curiousCat]]];
    
    SystemSoundID sounds[10];
    //Path for our sound:
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Transform" ofType:@"wav"];
    CFURLRef soundURL = (__bridge CFURLRef)[NSURL fileURLWithPath:soundPath];
    AudioServicesCreateSystemSoundID(soundURL, &sounds[0]);
    
    AudioServicesPlaySystemSound(sounds[0]);
    
    CGFloat red = arc4random_uniform(100)/100.0;
    CGFloat green = arc4random_uniform(100)/100.0;
    CGFloat blue = arc4random_uniform(100)/100.0;
    self.predictionLabel.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.predictionLabel.textColor = [UIColor whiteColor];
    
    
    

    
    
}
@end
