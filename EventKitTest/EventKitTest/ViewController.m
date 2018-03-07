//
//  ViewController.m
//  EventKitTest
//
//  Created by jinghua on 17/4/19.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ViewController.h"
#import <EventKit/EventKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


}

- (void)addEventCalendarWithDate:(NSDate *)startDate endDate:(NSDate *)endDate title:(NSString *)title {
    EKEventStore *evenStore = [EKEventStore new];
    [evenStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            EKEvent *event = [EKEvent eventWithEventStore:evenStore];
            event.title = title;
            event.startDate = startDate;
            event.endDate = endDate;
            [event addAlarm:[EKAlarm alarmWithAbsoluteDate:endDate]];
            [event setCalendar:[evenStore defaultCalendarForNewEvents]];
            
            NSError *err;
            [evenStore saveEvent:event span:EKSpanThisEvent error:&err];
        }
    }];
}

- (void)addEventReminderWithDate:(NSDate *)date title:(NSString *)title {
    EKEventStore *eventStore = [EKEventStore new];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            EKReminder *reminders = [EKReminder reminderWithEventStore:eventStore];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            [calendar setTimeZone:[NSTimeZone systemTimeZone]];
            NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth |
                              NSCalendarUnitDay | NSCalendarUnitHour |
                                NSCalendarUnitMinute | NSCalendarUnitSecond;
            NSDateComponents *dateComp = [calendar components:flags fromDate:date];
            dateComp.timeZone = [NSTimeZone systemTimeZone];
            reminders.startDateComponents = dateComp;
            reminders.dueDateComponents = dateComp;
            reminders.priority = 1;
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];
            [reminders addAlarm:alarm];
            NSError *err;
            [eventStore saveReminder:reminders commit:YES error:&err];
        }
    }];
}


@end
