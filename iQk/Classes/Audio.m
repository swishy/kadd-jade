//
//  Audio.m
//  iQk
//
//  Created by sixteen on 9/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
// http://creativecommons.org/licenses/sampling+/1.0/

#import "Audio.h"
#import "AudioToolbox/AudioServices.h"

@implementation Audio


+ (void)playSound:(NSString*)sound {
	
	NSDictionary *gridAudio = [NSDictionary dictionaryWithObjectsAndKeys:
					  @"/Pacman.wav", @"shake",
					  @"/SnareDrum.wav", @"grid00d", 
					  @"/BassDrum.wav", @"grid10d", 
					  @"/CowBell.wav", @"grid20d",
					  @"/DiscoHit.wav", @"grid01d",
					  @"/HiHat.wav", @"grid11d",
					  @"/HiHatClose.wav", @"grid12d",
					  @"/ReversedCrash.wav", @"grid02d",
					  @"/Tambourine.wav", @"grid21d",
					  @"/JazzCymbal.wav", @"grid22d", 
					  @"/DrumStick.wav", @"grid03d", 
					  @"/CymbalSplash.wav", @"grid13d", 
					  @"/ZildjianCymbals.wav", @"grid23d",
					  @"/AcidBass.wav", @"grid00r",
					  @"/BassAcid.wav", @"grid10r",
					  @"/BassGuitarSlap.wav", @"grid20r",
					  @"/BassInD.wav", @"grid01r",
					  @"/BassTremelo.wav", @"grid11r",
					  @"/DarkEdgyBass.wav", @"grid12r",
					  @"/HipHopBass.wav", @"grid02r",
					  @"/MarimbaBass.wav", @"grid21r",
					  @"/NuSchoolBass.wav", @"grid22r",
					  @"/NuSkoolBass.wav", @"grid03r",
					  @"/RedBass.wav", @"grid13r",
					  @"/ThickBass", @"grid23r",
					  @"/CountryGuitar.wav", @"grid00l", 
					  @"/GrandPianoD.wav", @"grid10l", 
					  @"/GrandPianoRock.wav", @"grid20l",
				      @"/OrganWalkingDog.wav", @"grid01l",
					  @"/PopGuitar.wav", @"grid11l",
					  @"/RhodesBallad.wav", @"grid12l",
				      @"/RockPianoG.wav", @"grid02l",
					  @"/SkaLoopGuitar.wav", @"grid21l",
					  @"/Takamine.wav", @"grid22l", 
					  @"/VibraphoneFunk.wav", @"grid03l", 
					  @"/AcousticGuitarMute.wav", @"grid13l", 
					  @"/PopRockGtrSound.wav", @"grid23l", nil ];
	
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
