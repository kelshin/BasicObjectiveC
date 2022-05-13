//
//  Question.h
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

@property (nonatomic, readwrite) NSString *question;
@property (nonatomic, readwrite) NSInteger answer;
@property (nonatomic, readwrite) NSDate *startTime;
@property (nonatomic, readwrite) NSDate *endTime;
@property (nonatomic, readwrite) NSInteger leftValue;
@property (nonatomic, readwrite) NSInteger rightValue;

- (NSInteger)answer;
- (NSTimeInterval)answerTime;
- (void) generateQuestion;

@end

NS_ASSUME_NONNULL_END
