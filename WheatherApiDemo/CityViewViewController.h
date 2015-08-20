//
//  CityViewViewController.h
//  WheatherApiDemo
//
//  Created by Jignesh on 18/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityViewViewController : UIViewController
<
    UITableViewDataSource,
    UITableViewDelegate
>
{

    IBOutlet UITextField    *   txt_CityName;
    IBOutlet UITableView    *   table_CityNames;
    
    
}

-(IBAction)buttonBackDidPressed:(id)sender;
-(IBAction)buttonCityNameAddDidPressed:(id)sender;

@end
