//
//  ViewController.m
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import "ViewController.h"
#import "JKQuestionCell.h"
#import "JKQuestionModel.h"

#import "JKStackAPI.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *questionList;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.questionList = [[NSMutableArray alloc] init];
    
    
    UINib *cellNib = [UINib nibWithNibName:@"JKQuestionCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Identifier"];
    
    // Add Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];

    
    
    [self fetchDataFromApi];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self fetchDataFromApi];
    
}



- (void)fetchDataFromApi {
    [[JKStackAPI sharedInstance] fetchHotQuestionsWithCompletionBlock:^(NSArray *questions, NSError *error) {
        [self.questionList addObjectsFromArray:questions];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource and Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.questionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Identifier";
    JKQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    JKQuestionModel *question = self.questionList[indexPath.row];
    cell.questionLabel.text = question.title;
    
    [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:question.profileImageUrl]
                      placeholderImage:nil];

    return cell;
}

@end
