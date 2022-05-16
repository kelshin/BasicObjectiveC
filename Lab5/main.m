//
//  main.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "ContactList.h"
#import "Contact.h"
#import "ContactNumberDetails.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    ContactList *list = [[ContactList alloc] init];
    
    // DUMMY
    Contact *dummy1 = [[Contact alloc] initWithName:@"jane" andEmail:@"jane@g.com"];
    ContactNumberDetails *dummyNumber = [[ContactNumberDetails alloc] initWithType:@"mobile" andNumber:@"123-123-1234"];
    ContactNumberDetails *dummyNumber1 = [[ContactNumberDetails alloc] initWithType:@"home" andNumber:@"123-123-1234"];
    ContactNumber *dummyNumberList = [[ContactNumber alloc] init];
    [dummyNumberList addNumber:dummyNumber];
    [dummyNumberList addNumber:dummyNumber1];
    [dummy1 setNumbers:dummyNumberList];
    [list addContact:dummy1];
    Contact *dummy2 = [[Contact alloc] initWithName:@"john" andEmail:@"john@g.com"];
    [list addContact:dummy2];
    Contact *dummy3 = [[Contact alloc] initWithName:@"kelbin" andEmail:@"kelbin@g.com"];
    [list addContact:dummy3];
    // END of dummy
    
    
    InputCollector *input = [[InputCollector alloc]init];
    BOOL contactlist = YES;
    while (contactlist) {
      NSString *userinput = [input inputForPrompt:@"menu"];
      NSArray *splitedInput = [userinput componentsSeparatedByString:@" "];
      if ([splitedInput count] == 2) {
        if ([[splitedInput objectAtIndex:0]  isEqualToString: @"show"] && [input isNumeric:[splitedInput objectAtIndex:1]]){
          [list show:[[splitedInput objectAtIndex:1] integerValue]];
        } else if ([[splitedInput objectAtIndex:0]  isEqualToString: @"find"]){
            [list find:[splitedInput objectAtIndex:1]];
        } else {
          NSLog(@"Invalid Input");
        }
      } else {
        if ([userinput isEqualToString:@"quit"]){
          contactlist = NO;
          NSLog(@"Goodbye");
        } else if ([userinput isEqualToString:@"new"]){
          NSString *email = [NSString alloc];
          while (true) {
            NSLog(@"Enter email:");
            email = [input inputForPrompt:@"email"];
            if ([list duplicateChecker:email] == 0){
              break;
            }
          }
          NSLog(@"Enter name:");
          NSString *name = [input inputForPrompt:@"user"];
          Contact *newContact = [[Contact alloc] initWithName:name andEmail:email];
          NSLog(@"Would you like to add a number? (y/n)");
          NSString *addMobile = [input inputForPrompt:@"addMobile"];
          if ([addMobile isEqualToString:@"y"]){
            ContactNumber *listOfNumbers = [[ContactNumber alloc] init];
            while (true) {
              ContactNumberDetails *newNumber = [[ContactNumberDetails alloc] initWithType:[input inputForNumberTitle] andNumber:[input inputForNumber]];
              [listOfNumbers addNumber: newNumber];
              NSLog(@"Would you like to add more? (y/n)");
              NSString *addMore = [input inputForPrompt:@"addMobile"];
              if ([addMore isEqualToString:@"n"]){
                break;
              }
            }
            [newContact setNumbers:listOfNumbers];
          }
          [list addContact:newContact];
        } else if ([userinput isEqualToString:@"list"]){
          [list list];
        } else if ([userinput isEqualToString:@"history"]){
          [input showHistory];
        }
      }
    }
  }
  return 0;
}


