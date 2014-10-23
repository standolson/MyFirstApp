//
//  ToDoListTableViewController.h
//  MyFirstApp
//
//  Created by Stanley Dolson on 10/13/14.
//  Copyright (c) 2014 Stanley Dolson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface ToDoListTableViewController : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property (nonatomic, strong) NSArray *toDoItems;

@end
