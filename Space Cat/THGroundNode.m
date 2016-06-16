//
//  THGroundNode.m
//  Space Cat
//
//  Created by Paul  on 2016-06-11.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THGroundNode.h"
#import "THUtil.h"

@implementation THGroundNode

+(instancetype) groundWithSize: (CGSize)size {
    THGroundNode *ground = [self spriteNodeWithColor:[SKColor greenColor] size:size];
    ground.name = @"Ground";
    ground.position = CGPointMake(size.width/2, size.height/2);
    [ground setupPhysicsBody];
    ground.zPosition = -100;
    
    return ground;
}

// instance method is indicated by the minus sign below in the void instance statement
- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    self.physicsBody.categoryBitMask = THCollisionCategoryGround;
    self.physicsBody.collisionBitMask = THCollisionCategoryDebris;
    self.physicsBody.contactTestBitMask = THCollisionCategoryEnemy;
// dynamic is whether the ground in this case will be moved by other objects falling on it 
    

}

@end
