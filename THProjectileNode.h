//
//  THProjectileNode.h
//  Space Cat
//
//  Created by Paul  on 2016-06-10.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THProjectileNode : SKSpriteNode

+ (instancetype) projectileAtPosition:(CGPoint)position;
- (void) moveTowardPosition: (CGPoint)position;

// gotta copy and paste the method of the move toward position method into the header file from the implementation file.
@end
