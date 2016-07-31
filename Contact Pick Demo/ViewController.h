//
//  ViewController.h
//  Contact Pick Demo
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelMobileNo;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;
- (IBAction)chooseContact:(id)sender;

@end

