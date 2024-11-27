//
//  DrawableProtocol.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

// MARK: Drawable.h

@protocol Drawable <NSObject>

- (void)draw;

@end

// MARK: Circle.h

@interface Circle : NSObject <Drawable>

@property (nonatomic, assign) CGFloat radius;

- (instancetype)initWithRadius:(CGFloat)radius;

@end

// MARK: Drawable.m

@implementation Circle

- (instancetype)initWithRadius:(CGFloat)radius {
    self = [super init];
    if (self) {
        _radius = radius;
    }
    return self;
}

- (void)draw {
    NSLog(@"Draw circle with radius: %.2f", self.radius);
}

@end

// MARK: main

int drawMain(int argc, const char * argv[]) {
    @autoreleasepool {
        Circle *circle = [[Circle alloc] initWithRadius:3.0];
        
        [circle draw];
    }
    return 0;
}
