//
//  PWMViewController.m
//  PM
//
//  Created by kevin chen on 13-12-11.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "PWMViewController.h"
#import "PWMAddAccountViewController.h"

@interface PWMViewController ()

@end

@implementation PWMViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
    cacheArray = [loanParameter objectForKey:@"basic"];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Manage Account";
    cacheArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
    cacheArray = [loanParameter objectForKey:@"basic"];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - account about
-(IBAction)addNewAccount:(id)sender{
//    NSLog(@"add new account");
    PWMAddAccountViewController *addAccountViewController = [[PWMAddAccountViewController alloc]initWithNibName:@"PWMAddAccountViewController" bundle:Nil];
    [self.navigationController pushViewController:addAccountViewController animated:YES];
    
}
-(IBAction)editAccount:(id)sender{
//    NSLog(@"edit account");
    self.tableView.editing = !self.tableView.editing;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (cacheArray) {
        return [cacheArray count];
    }else
        return 0;
        
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    NSInteger row = [indexPath row];
    NSArray *tempArray = [cacheArray objectAtIndex:row];
    
    
    cell.textLabel.text = (NSString*)[tempArray objectAtIndex:0];
//    NSLog(@"%@",[tempArray objectAtIndex:0]);
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [cacheArray removeObjectAtIndex:row];
        NSUserDefaults *loanParameter = [NSUserDefaults standardUserDefaults];
        [loanParameter setObject:cacheArray forKey:@"basic"];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = [indexPath row];
    NSNumber *index = [NSNumber numberWithInteger:row];
    NSArray *tempArray = [cacheArray objectAtIndex:row];
    PWMAddAccountViewController *showInformation = [[PWMAddAccountViewController alloc]initWithNibNameStyle:@"PWMAddAccountViewController" array:tempArray index:index];
    [self.navigationController pushViewController:showInformation animated:YES];
    
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
