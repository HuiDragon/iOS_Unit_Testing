//
//  ViewController.m
//  MapleLeafCalculator
//
//  Created by Liuguiliang on 2017/2/28.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
@interface ViewController ()
@property (strong) Calculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculator = [[Calculator alloc] init];

}
- (IBAction)press:(id)sender
{
    [self.calculator input:[sender titleForState:UIControlStateNormal]];
    [self.displayField setText:[self.calculator displayValue]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
