//
//  THSpaceDogNode.m
//  Space Cat
//
//  Created by Paul  on 2016-06-11.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THSpaceDogNode.h"
#import "THUtil.h"



@implementation THSpaceDogNode
+ (instancetype) spaceDogOfType: (THSpaceDogType)type {
    THSpaceDogNode *spaceDog;
    
    // ^THSpaceDogNode is a local variable and the right side of it is the name of that local variable to reference in the future.
    
    NSArray *textures;
    
    if ( type == THSpaceDogTypeA ) {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_A_1"];
        textures = @[[SKTexture textureWithImageNamed: @"spacedog_A_1"],
                     [SKTexture textureWithImageNamed: @"spacedog_A_2"]];
        spaceDog.type = THSpaceDogTypeA;
        
        
    } else if ( type == THSpaceDogTypeB) {
        spaceDog = [self spriteNodeWithImageNamed:@"spacedog_B_1"];
        textures = @[[SKTexture textureWithImageNamed: @"spacedog_B_1"],
                     [SKTexture textureWithImageNamed: @"spacedog_B_2"],
                     [SKTexture textureWithImageNamed: @"spacedog_B_3"]];
        spaceDog.type = THSpaceDogTypeB;
        
    }
    
    float scale = [THUtil randomWithMin:85 max:100] / 100.0f;
    spaceDog.xScale = scale;
    spaceDog.yScale = scale;
    
    // .0f at the end means that you can get a random float number by using it.
    
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    [spaceDog runAction: [SKAction repeatActionForever:animation] withKey:@"animation"];
    
    [spaceDog setupPhysicsBody];
    
    return spaceDog;
}

- (BOOL) isDamaged {
    
    NSArray *textures;
    
    if ( !_damaged ) {
        [self removeActionForKey:@"animation"];
        
        // self is referring to THSPACEDOGNODE
        
        if (self.type == THSpaceDogTypeA ) {
            textures = @[[SKTexture textureWithImageNamed:@"spacedog_A_3"]];
                         } else {
            textures = @[[SKTexture textureWithImageNamed:@"spacedog_B_4"]];
                         }
        
        SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
        [self runAction:[SKAction repeatActionForever:animation] withKey:@"animation"];
        
        _damaged = YES;
        
        return NO;
        
    } else {
        
        return _damaged;
    }
// basically what is going on here is that you are letting the code run from the beginning of isDamaged all the way to the end of that sub paragraph of code, and then would return YES after running the code, but it technically is not 'damaged' until it finishes running that code. After it is damaged, it runs the code in a different way as the dog would explode after it has a damaged rating, hence why the else function is in the syntax to return a YES if it already is damaged. 
}


// 'type' beside THSpaceDogType is the parameter.
// You have to input the instance type before into the header file, and then implement it after you've 'referenced' it into the m file. The reference is called the method signature.

- (void) setupPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.categoryBitMask = THCollisionCategoryEnemy;
    self.physicsBody.collisionBitMask = 0;
    // we are not colliding the enemy with anything; therefore the value is 0.
    self.physicsBody.contactTestBitMask = THCollisionCategoryProjectile | THCollisionCategoryGround;
    // 0010 | 1000 = 1010
    
    
}

@end
