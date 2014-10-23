//
//  AddToDoitemViewController.m
//  MyFirstApp
//
//  Created by Stanley Dolson on 10/13/14.
//  Copyright (c) 2014 Stanley Dolson. All rights reserved.
//

#import "AddToDoItemViewController.h"
#import "AppDelegate.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *importanceSlider;
@property (weak, nonatomic) IBOutlet UITextField *commentsField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [_importanceSlider addTarget: self action: @selector(changeImportance:) forControlEvents: UIControlEventValueChanged];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if (sender != self.doneButton)
        return;

    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [delegate managedObjectContext];

    if (self.textField.text.length > 0) {
        self.toDoItem = [NSEntityDescription
                              insertNewObjectForEntityForName: @"ToDoItem"
                              inManagedObjectContext: context];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = [NSNumber numberWithBool: FALSE];
        self.toDoItem.creationDate = [NSDate date];
        self.toDoItem.importance = [NSNumber numberWithInt: self.importanceSlider.value];
        self.toDoItem.comments = self.commentsField.text;
    }

}

- (void)changeImportance: (UISlider *)slider
{
    UIColor *color = [ToDoItem getColorForImportance: slider.value];
    _importanceSlider.minimumTrackTintColor = color;
}

@end
