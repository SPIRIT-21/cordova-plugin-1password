//
//  OnePassword.h
//  1password Cordova Plugin for iOS
//
//  Created by Raphael Fischer on 28.01.16.
//
//

#import <Cordova/CDV.h>
#import "OnePasswordExtension.h"


@interface OnePassword : CDVPlugin

@property (nonatomic, strong)  OnePasswordExtension *passwordExtension;

-(void)pluginInitialize;

- (void)findLoginForUrl:(CDVInvokedUrlCommand*)command;
- (void)storeLoginForURLString:(CDVInvokedUrlCommand*)command;
- (void)fillItemIntoWebView:(CDVInvokedUrlCommand*)command;

@end
