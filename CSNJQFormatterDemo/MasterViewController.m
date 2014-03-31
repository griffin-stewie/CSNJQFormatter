//
//  MasterViewController.m
//  CSNJQFormatterDemo
//
//  Created by griffin-stewie on 2014/03/31.
//  Copyright (c) 2014年 net.cyan-stivy. All rights reserved.
//

#import "MasterViewController.h"
#import "CSNJQFormatter.h"

@interface MasterViewController ( )
@property (nonatomic, strong) id JSON;
@end

@implementation MasterViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.navigationItem.title = NSLocalizedString(@"JQ Formatter", nil);
        self.JSON = @{@"foo": @"bar"};
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 50.0f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(__unused UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(__unused UITableView *)tableView numberOfRowsInSection:(__unused NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(__unused UITableView *)tableView titleForHeaderInSection:(__unused NSInteger)section
{
    return NSLocalizedString(@"jq Command", nil);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(__unused NSIndexPath *)indexPath
{
    NSString *command = [CSNJQFormatter jqCommandFromJSON:self.JSON];
    CGSize constrainedSize = CGSizeMake(280.f, tableView.frame.size.height);
    UIFont *constrintFont = [UIFont systemFontOfSize:14.f];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wconversion"
    CGSize size = [command sizeWithFont:constrintFont constrainedToSize:constrainedSize lineBreakMode:UILineBreakModeWordWrap];
#pragma clang diagnostic pop
    
    return fmax(size.height + 16.0f, self.tableView.rowHeight);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(__unused NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(__unused NSIndexPath *)indexPath
{
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [CSNJQFormatter jqCommandFromJSON:self.JSON];
}

@end
