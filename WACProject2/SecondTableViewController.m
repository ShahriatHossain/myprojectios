//
//  SecondTableViewController.m
//  WACProject2
//
//  Created by ImpleVista on 8/12/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController

NSArray * favBC;
NSArray * relToMe;
NSArray * repByMe;
NSArray * redForApp;
NSArray * appBC;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    favBC = [NSArray arrayWithObjects:@"IDEA1",@"NEW",@"IN VAL...",@"IN ESTI...",@"READY...",@"APPROV...",@"IT CHAN...",@"UNDER...",@"IMPLEM",@"CLOSED", nil];
    
    relToMe = [NSArray arrayWithObjects:@"IDEA2",@"NEW",@"IN VAL...",@"IN ESTI...",@"READY...",@"APPROV...",@"IT CHAN...",@"UNDER...",@"IMPLEM",@"CLOSED", nil];
    
    repByMe = [NSArray arrayWithObjects:@"IDEA3",@"NEW",@"IN VAL...",@"IN ESTI...",@"READY...",@"APPROV...",@"IT CHAN...",@"UNDER...",@"IMPLEM",@"CLOSED", nil];
    
    redForApp = [NSArray arrayWithObjects:@"IDEA4",@"NEW",@"IN VAL...",@"IN ESTI...",@"READY...",@"APPROV...",@"IT CHAN...",@"UNDER...",@"IMPLEM",@"CLOSED", nil];
    
    appBC = [NSArray arrayWithObjects:@"IDEA5",@"NEW",@"IN VAL...",@"IN ESTI...",@"READY...",@"APPROV...",@"IT CHAN...",@"UNDER...",@"IMPLEM",@"CLOSED", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if([_businessName isEqualToString:@"Favorite BC"]){
        return [favBC count];
        
    }else if ([_businessName isEqualToString:@"Related to me"]){
        return [relToMe count];
        
    }else if ([_businessName isEqualToString:@"Reported by me"]){
        return [repByMe count];
        
    }else if ([_businessName isEqualToString:@"Ready for approval"]){
        return [redForApp count];
        
    }else if ([_businessName isEqualToString:@"Approved BC"]){
        return [appBC count];
    }
    
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Business2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if([_businessName isEqualToString:@"Favorite BC"]){
        cell.textLabel.text = [favBC objectAtIndex:indexPath.row];
        
    }else if ([_businessName isEqualToString:@"Related to me"]){
        cell.textLabel.text = [relToMe objectAtIndex:indexPath.row];
        
    }else if ([_businessName isEqualToString:@"Reported by me"]){
        cell.textLabel.text = [repByMe objectAtIndex:indexPath.row];
        
    }else if ([_businessName isEqualToString:@"Ready for approval"]){
        cell.textLabel.text = [redForApp objectAtIndex:indexPath.row];
        
    }else if ([_businessName isEqualToString:@"Approved BC"]){
        cell.textLabel.text = [appBC objectAtIndex:indexPath.row];
        
    }
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"collectDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        CollectionViewController *destViewController = segue.destinationViewController;
        
        if([_businessName isEqualToString:@"Favorite BC"]){
            destViewController.businessName2 = [favBC objectAtIndex:indexPath.row];
            
        }else if ([_businessName isEqualToString:@"Related to me"]){
            destViewController.businessName2 = [relToMe objectAtIndex:indexPath.row];
            
        }else if ([_businessName isEqualToString:@"Reported by me"]){
            destViewController.businessName2 = [repByMe objectAtIndex:indexPath.row];
            
        }else if ([_businessName isEqualToString:@"Ready for approval"]){
            destViewController.businessName2 = [redForApp objectAtIndex:indexPath.row];
            
        }else if ([_businessName isEqualToString:@"Approved BC"]){
            destViewController.businessName2 = [appBC objectAtIndex:indexPath.row];
        }
        
        destViewController.title = destViewController.businessName2;
        
    }
}

 */

@end
