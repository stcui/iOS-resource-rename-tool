//
//  AppController.m
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import "AppController.h"

@implementation AppController

@synthesize iPadIconView;
@synthesize iPhoneIconView;
@synthesize retinaIconView;
@synthesize iPadPortraitView;
@synthesize iPadLandscapeView;
@synthesize iPhoneDefaultView;
@synthesize retinaDefaultView;
@synthesize msgField;

- (void)awakeFromNib {
    [super awakeFromNib];
    _fileManager = [[NSFileManager alloc] init];
    
    self.iPadIconView.properName = @"Icon-72";
    self.iPhoneIconView.properName = @"Icon";
    self.retinaIconView.properName = @"Icon@2x";
    self.iPadPortraitView.properName = @"Default-Portrait~ipad";
    self.iPadLandscapeView.properName = @"Default-Landscape~ipad";
    self.iPhoneDefaultView.properName = @"Default";
    self.retinaDefaultView.properName = @"Default@2x";
    
    self.iPadIconView.delegate = self;
    self.iPhoneIconView.delegate = self;
    self.retinaIconView.delegate = self;
    self.iPadPortraitView.delegate = self;
    self.iPadLandscapeView.delegate = self;
    self.iPhoneDefaultView.delegate = self;
    self.retinaDefaultView.delegate = self;
}

- (void)showTip:(NSString*)tip {
    [self.msgField setStringValue:tip];
}

- (void)dropView:(DropView*)dropView fileDropped:(NSString*)filePath {
    NSError *error = nil;
    BOOL isDir = YES;
    BOOL useCopy = NO;
    if ([_fileManager fileExistsAtPath:filePath isDirectory:&isDir]) {
        if (isDir) {
            [self showTip:@"不改文件夹，只改文件，拖文件夹木有用啊"];
            return;
        }

        NSAssert(nil != dropView.properName, @"nil file name");
        NSString *fileExt = [filePath pathExtension];
        NSString *newPath = [[filePath stringByDeletingLastPathComponent] stringByAppendingFormat:@"/%@.%@", dropView.properName, fileExt];
        NSLog(@"%@ -> %@", filePath, newPath);
        
        if (useCopy) {
            [_fileManager copyItemAtPath:filePath toPath:newPath error:&error];
        } else {
            [_fileManager moveItemAtPath:filePath toPath:newPath error:&error];
        }
        
        if (error) {
            [self showTip:[NSString stringWithFormat: @"嘿嘿，出错了: %@", error]];
        }
    }

}

@end
