//
//  NSString+PigLatin.h
//  PigLatin
//
//  Created by Kelbin David on 2022-05-18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PigLatin)

- (NSString *) pigLatin;
- (NSString *)pluralize: (NSString *) userInput;

@end

NS_ASSUME_NONNULL_END
