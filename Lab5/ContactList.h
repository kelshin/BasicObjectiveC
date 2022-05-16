//
//  ContactList.h
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property (nonatomic, readonly) NSUUID* id;
@property (nonatomic, readwrite) NSMutableArray *list;

- (void) addContact: (Contact *) newContact;
- (void) show: (NSInteger) index;
- (void) find: (NSString *) searchName;
- (BOOL) duplicateChecker: (NSString *) email;

@end

NS_ASSUME_NONNULL_END
