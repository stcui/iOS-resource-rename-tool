//
//  iOSResourceRenameToolAppDelegate.h
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface iOSResourceRenameToolAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *keepTopCheckBox;

@end
