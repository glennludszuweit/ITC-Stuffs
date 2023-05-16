//
//  NSString+Category.m
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (NSString*)concatPersonDetails:(nonnull NSString*)name :(nonnull NSNumber*)age {
    return [NSString stringWithFormat:@"Name: %@ Age: %@", name, age];
}

@end
