//
//  KVO.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@end

@implementation Person

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey, id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"Property 'name' changed:");
        NSLog(@"Old value: %@", change[NSKeyValueChangeOldKey]);
        NSLog(@"New value: %@", change[NSKeyValueChangeNewKey]);
    }
}

@end

// MARK: main

int mainKVO(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        
        [person addObserver:person
                 forKeyPath:@"name"
                    options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                    context:nil];
        
        person.name = @"Аlex";
        person.name = @"Bob";
        
        [person removeObserver:person forKeyPath:@"name"];
    }
    return 0;
}
