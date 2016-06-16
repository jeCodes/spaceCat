//
//  THTitleScene.m
//  Space Cat
//
//  Created by Paul  on 2016-06-06.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THTitleScene.h"
#import "THGamePlayScene.h"
#import "AVFoundation/AVFoundation.h"

// class extension below

@interface THTitleScene ()
@property (nonatomic) SKAction *pressStartSFX;
@property (nonatomic) AVAudioPlayer *backgroundMusic;
@end

@implementation THTitleScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild: background];
        
        self.pressStartSFX = [SKAction playSoundFileNamed:@"PressStart.caf" waitForCompletion:NO];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"StartScreen" withExtension:@"mp3"];
        // return a URL^
        
        self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.backgroundMusic.numberOfLoops = -1;
        [self.backgroundMusic prepareToPlay];
        
    }
        return self;
}

-(void) didMoveToView:(SKView *)view {
    [self.backgroundMusic play];
}
// ^ ideal place to play the background music before the user has touched into the screen to actually play the game

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self runAction:self.pressStartSFX];
    [self.backgroundMusic stop];
    
    THGamePlayScene *gamePlayScene = [THGamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
    
    
    
    
}

    @end

