//
//  QuestionManager.h
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionManager : NSObject

@property (nonatomic, readwrite) NSMutableArray *questions;
@property (nonatomic, readwrite) NSInteger timeSum;

- (void) addNewQuestion:(Question *) newQuestion;
- (NSString *) timeOutput;

@end

NS_ASSUME_NONNULL_END
