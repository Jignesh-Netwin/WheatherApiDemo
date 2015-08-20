//
//  WebServiceAPI.h
//  WheatherApiDemo
//
//  Created by Jignesh on 19/08/15.
//  Copyright (c) 2015 Jignesh. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^OnSuccessCompletionHandler)(id receivedString);
typedef void (^OnFailureCompletionHandler)(NSError *error);

@interface WebServiceAPI : NSObject

- (void)webService:(NSDictionary*)payload OnSuccess:(OnSuccessCompletionHandler)success OnFailure:(OnFailureCompletionHandler)failure;

-(NSMutableURLRequest * ) getData;

@end
