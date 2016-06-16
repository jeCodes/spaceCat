//
//  THProjectileNode.m
//  Space Cat
//
//  Created by Paul  on 2016-06-10.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THProjectileNode.h"
#import "THUtil.h"

@implementation THProjectileNode

+ (instancetype) projectileAtPosition:(CGPoint)position {
    THProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.name = @"Projectile";
    
    [projectile setupAnimation];
    // in a class method, you can't use 'self' to call up setupAnimation, you have to call it on the object that youa re actually referring to, which in this case
    
    [projectile setupPhysicsBody];
    return projectile;
}

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = THCollisionCategoryProjectile;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = THCollisionCategoryEnemy;
}

- (void) setupAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                        [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]];
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
}

- (void) moveTowardPosition: (CGPoint)position {
    // slope = (Y3 - Y1) / (X3 - X1)
    float slope = (position.y -self.position.y) / (position.x - self.position.x);
    
    // slope = (Y2 - Y1) / (X2 - X1)
    // Y2 - Y1 = slope ( X2 - X1)
    // Y2 = slope * X2 - slope * X1 + Y1
    
    float offscreenX;
    
    if ( position.x <= self.position.x ) {
        offscreenX = -10;
    } else {
        offscreenX = self.parent.frame.size.width;
        // parent is the scene in this case.
    }

    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;

    CGPoint pointOffScreen = CGPointMake(offscreenX, offscreenY);
    
    float distanceA = pointOffScreen.y - self.position.y;
    float distanceB = pointOffScreen.x - self.position.x;
    
    float distanceC = sqrtf(powf(distanceA, 2) + powf(distanceB, 2));
    
    // distance = speed * time
    // time = distance / speed
    
    float time = distanceC / THProjectileSpeed;
    float waitToFade = time * 0.75;
    float fadeTime = time - waitToFade;
    
    
    SKAction *moveProjectile = [SKAction moveTo:pointOffScreen duration:time];
    [self runAction: moveProjectile];
    
    NSArray *sequence = @[[SKAction waitForDuration:waitToFade],
                          [SKAction fadeOutWithDuration:fadeTime],
                          [SKAction removeFromParent]];
    
    [self runAction:[SKAction sequence:sequence]];
    
    
}




@end
