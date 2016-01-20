//
//  TagDetailControllerViewController.m
//  SwimFit_final_V2
//
//  Created by Eva Staniek on 20.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//


#import "TagDetailControllerViewController.h"
#import "AppDelegate.h"
#import "Trainingsmodul.h"

#import "FilterListViewController.h"

#define kCategoryRow 2

@interface TagDetailControllerViewController () <UINavigationControllerDelegate, UITextFieldDelegate, CategoryDelegate>

@end

@implementation TagDetailControllerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.descriptionTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.isMovingFromParentViewController) {
        [self persistLocation];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.location) {
        self.titleTextField.text = self.location.name;
        self.descriptionTextField.text = self.location.details;
    }
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == kCategoryRow) {
        FilterListViewController* flvc = [[FilterListViewController alloc] initWithSelectedCategories:self.trainingsmodul.categories deleagte:self];
        [self.navigationController pushViewController:flvc animated:YES];
    }
}

- (void)selectedCategories:(NSArray *)array
{
    [self.trainingsmodul.categories setArray:array];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:kCategoryRow inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == kCategoryRow) {
        cell.detailTextLabel.text = [self.trainingsmodul.categories componentsJoinedByString:@", "];
    }
}




#pragma mark - Text
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField == self.descriptionTextField) {
        self.location.details = textField.text;
    }
}
@end
