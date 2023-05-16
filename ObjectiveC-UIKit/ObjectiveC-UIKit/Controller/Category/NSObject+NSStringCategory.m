//
//  NSObject+NSStringCategory.m
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import "NSObject+NSStringCategory.h"

@implementation NSObject (NSStringCategory)

- (NSString*)concatPersonDetails:(nonnull NSString*)name :(nonnull NSNumber*)age {
    return [NSString stringWithFormat:@"Name: %@ Age: %@", name, age];
}

@end
