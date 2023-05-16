//
//  NSObject+NSStringCategory.h
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NSStringCategory)

- (NSString*)concatPersonDetails:(NSString*)name :(NSNumber*)age;

@end

NS_ASSUME_NONNULL_END
