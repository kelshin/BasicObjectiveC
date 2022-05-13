//
//  QuestionFactory.h
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject

@property (nonatomic,readonly) NSArray *questionSubclassNames;

- (NSString *) generateRandomQuestion;

@end

NS_ASSUME_NONNULL_END
