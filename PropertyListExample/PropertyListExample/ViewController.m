//
//  ViewController.m
//  PropertyListExample
//
//  Created by Virginia Armas on 7/9/13.
//  Copyright (c) 2013 Synergy-GB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    id blah = [self readPlist:@"Property List"];
    NSLog(@"dic = %@", blah);

    [self writePlist:blah fileName:@"Otro"];
}

- (id)readPlist:(NSString *)fileName {
    NSData *plistData;
    NSError *error;
    NSPropertyListFormat format;
    id plist;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    plistData = [NSData dataWithContentsOfFile:localizedPath];
    
    plist = [NSPropertyListSerialization propertyListWithData:plistData
                                                      options:NSPropertyListImmutable
                                                       format:&format error:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file");
    }
    
    return plist;
}

- (void)writePlist:(id)plist fileName:(NSString *)fileName {
    NSData *xmlData;
    NSError *error;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    
    xmlData = [NSPropertyListSerialization dataWithPropertyList:plist format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    if (xmlData) {
        [xmlData writeToFile:localizedPath atomically:NO];
    } else {
        NSLog(@"Error writing plist to file ");
    }  
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
