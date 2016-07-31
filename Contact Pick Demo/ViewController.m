//
//  ViewController.m
//  Contact Pick Demo
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize labelName,labelEmail,labelMobileNo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseContact:(id)sender {
    
    ABPeoplePickerNavigationController *contactCon = [[ABPeoplePickerNavigationController alloc]init];
    contactCon.peoplePickerDelegate = self;
    [self presentViewController:contactCon animated:true completion:nil];
}

//delegate method
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    NSLog(@"%@",person);
 
   // CFTypeRef x = ABRecordCopyValue(<#ABRecordRef record#>, <#ABPropertyID property#>);
    
    CFTypeRef cfTypeFName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    //convert core foundation type into NSstring
    
    NSString *fname = (__bridge_transfer NSString *)cfTypeFName;
    NSString *lname = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    labelName.text = [NSString stringWithFormat:@"Name : %@ %@",fname,lname];
    
    //read multiple value phone no
    ABMultiValueRef phoneRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long count = ABMultiValueGetCount(phoneRef);
    for (int i=0; i<count; i++) {
        CFTypeRef cfTypePhone = ABMultiValueCopyValueAtIndex(phoneRef, i);
        NSString *phone = (__bridge_transfer NSString *)cfTypePhone;
        labelMobileNo.text = [NSString stringWithFormat:@"Mobile No. : %@",phone];
        NSLog(@"%d, %@",i,phone);
    }
    
    ABMultiValueRef emailRef = ABRecordCopyValue(person, kABPersonEmailProperty);
    count = ABMultiValueGetCount(phoneRef);
    for (int i=0; i<count; i++) {
        CFTypeRef cfTypeEmail = ABMultiValueCopyValueAtIndex(emailRef, i);
        NSString *email = (__bridge_transfer NSString *)cfTypeEmail;
        labelEmail.text = [NSString stringWithFormat:@"Email : %@",email];
        NSLog(@"%d, %@",i,email);
    }
    
       [peoplePicker dismissViewControllerAnimated:true completion:nil];
}
@end
