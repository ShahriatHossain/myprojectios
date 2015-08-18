//
//  RootTableViewController.m
//  WACProject2
//
//  Created by ImpleVista on 8/12/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

#import "RootTableViewController.h"
#import "SecondTableViewController.h"

#import "JSONModelLib.h"
#import "BusinessManager.h"
#import "HUD.h"

@interface RootTableViewController (){
    BusinessManager* _businessFeeds;
}
@end

@implementation RootTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //businesses = [NSArray arrayWithObjects:@"Favorite BC",@"Related to me",@"Reported by me", @"Ready for approval",@"Approved BC", nil];
    
    //show loader view
    [HUD showUIBlockingIndicatorWithText:@"Fetching JSON"];
    
    //fetch the feed
    _businessFeeds = [[BusinessManager alloc] initFromURLWithString:@"http://localhost:8888/json/business.json"
                                         completion:^(JSONModel *model, JSONModelError *err) {
                                             
                                             //hide the loader view
                                             [HUD hideUIBlockingIndicator];
                                             
                                             //json fetched
                                             NSLog(@"loans: %@", _businessFeeds.businesses);
                                             
                                             [self.tableView reloadData];
                                             
                                         }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_businessFeeds.businesses count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusinessModel* business = _businessFeeds.businesses[indexPath.row];
    
    static NSString *simpleTableIdentifier = @"BusinessCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", business.name];
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"arrayDetail"])
    {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        BusinessModel* business = _businessFeeds.businesses[indexPath.row];

        
        SecondTableViewController *destViewController = segue.destinationViewController;
        
        destViewController.businessName = [NSString stringWithFormat:@"%@", business.name];
        
        destViewController.title = destViewController.businessName;
        
    }
}


@end
