//
//  THHudNode.h
//  Space Cat
//
//  Created by paulBookAir on 2016-06-15.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THHudNode : SKNode


// ^ convenience constructor

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

// the purpose of adding properties is to access and update the properties in the game play scene later on and therefore we want to expose them for that reason.

+ (instancetype) hudAtPosition:(CGPoint)position inFrame: (CGRect)frame;

// ^ convenience constructor

- (void) addPoints: (NSInteger)points;
- (BOOL) loseLife;



@end
