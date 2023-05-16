//
//  PersonViewController.m
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 16/05/2023.
//

#import <Foundation/Foundation.h>
#import "PersonViewController.h"
#import "NSObject+NSStringCategory.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printPersonDetails];
}

- (void)printPersonDetails {
    Person* person = [self getPerson];
    NSLog(@"%@", [self concatPersonDetails:person.name :person.age]);
}

- (Person*)getPerson {
    Person* person = [[Person alloc] init];
    person.name = @"John Doe";
    person.age = @25;
    return person;
}

@end
