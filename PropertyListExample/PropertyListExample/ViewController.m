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

    
    NSDictionary *blah = [self readPlist:@"Property List"];
    NSLog(@"dic = %@", blah);

    [self writePlist];
    [self readPlistUser];
    
}

- (NSDictionary*)readPlist:(NSString *)fileName {
    
    NSData *plistData;
    NSError *error;
    NSPropertyListFormat format;
    
    NSString *localizedPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    plistData = [NSData dataWithContentsOfFile:localizedPath];
    
    NSDictionary *plist = [NSPropertyListSerialization propertyListWithData:plistData
                                                      options:NSPropertyListImmutable
                                                       format:&format error:&error];
    if (!plist) {
        NSLog(@"Error reading plist from file");
    }
    
    return plist;
}

- (void)readPlistUser {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Prueba.plist"];
    
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile: path];
    
    NSLog(@"Data = %@", data);

}

- (void)writePlist{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Prueba.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path])
    {
        path = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: @"Prueba.plist"] ];
    }
    
    NSDictionary *texto = [[NSDictionary alloc] initWithObjectsAndKeys:@"key1", @"valor1", @"key2", @"valor2", nil];
    
    BOOL res = [texto writeToFile:path atomically:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
