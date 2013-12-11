//
//  PWMViewController.h
//  PM
//
//  Created by kevin chen on 13-12-11.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWMViewController : UITableViewController
{
    NSMutableArray *cacheArray;
}


-(IBAction)addNewAccount:(id)sender;
-(IBAction)editAccount:(id)sender;

@end
