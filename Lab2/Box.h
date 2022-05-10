//
//  Box.h
//  Lab2
//
//  Created by Kelbin David on 2022-05-10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

// public properties

@property (nonatomic, readwrite) CGFloat height;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat length;

// public methods

- (instancetype)initWithHeight: (CGFloat) height andWidth: (CGFloat) width andLength: (CGFloat) length;
- (CGFloat)volume;
- (void)insertThisBoxInside: (Box *) inside;

@end

NS_ASSUME_NONNULL_END
