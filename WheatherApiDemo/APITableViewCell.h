//
//  APITableViewCell.h
//  WheatherApiDemo
//
//  Created by Jignesh on 18/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label_TempDay;
@property (weak, nonatomic) IBOutlet UILabel *label_TempNight;
@property (weak, nonatomic) IBOutlet UILabel *lable_Degree;
@property (weak, nonatomic) IBOutlet UILabel *lable_Whter;
@end
