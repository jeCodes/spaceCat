//
//  THSpaceDogNode.h
//  Space Cat
//
//  Created by Paul  on 2016-06-11.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSUInteger, THSpaceDogType) {
    THSpaceDogTypeA = 1,
    THSpaceDogTypeB = 2,
};

@interface THSpaceDogNode : SKSpriteNode

@property (nonatomic, getter=isDamaged) BOOL damaged;
@property (nonatomic) THSpaceDogType type;


+(instancetype) spaceDogOfType: (THSpaceDogType)type;

@end
