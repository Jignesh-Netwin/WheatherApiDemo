//
//  UIBAlertView.h
//  UIBAlertView
//
//  Created by Jignesh K
//  Copyright (c) 2013 Smart Manager (Netwin). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UIBAlertView;

typedef void (^UIBAlertDismissedHandler) (NSInteger selectedIndex, NSString *selectedTitle, BOOL didCancel);
typedef BOOL (^UIBAlertShouldEnableFirstOtherButtonHandler)();

@interface UIBAlertView : NSObject

@property (copy, nonatomic) UIBAlertShouldEnableFirstOtherButtonHandler shouldEnableFirstOtherButtonHandler;

// UIAlertView passthroughs
@property(nonatomic,assign) UIAlertViewStyle alertViewStyle NS_AVAILABLE_IOS(7_0);
- (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex NS_AVAILABLE_IOS(7_0);

// UIBAlertView functionality
- (id)initWithTitle:(NSString *)aTitle message:(NSString *)aMessage cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)otherTitles,...NS_REQUIRES_NIL_TERMINATION;
- (void)showWithDismissHandler:(UIBAlertDismissedHandler)handler;

@end
