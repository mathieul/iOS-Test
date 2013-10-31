//
//  IAViewController.m
//  Tasks
//
//  Created by Mathieu Lajugie on 10/30/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tasks = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.tasks[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"taskSegue" sender:self.tasks[indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destination = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"taskSegue"]) {
        [destination setValue:sender forKey:@"task"];
    }
    else {
        destination = [segue.destinationViewController topViewController];
    }
    
    [destination setValue:self forKey:@"delegate"];
}


@end
