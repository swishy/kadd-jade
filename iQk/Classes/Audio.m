//
//  Audio.m
//  iQk
//
//  Created by sixteen on 9/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Audio.h"
#import "AudioToolbox/AudioServices.h"

@implementation Audio


+ (void)playSound:(NSString*)sound {
	
	NSDictionary *gridAudio = [NSDictionary dictionaryWithObjectsAndKeys:
					  @"/SnareDrum.wav", @"grid00", 
					  @"/BassDrum.wav", @"grid10", 
					  @"/CowBell.wav", @"grid20",
					  @"/DiscoHit.wav", @"grid01",
					  @"/HiHat.wav", @"grid11",
					  @"/HiHatClose.wav", @"grid12",
					  @"/ReversedCrash.wav", @"grid02",
					  @"/Tambourine.wav", @"grid21",
					  @"/JazzCymbal.wav", @"grid22", 
					  @"/DrumStick.wav", @"grid03", 
					  @"/CymbalSplash.wav", @"grid13", 
					  @"/ZildjianCymbals.wav", @"grid23", nil];
	NSString *track = [gridAudio valueForKey:sound];
	
	NSString *path = [NSString stringWithFormat:@"%@%@",
					  [[NSBundle mainBundle] resourcePath],
					  track];
	
	//declare a system sound id
	SystemSoundID iQkSound;
	
	//Get a URL for the sound file
	NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];
	
	//Use audio sevices to create the sound
	AudioServicesCreateSystemSoundID((CFURLRef)filePath, &iQkSound);
	
	//Use audio services to play the sound
	AudioServicesPlaySystemSound(iQkSound);
}

- (void)dealloc{
	[super dealloc];
}
@end
