//
//  BEPMainViewController.m
//  BepBop
//
//  Created by Josh Brown on 9/9/13.
//  Copyright (c) 2013 Bleeding Edge Press. All rights reserved.
//

#import "BEPMainViewController.h"
#import "BEPDynamicTypeViewController.h"
#import "BEPLookAndFeelViewController.h"
#import "BEPMultipeerConnectivityViewController.h"
#import "BEPMapViewController.h"
#import "BEPTabbarTransitionsViewController.h"

#define kLookAndFeelRow 0
#define kDynamicTypeRow 1
#define kMultipeerRow 2
#define kTransitionsRow 5
#define kMapsRow 8



@interface BEPMainViewController ()

@property NSArray* chapterHeadings;
@property NSArray* chapterTitles;

@end

@implementation BEPMainViewController

- (id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.chapterHeadings =
            @[@"Chapter 1",
              @"Chapter 2",
              @"Chapter 3",
              @"Chapter 4",
              @"Chapter 5",
              @"Chapter 6",
              @"Chapter 7",
              @"Chapter 8",
              @"Chapter 9",
              @"Chapter 10",
              @"Chapter 11"];

        self.chapterTitles =
            @[@"iOS 6 App Look and Feel Migration",
              @"Designing accessible interfaces with Dynamic Type",
              @"Direct Wireless Connectivity with Multipeer Networking, AirDrop, and more",
              @"Keeping content up to date while running in the background",
              @"Adding effects to video",
              @"View transition animations",
              @"Animating with gravity and collisions",
              @"Dynamically updating your app snapshot in the App Switcher",
              @"Map directions in 3D",
              @"Taking advantage of the new build improvements",
              @"Unit Testing on Steroids"];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];


    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"Bleeding Edge Press";
}

#pragma mark - UITableViewController

- (NSInteger) numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return (IS_IOS_7 ? [self.chapterHeadings count] : 1);
}

- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* identifier = @"CellIdentifier";
    UITableViewCell* cell       = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }

    cell.textLabel.text       = [self.chapterHeadings objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.chapterTitles objectAtIndex:indexPath.row];

    return cell;
}

- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    UIViewController* viewController;

    if (indexPath.row == kLookAndFeelRow)
    {
        viewController = [[BEPLookAndFeelViewController alloc] init];
    }
    else if (indexPath.row == kDynamicTypeRow)
    {
        viewController = [[BEPDynamicTypeViewController alloc] init];
    }
    else if (indexPath.row == kMultipeerRow)
    {
        viewController = [[BEPMultipeerConnectivityViewController alloc] initWithNibName:nil bundle:nil];
    }
    else if (indexPath.row == kTransitionsRow)
    {
        viewController = [[BEPTabbarTransitionsViewController alloc] init];
    }
    else if (indexPath.row == kMapsRow)
    {
        viewController = [[BEPMapViewController alloc] initWithNibName:nil bundle:nil];
    }

    if (viewController)
    {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
