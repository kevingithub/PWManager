//
//  PWMAddAccountViewController.h
//  PM
//
//  Created by kevin chen on 13-12-11.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWMAddAccountViewController : UIViewController{
    NSMutableArray *tempArray;
    IBOutlet UITextField *titleField;
    IBOutlet UITextField *usernameField;
    IBOutlet UITextField *passwordField;
}

-(IBAction)saveAccount:(id)sender;
-(IBAction)cancelAddAccount:(id)sender;

@end
