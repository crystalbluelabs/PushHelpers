//
//  PushHelpers.m
//  PushHelpers Cordova Plugin
//
//  Created by Dj Karasek 
//
//

#define MY_DELEGATE (AppDelegate*)[[UIApplication sharedApplication] delegate]

#import "PushHelpers.h"
#import "Cordova/CDV.h"
#import "AppDelegate.h"

@implementation PushHelpers

-(void)checkPush:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *pluginResult = nil;
    UIApplication *app = [UIApplication sharedApplication];
    BOOL enabled;
//	if ([app respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
//        enabled = [app isRegisteredForRemoteNotifications];
//		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:enabled];
//	} else {
        UIRemoteNotificationType types = [app enabledRemoteNotificationTypes];
        enabled = types & UIRemoteNotificationTypeAlert;
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:enabled];
//	}
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)getPushData:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult = nil;
    
    //id mainDelegate = (AppDelegate *)[[UIApplication sharedApplication].delegate];
    NSDictionary *pushedInfo = [MY_DELEGATE pushInfo];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:pushedInfo[@"alert"]];
    //pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"test"];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end