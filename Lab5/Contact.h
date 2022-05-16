//
//  Contact.h
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import <Foundation/Foundation.h>
#import "ContactNumber.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSString *email;
@property (nonatomic, readwrite) ContactNumber *numbers;

- (instancetype)initWithName: (NSString *) name andEmail: (NSString *) email;

@end

NS_ASSUME_NONNULL_END
