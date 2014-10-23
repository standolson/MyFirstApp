//
//  ToDoItem.m
//  MyFirstApp
//
//  Created by Stanley Dolson on 10/15/14.
//  Copyright (c) 2014 Stanley Dolson. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

@dynamic completed;
@dynamic importance;
@dynamic creationDate;
@dynamic completionDate;
@dynamic itemName;
@dynamic comments;

+ (UIColor *)getColorForImportance: (float)importance
{
    return [UIColor colorWithRed: 1.0 green: (1 - (importance / 10.0)) blue: 0 alpha: 1];
}

- (void)markAsCompleted
{
    if ([self.completed boolValue])
        return;
    self.completed = [NSNumber numberWithBool: TRUE];
    self.completionDate = [NSDate date];
}

- (NSDate *)getDate
{
    return [self.completed boolValue] ? self.completionDate : self.creationDate;
}

- (NSString *)getDisplayDate
{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"EEE, MMM dd, yyyy HH:mm zzz"];
    NSString *date = [formatter stringFromDate: [self getDate]];

   if ([self.completed boolValue])
       return [NSString stringWithFormat: @"Completed %@", date];
   else
       return [NSString stringWithFormat: @"Created %@", date];

}

- (NSString *)getComments
{
    return self.comments;
}

- (int)getImportance
{
    return [self.importance intValue];
}

- (UIColor *)getColorForImportance
{
    return [ToDoItem getColorForImportance: [self.importance floatValue]];
}

@end
