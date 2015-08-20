//
//  CityViewViewController.m
//  WheatherApiDemo
//
//  Created by Jignesh on 18/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import "CityViewViewController.h"
#import "APITableViewCell.h"
#import "Constant.h"
#import "TempViewController.h"
@interface CityViewViewController ()
{
        NSMutableArray *    arrayForCityNames;
}

@end

@implementation CityViewViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        arrayForCityNames = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [arrayForCityNames addObject:@"Nashik"];
    
    // setup cell for table view
    [self registerNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 */


#pragma mark - 
#pragma mark - IBAtion user define functions
-(IBAction)buttonCityNameAddDidPressed:(id)sender
{

    
    if(txt_CityName.text.length == 0)
    {
    
        LSAlert(@"Error", @"Please enter city name to add");
        return;
    }
    else
    {
    
        [arrayForCityNames addObject:txt_CityName.text];
        [table_CityNames   reloadData];
    }
    
}
#pragma mark -


-(void) registerNib
{

    [table_CityNames registerNib:[UINib nibWithNibName:@"APITableViewCell" bundle:nil] forCellReuseIdentifier:@"CellIdentfier"];
}

#pragma mark -
#pragma mark - Table view datasource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.textLabel setText:[arrayForCityNames objectAtIndex:indexPath.row]];
    
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return arrayForCityNames.count;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TempViewController *tempview = [[TempViewController alloc] initWithNibName:@"TempViewController" bundle:nil];
    
    tempview.str_selectedCityName = [arrayForCityNames objectAtIndex:indexPath.row];
    
    NSLog(@"Selected city name is %@",tempview.str_selectedCityName);
    [self presentViewController:tempview animated:YES completion:^{
        
    }];

    
}
-(IBAction)buttonBackDidPressed:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



@end
