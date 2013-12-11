//
//  PWMAddAccountViewController.m
//  PM
//
//  Created by kevin chen on 13-12-11.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "PWMAddAccountViewController.h"

@interface PWMAddAccountViewController ()

@end

@implementation PWMAddAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
    tempArray = [loanParameter objectForKey:@"basic"];
    if (!tempArray) {
        tempArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
}

-(IBAction)saveAccount:(id)sender{
    __strong NSArray *array = [[NSArray alloc]initWithObjects:
                      titleField.text, usernameField.text,passwordField.text,nil];
    [tempArray addObject:array];
    NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
    [loanParameter setObject:tempArray forKey:@"basic"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(IBAction)cancelAddAccount:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
