//
//  PersonProtocol.h
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PersonProtocol <NSObject>

- (Person*)getPerson;

@end

NS_ASSUME_NONNULL_END
