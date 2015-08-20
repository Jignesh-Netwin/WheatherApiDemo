//
//  TempViewController.m
//  WheatherApiDemo
//
//  Created by Jignesh on 19/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import "TempViewController.h"
#import "APITableViewCell.h"
#import "WebServiceAPI.h"
#import "tempObject.h"

@interface TempViewController ()
{

    NSMutableArray *arrayForTemparatures;
    
}

@end

@implementation TempViewController


@synthesize str_selectedCityName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

   //[self addMbProgressBar];
    arrayForTemparatures = [[NSMutableArray alloc] init];
    
    [self registerNibForTable];
    [self loadTempOfSelctedcity];
   

}

-(void) registerNibForTable
{

    [table_slectedCityTemp registerNib:[UINib nibWithNibName:@"APITableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}



-(void) loadTempOfSelctedcity
{

    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.animationType = MBProgressHUDAnimationZoomIn;
    HUD.labelText = @"Please wait....";
    NSMutableDictionary *dictionAryOfdata = [[NSMutableDictionary alloc] init];
    
    [dictionAryOfdata setObject:str_selectedCityName forKey:@"City"];
    
    WebServiceAPI *web = [[WebServiceAPI alloc] init];
    [web webService:dictionAryOfdata OnSuccess:^(id receivedString)
     {
        
        NSLog(@"succes is %@",[receivedString valueForKey:@"list"]);
        
        tempObject *object;
        
        for (NSString *str in [receivedString valueForKey:@"list"])
        {
            object                  = [[tempObject alloc] init];
            object.strDaytemp       = [[str     valueForKey:@"temp"]   valueForKey:@"day"];
            object.strnightTemp     = [[str     valueForKey:@"temp"]   valueForKey:@"eve"];
            object.strDaycloud      = [str      valueForKey:@"clouds"];
            object.strtodayWhether  = [str      valueForKey:@"humidity"];
            [arrayForTemparatures  addObject:object];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [table_slectedCityTemp reloadData];
        });
        
    }
     
    OnFailure:^(NSError *error) {
        
            
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString            *CellIdentifier = @"Cell";
    
    APITableViewCell           *cell = (APITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.backgroundColor       = [UIColor clearColor];
    
    tempObject *cellobject     = (tempObject *) [arrayForTemparatures objectAtIndex:indexPath.row];
    
    cell.label_TempDay.text    = [NSString stringWithFormat:@"%@",cellobject.strDaytemp];
    
    cell.label_TempNight.text  = [NSString stringWithFormat:@"%@",cellobject.strnightTemp];
    
    cell.lable_Degree.text     = [NSString stringWithFormat:@"%@",cellobject.strDaycloud];
    
    cell.lable_Whter.text      = [NSString stringWithFormat:@"%@",cellobject.strtodayWhether];
    
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayForTemparatures count];
}

-(IBAction)buttonBackDidPressed:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
