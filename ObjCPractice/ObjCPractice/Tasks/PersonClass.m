//
//  PersonClass.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

// MARK: PersonClass.h

@interface PersonClass : NSObject

@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)greet;

@end

// MARK: PersonClass.m

@implementation PersonClass

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (void)greet {
    NSLog(@"Hello, %@!", self.name);
}

@end

// MARK: main

int personMain(int argc, const char * argv[]) {
    @autoreleasepool {
        PersonClass *person = [[PersonClass alloc] initWithName:@"Alex"];
        [person greet];
    }
    return 0;
}
