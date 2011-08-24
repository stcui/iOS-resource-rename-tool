//
//  AppController.h
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropView.h"

@interface AppController : NSObject <DropViewDelegate>
{
    NSFileManager *_fileManager;
}
@property (assign) IBOutlet DropView *iPadIconView;
@property (assign) IBOutlet DropView *iPhoneIconView;
@property (assign) IBOutlet DropView *retinaIconView;

@property (assign) IBOutlet DropView *iPadPortraitView;
@property (assign) IBOutlet DropView *iPadLandscapeView;
@property (assign) IBOutlet DropView *iPhoneDefaultView;
@property (assign) IBOutlet DropView *retinaDefaultView;

@property (assign) IBOutlet NSTextField *msgField;

@end
