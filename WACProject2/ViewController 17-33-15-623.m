//
//  ViewController.m
//  WACProject2
//
//  Created by ImpleVista on 8/13/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

#import "ViewController.h"
#import "AccordionViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    array = [[NSMutableArray alloc] init];
    [array addObject:@"Apple"];
    [array addObject:@"Orange"];
    [array addObject:@"Mango"];
    [array addObject:@"Banana"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark collection view methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [array count];
}

- (UIColor*) randomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *label = (UILabel *) [cell viewWithTag:100];
    label.text = [array objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [self randomColor];
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AccordionViewController *detailVC = [[AccordionViewController alloc] init];
    detailVC.passParam= [array objectAtIndex: indexPath.row];
    detailVC.title = detailVC.passParam;
        
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
