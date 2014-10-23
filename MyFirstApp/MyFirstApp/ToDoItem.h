//
//  ToDoItem.h
//  MyFirstApp
//
//  Created by Stanley Dolson on 10/15/14.
//  Copyright (c) 2014 Stanley Dolson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSNumber *completed;
@property (nonatomic, retain) NSDate *creationDate;
@property (nonatomic, retain) NSDate *completionDate;
@property (nonatomic, retain) NSString *itemName;
@property (nonatomic, retain) NSNumber *importance;
@property (nonatomic, retain) NSString *comments;

+ (UIColor *)getColorForImportance: (float)importance;

- (void)markAsCompleted;
- (NSDate *)getDate;
- (NSString *)getDisplayDate;
- (NSString *)getComments;
- (int)getImportance;
- (UIColor *)getColorForImportance;

@end
