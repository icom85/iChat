//
//  AppDelegate.m
//  iChat
//
//  Created by admin on 1/27/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"5BoPvtVWjsjj42H8pBaVaI4Ojz6gNXNNkfUo1ibt"
                  clientKey:@"guGLsc0wY6jIJSbbYEPxSdliqJqemp2YHCrNmbmT"];
    
    //[PubNub setDelegate:self];
    self.pubNub = [PubNub connectingClientWithConfiguration:[PNConfiguration defaultConfiguration]
                                                   delegate:self andSuccessBlock:^(NSString *origin) {
                                                       
                                                       NSLog(@"Connected to: %@", origin);
                                                   }
                                                 errorBlock:^(PNError *error) {
                                                     
                                                     if (error == nil) {
                                                         
                                                         // PubNub client may pass 'nil' here to inform that client can't connect at
                                                         // this moment because network check not completed (reachability sometime
                                                         // can be slow).
                                                         // So here we have a chance to update interface and provide user information
                                                         // that we will connect a bit later.
                                                     }
                                                     else {
                                                         
                                                         // Check error.code to find out real reason of error. Always use constants
                                                         // stored in PNErrorCodes.h for comparison.
                                                     }
                                                 }];
    
    // Asking to subscribe on channel with enabled presence observation
    [self.pubNub subscribeOn:@[[PNChannel channelWithName:@"a" shouldObservePresence:YES]]];
    
    // Sending "hi" message to all subscribers on "a" channel
    [self.pubNub sendMessage:@"hello from PubNub iOS!" toChannel:[PNChannel channelWithName:@"a"]];

    
    return YES;
}

- (void)pubnubClient:(PubNub *)client didSubscribeOn:(NSArray *)channelObjects {
    
    NSLog(@"PubNub client successfully subscribed on channels: %@", channelObjects);
}

// Called in case if client configured to restore connection and subscription after network
//failure. Mean that client is about to restore subscription on previously subscribed channels.
- (void)pubnubClient:(PubNub *)client willRestoreSubscriptionOn:(NSArray *)channelObjects {
    
    NSLog(@"PubNub client resuming subscription on: %@", channelObjects);
}

// Called at the end of subscription restore process to notify delegate that subscription has been
// restored on previously active channels.
- (void)pubnubClient:(PubNub *)client didRestoreSubscriptionOn:(NSArray *)channelObjects {
    
    NSLog(@"PubNub client successfully restored subscription on channels: %@", channelObjects);
}

// Sometimes subscription may fail and we need to handle this situation and check error.code for
// concrete failure reason.
- (void)pubnubClient:(PubNub *)client subscriptionDidFailWithError:(NSError *)error {
    
    NSLog(@"PubNub client failed to subscribe because of error: %@", error);
}

// Will be called each time when new message arrive to one of channels on which client has been
// subscribed earlier.
- (void)pubnubClient:(PubNub *)client didReceiveMessage:(PNMessage *)message {
    
    NSLog(@"PubNub client received message: %@", message);
}

// If subscribed on channel with enabled presence observation this delegate will be called each
// time when presence list will be modified or one of subscribers will change his state on channel.
- (void)pubnubClient:(PubNub *)client didReceivePresenceEvent:(PNPresenceEvent *)event {
    
    NSLog(@"PubNub client received presence event: %@", event);
}

// Called on delegate when scheduled message sending has been reached in queue and about to send to
// PubNub service.
- (void)pubnubClient:(PubNub *)client willSendMessage:(PNMessage *)message {
    
    NSLog(@"PubNub client is about to send message: %@", message);
}

// Called each time when message sending has been confirmed by service response (this message may
// appear on other subscribers side earlier then sending confirmation may arrive because PubNub too
// fast)
- (void)pubnubClient:(PubNub *)client didSendMessage:(PNMessage *)message {
    
    NSLog(@"PubNub client sent message: %@", message);
}

- (void)pubnubClient:(PubNub *)client didFailMessageSend:(PNMessage *)message
           withError:(PNError *)error {
    
    NSLog(@"PubNub client failed to send message '%@' because of error: %@", message, error);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
