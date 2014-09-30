//
// PushHelpers.h
// PushHelper Cordova Plugin
//
// Created by DJ Karasek
//
//

#import <Cordova/CDV.h>

@interface PushHelpers : CDVPlugin

-(void)checkPush:(CDVInvokedUrlCommand*)command;
-(void)getPushData:(CDVInvokedUrlCommand*)command;

@end 