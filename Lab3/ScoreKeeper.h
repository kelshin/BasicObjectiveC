//
//  ScoreKeeper.h
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreKeeper : NSObject

@property (nonatomic, readwrite) NSUInteger right;
@property (nonatomic, readwrite) NSUInteger wrong;

- (void) addRight;
- (void) addWrong;
- (void) log;

@end

NS_ASSUME_NONNULL_END
