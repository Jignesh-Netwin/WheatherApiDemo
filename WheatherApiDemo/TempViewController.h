//
//  TempViewController.h
//  WheatherApiDemo
//
//  Created by Jignesh on 19/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface TempViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    MBProgressHUD *HUD;

    IBOutlet UITableView *table_slectedCityTemp;
}
@property (strong, nonatomic) NSString *str_selectedCityName;
-(IBAction)buttonBackDidPressed:(id)sender;

@end
