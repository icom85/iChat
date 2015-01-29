
//
//  ChatRoomViewController.m
//  iChat
//
//  Created by admin on 1/29/15.
//  Copyright (c) 2015 CC. All rights reserved.
//

#import "ChatRoomViewController.h"

@interface ChatRoomViewController ()

@end

@implementation ChatRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
   

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onSendButtonClick:(id)sender {
    // Define a channel
    //PNChannel *myChannel = [PNChannel channelWithName:@"channel-bob"];
    //PNChannel *friendChannel = [PNChannel channelWithName:@"channel-sally"];
    // Receive Messages Sent to Me!
    //[PubNub subscribeOnChannel:myChannel];
    // Send a Message to Sally
    //[PubNub sendMessage:@"Hello from PubNub iOS!" toChannel:friendChannel];
}
@end
