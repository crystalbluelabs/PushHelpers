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
	if ([UIApplication sharedApplication].enabledRemoteNotificationTypes == UIRemoteNotificationTypeNone) {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:false];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:true];
	}
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)getPushData:(CDVInvokedUrlCommand*)command {
    CDVPluginResult *pluginResult = nil;
    
    //id mainDelegate = (AppDelegate *)[[UIApplication sharedApplication].delegate];
    NSDictionary *pushedInfo = [MY_DELEGATE pushInfo];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:pushedInfo];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end