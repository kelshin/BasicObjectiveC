//
//  ContactNumber.h
//  Lab5
//
//  Created by Kelbin David on 2022-05-14.
//

#import <Foundation/Foundation.h>
#import "ContactNumberDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactNumber : NSObject

@property (nonatomic, readwrite) NSMutableDictionary *list;

- (void) addNumber: (ContactNumberDetails *) details;

@end

NS_ASSUME_NONNULL_END
