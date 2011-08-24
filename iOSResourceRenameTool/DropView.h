//
//  DropView.h
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import <AppKit/AppKit.h>

@protocol DropViewDelegate;
@interface DropView : NSBox
{

}
@property (nonatomic, retain) NSString *properName;
@property (nonatomic, assign) id <DropViewDelegate> delegate;
           
@end

@protocol DropViewDelegate <NSObject>

- (void)dropView:(DropView*)dropView fileDropped:(NSString*)filePath;

@end

