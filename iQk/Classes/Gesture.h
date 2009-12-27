//
// Copyright 2009 All rights reserved.
// Anakin Hao akua28@hotmail.com 
// Keryn Thompson keryn_bubbles@hotmail.com 
// Diana Sawirs dsawirs@jadeworld.com 
// Dale Anderson dale@st8vrt.com
// 
// Under gpl2 licence 
// http://www.gnu.org/licenses/gpl-2.0.txt
//

#import <Foundation/Foundation.h>


@interface Gesture : NSObject <NSCoding>{
	NSString* grid;
}

@property(nonatomic,retain) NSString* grid;

- (id)init:(NSString*) theGird;

@end
