//
//  NotificationService.m
//  ServiceExt
//
//  Created by Insider on 28.08.2019.
//  Copyright © 2019 Insider. All rights reserved.
//

#import "NotificationService.h"
#import <InsiderMobileAdvancedNotification/InsiderPushNotification.h>

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

// DO NOT FORGET TO CHANGE THIS TO YOUR APP GROUP
static NSString *APP_GROUP = @"group.com.company.your_app";

@implementation NotificationService
- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    // YOU CAN CUSTOMIZE THESE
    NSString *nextButtonText = @">>";
    NSString *goToAppText = @"Launch App";
    
    [InsiderPushNotification showInsiderRichPush:request appGroup:APP_GROUP nextButtonText:nextButtonText goToAppText:goToAppText  success:^(UNNotificationAttachment *attachment) {
        self->_bestAttemptContent.attachments = [self->_bestAttemptContent.attachments arrayByAddingObject:attachment];
        self.contentHandler(self.bestAttemptContent);
    }];
}
- (void)serviceExtensionTimeWillExpire {
    self.contentHandler(self.bestAttemptContent);
}
@end
