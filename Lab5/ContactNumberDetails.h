//
//  ContactNumberDetails.h
//  Lab5
//
//  Created by Kelbin David on 2022-05-14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactNumberDetails : NSObject

@property (nonatomic, readwrite) NSString *type;
@property (nonatomic, readwrite) NSString *number;

- (instancetype)initWithType: (NSString *) type andNumber: (NSString *) number;

@end

NS_ASSUME_NONNULL_END
