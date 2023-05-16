//
//  PersonViewController.h
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import <UIKit/UIKit.h>
#import "PersonProtocol.h"

@interface PersonViewController : UIViewController <PersonProtocol>

- (void)printPersonDetails;

@end
