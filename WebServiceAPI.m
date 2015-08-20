//
//  WebServiceAPI.m
//  WheatherApiDemo
//
//  Created by Jignesh on 19/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import "WebServiceAPI.h"

@implementation WebServiceAPI


NSString * const YOUR_STRING = @"http://api.openweathermap.org/data/2.5/forecast/daily?";

- (void)webService:(NSDictionary*)payload OnSuccess:(OnSuccessCompletionHandler)success OnFailure:(OnFailureCompletionHandler)failure
{
    [NSURLConnection sendAsynchronousRequest:[self getData:[payload  valueForKey:@"City"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (connectionError)
        {
            failure(connectionError);
            return;
        }
        
        NSDictionary *dictionry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        
        success(dictionry);
        
    }];
    
}

-(NSMutableURLRequest * ) getData:(NSString *) strName
{

    NSMutableURLRequest *request;
    @autoreleasepool
    {
        request= [[NSMutableURLRequest alloc]init];
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@q=%@&mode=json&units=metric&cnt=14",YOUR_STRING,strName]]];
        NSLog(@"URL is %@",request);
        [request setHTTPMethod:@"GET"];
    }
    return request;
}


@end
