//
//  PushHelpers.m
//  PushHelpers Cordova Plugin
//
//  Created by Dj Karasek 
//
//

#import "PushHelpers.h"
#import "Cordova/CDV.h"

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