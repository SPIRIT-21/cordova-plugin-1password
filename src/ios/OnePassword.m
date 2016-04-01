//
//  OnePassword.m
//  1password Cordova Plugin for iOS
//
//  Created by Raphael Fischer on 28.01.16.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import "OnePassword.h"
#import "OnePasswordExtension.h"

@implementation OnePassword : CDVPlugin

@synthesize passwordExtension = _passwordExtension;

-(void)pluginInitialize
{
        OnePasswordExtension *extension = [[OnePasswordExtension alloc] init];
        _passwordExtension = extension;
}

- (void)fillItemIntoWebView:(CDVInvokedUrlCommand *)command
{


    void (^completionHandler)(BOOL success, NSError *error);

    completionHandler = ^void(BOOL success, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if(success){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsString:@"success"];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No logins found!"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* url = [command.arguments objectAtIndex:0];

    if(url != nil){
        [_passwordExtension fillItemIntoWebView:self.webView forViewController:self.viewController url:url sender:nil showOnlyLogins:NO completion:completionHandler];
    }
    else{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}

- (void)findLoginForUrl:(CDVInvokedUrlCommand *)command
{


    void (^completionHandler)(NSDictionary *loginDictionary, NSError *error);

    completionHandler = ^void(NSDictionary *loginDictionary, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if([loginDictionary count] > 0){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsDictionary:loginDictionary];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No logins found!"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* url = [command.arguments objectAtIndex:0];

    if(url != nil){
        [_passwordExtension findLoginForURLString:url forViewController:self.viewController sender:nil completion:completionHandler];
    }
    else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}

-(void)storeLoginForURLString:(CDVInvokedUrlCommand *)command{



    NSDictionary *passwordGenerationOptions = @{
                                                // The minimum password length can be 4 or more.
                                                AppExtensionGeneratedPasswordMinLengthKey: @(8),

                                                // The maximum password length can be 50 or less.
                                                AppExtensionGeneratedPasswordMaxLengthKey: @(30),

                                                // If YES, the 1Password will guarantee that the generated password will contain at least one digit (number between 0 and 9). Passing NO will not exclude digits from the generated password.
                                                AppExtensionGeneratedPasswordRequireDigitsKey: @(YES),

                                                // If YES, the 1Password will guarantee that the generated password will contain at least one symbol (See the list bellow). Passing NO with will exclude symbols from the generated password.
                                                AppExtensionGeneratedPasswordRequireSymbolsKey: @(YES),

                                                // Here are all the symbols available in the the 1Password Password Generator:
                                                // !@#$%^&*()_-+=|[]{}'\";.,>?/~`
                                                // The string for AppExtensionGeneratedPasswordForbiddenCharactersKey should contain the symbols and characters that you wish 1Password to exclude from the generated password.
                                                AppExtensionGeneratedPasswordForbiddenCharactersKey: @"!@#$%/0lIO"


                                                };

    void (^completionHandler)(NSDictionary *loginDictionary, NSError *error);

    completionHandler = ^void(NSDictionary *loginDictionary, NSError *error) {

        CDVPluginResult* pluginResult = nil;
        if([loginDictionary count] > 0){
            pluginResult =  [CDVPluginResult  resultWithStatus:CDVCommandStatus_OK messageAsDictionary:loginDictionary];

        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to register login! "];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSString* username = [command.arguments objectAtIndex:0];
    NSString* password = [command.arguments objectAtIndex:1];
    NSString* url = [command.arguments objectAtIndex:2];
	NSString* title = [command.arguments objectAtIndex:3];
	NSString* sectionTitle = [command.arguments objectAtIndex:4];

    if(url != nil  && username != nil && password != nil){
        NSDictionary *newLoginDetails = @{
                                          AppExtensionTitleKey: title? : @"",
                                          AppExtensionUsernameKey: username? : @"",
                                          AppExtensionPasswordKey: password ? : @"",
                                          AppExtensionNotesKey: @"Saved with the SPIRIT/21 OnePassword Cordova Plugin",
                                          AppExtensionSectionTitleKey: sectionTitle? : @"",
                                                                                AppExtensionFieldsKey: @{
                                          //                                              @"firstname" : @"asdfsdf"? : @"",
                                          //                                              @"lastname" : @"sadfsdf" ? : @""
                                                                                        }
                                          };

        [[OnePasswordExtension sharedExtension] storeLoginForURLString:url loginDetails:newLoginDetails passwordGenerationOptions:passwordGenerationOptions forViewController:self.viewController sender:nil completion:completionHandler];
    }
    else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL is empty"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }





}

@end
