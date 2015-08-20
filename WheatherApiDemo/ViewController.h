//
//  ViewController.h
//  WheatherApiDemo
//
//  Created by Jignesh on 18/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"
@interface ViewController : UIViewController <CLLocationManagerDelegate>
{

    CLLocationManager * locationManager;
    CLGeocoder        * geocoder;
    CLLocation        * newLocation;
    
    MBProgressHUD     * HUD;
    
    NSString          * city;
    
}
-(IBAction)buttonCurrentLocationDidPressed:(id)sender;
-(IBAction)buttonEnterCityDidPressed:(id)sender;

@end

