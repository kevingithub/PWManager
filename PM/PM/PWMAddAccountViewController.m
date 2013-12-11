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
        isAddAccount = TRUE;
    }
    return self;
}
- (id)initWithNibNameStyle:(NSString *)nibNameOrNil
                     array:(NSArray *)array index:(NSNumber*)index{
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {
        // Custom initialization
        showInfoArray = array;
        isAddAccount = FALSE;
        arrayIndex = index;
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
    if (showInfoArray){
        titleField.text=(NSString*)[showInfoArray objectAtIndex:0];
        usernameField.text=(NSString*)[showInfoArray objectAtIndex:1];
        passwordField.text=(NSString*)[showInfoArray objectAtIndex:2];
    }
}

-(IBAction)saveAccount:(id)sender{
    __strong NSArray *array = [[NSArray alloc]initWithObjects:
                      titleField.text, usernameField.text,passwordField.text,nil];
    NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
    if (isAddAccount){
        [tempArray addObject:array];
        [loanParameter setObject:tempArray forKey:@"basic"];
    }else{
        NSInteger row =[arrayIndex integerValue];
        [tempArray replaceObjectAtIndex:row withObject:array];
    }
    

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
