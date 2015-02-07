//
//  EscapePodsViewController.m
//  Weird Retro
//
//  Created by User i7 on 03/02/15.
//  Copyright (c) 2015 Alex Dougas. All rights reserved.
//

#import "CaptainsBlogViewController.h"
#import "BlogPostViewController.h"

#import "Managers.h"
#import "EscapePodsTableViewCell.h"
#import "BlogPostTableViewCell.h"

#import <DTCoreText/DTCoreText.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "BlogPost.h"


@interface CaptainsBlogViewController ()
@property (nonatomic, strong) NSArray *blogPosts;
@end


@implementation CaptainsBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ( self.blogPosts.count == 0 )
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [DATAMANAGER loadBlogPostsFromBackendWithCompletion:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self reloadData];
    }];
}

- (void) reloadData
{
    self.blogPosts = [DATAMANAGER objects:@"BlogPost" predicate:nil sortKey:@"dateBlogPost" ascending:NO];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlogPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogPostTableViewCell" forIndexPath:indexPath];
    
    if ( !cell )
    {
        cell = [[BlogPostTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BlogPostTableViewCell"];
    }
    
    BlogPost* blogPost = self.blogPosts[indexPath.row];

    cell.imgThumbnail.image = nil;
    [cell.imgThumbnail setImageWithURL:[NSURL URLWithString:[NETWORK.baseURL stringByAppendingPathComponent:blogPost.thumbnailUrl]]];
    cell.lblDescription.text = blogPost.title;

    
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"ShowBlogPost"])
    {
        UITableViewCell* cell = (UITableViewCell*)sender;
        NSIndexPath* path = [self.tableView indexPathForCell:cell];
        
        BlogPostViewController* controller = segue.destinationViewController;
        controller.postURL = [(BlogPost*)self.blogPosts[path.row] url];
    }
}


@end