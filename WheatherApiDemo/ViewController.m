//
//  ViewController.m
//  WheatherApiDemo
//
//  Created by Jignesh on 18/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import "ViewController.h"
#import "CityViewViewController.h"
#import "UIBAlertView.h"
#import "TempViewController.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -



#pragma mark -
#pragma mark - User Define Button Actions
-(IBAction)buttonCurrentLocationDidPressed:(id)sender
{

    
    [self startLocationFetching];
}

-(void) startLocationFetching
{
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.animationType = MBProgressHUDAnimationZoomIn;
    HUD.labelText = @"Finding your location..";
    
    [self checkLocationServicesTurnedOn];
    [self checkApplicationHasLocationServicesPermission];
    
    if(locationManager == nil)
    {
        locationManager = [[CLLocationManager alloc] init];
    }
    locationManager.delegate =self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation; // 10
    
    //  #warning need to change for ios 8 compatibilty
    if(IS_OS_8_OR_LATER)
    {
        [locationManager requestAlwaysAuthorization];
    }
    [locationManager startUpdatingLocation];
    
}

- (void) checkLocationServicesTurnedOn {
    if (![CLLocationManager locationServicesEnabled])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TestLS"
                                                        message:@"'Location Services' need to be on."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        [HUD hide:YES];
        return;
    }
}
-(void) checkApplicationHasLocationServicesPermission
{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TestLS"
                                                        message:@"This application needs 'Location Services' to be turned on."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        [HUD hide:YES];

        return;
    }
}

-(IBAction)buttonEnterCityDidPressed:(id)sender
{

    CityViewViewController *cityView = [[CityViewViewController alloc] initWithNibName:@"CityViewViewController" bundle:nil];
    
    [self presentViewController:cityView animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    
    
    
    CLLocation *location = [locations lastObject];
    
    
    geocoder    = [[CLGeocoder alloc] init];
    newLocation = [[CLLocation alloc]initWithLatitude:locationManager.location.coordinate.latitude
                                            longitude:locationManager.location.coordinate.longitude];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error)
         {
             return;
         }
         if (placemarks && placemarks.count > 0)
         {
             CLPlacemark *placemark = placemarks[0];
             NSDictionary *addressDictionary =
             placemark.addressDictionary;
             
             // getting current location country, state and city
             city    = [addressDictionary   objectForKey:@"City"];
             
             UIBAlertView *alert = [[UIBAlertView alloc] initWithTitle:@"Location" message:[NSString
                                                                                             stringWithFormat:@"You are located at %@",city] cancelButtonTitle:@"Ok" otherButtonTitles:nil];
             
             [alert showWithDismissHandler:^(NSInteger selectedIndex, NSString *selectedTitle, BOOL didCancel) {
                 if (didCancel)
                 {
                      
                     TempViewController *tempview = [[TempViewController alloc] initWithNibName:@"TempViewController" bundle:nil];
                     
                     
                     tempview.str_selectedCityName = city;
                     [self presentViewController:tempview animated:YES completion:^{
                         [MBProgressHUD hideHUDForView:self.view animated:YES];

                         [locationManager stopUpdatingLocation];
                         locationManager = nil;
                     }];
                     
                     
                     return;
                 }
                 
             }];
             
             
             NSLog(@"*-*-- location city we got is %@",city);
             
             
             
         }
     }];
    
    if (location.horizontalAccuracy > 0 && location.horizontalAccuracy < 100)
    {
        [locationManager stopUpdatingLocation];
    }
    else
    {
        [locationManager stopUpdatingLocation];
        
    }
    
}
#pragma mark -


@end
