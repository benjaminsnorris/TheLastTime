//
//  TimeViewController.m
//  TheLastTime
//
//  Created by Ben Norris on 9/23/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "TimeViewController.h"

#define margin 15
#define labelHeight 30
#define activityKey @"activity"
#define dateKey @"date"

@interface TimeViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *activityLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, assign) CGFloat top;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.top = 100;
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, self.top, self.view.bounds.size.width - (margin * 2), labelHeight)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Record Activity";
    [self.view addSubview:self.textField];
    
    self.top += labelHeight + margin;
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(margin, self.top, 200, labelHeight)];
    [self.button setTitle:@"Record Time" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    self.top += labelHeight + margin;
    
    [self.button addTarget:self action:@selector(storeTime) forControlEvents:UIControlEventTouchUpInside];
    
    self.activityLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.top, self.view.bounds.size.width - (margin * 2), labelHeight)];
    if([[NSUserDefaults standardUserDefaults] objectForKey:activityKey]) {
        self.activityLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:activityKey];
    }
    [self.view addSubview: self.activityLabel];
    
    self.top += labelHeight + margin;
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.top, self.view.bounds.size.width - (margin * 2), labelHeight)];
    if([[NSUserDefaults standardUserDefaults] objectForKey:dateKey]) {
        self.timeLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:dateKey];
    }
    [self.view addSubview:self.timeLabel];
    
}

- (void)storeTime {
    [self.activityLabel setText:self.textField.text];
    [[NSUserDefaults standardUserDefaults] setValue:self.textField.text forKey:activityKey];
    
    [self.timeLabel setText:[self formatDate:[NSDate date]]];
    [[NSUserDefaults standardUserDefaults] setValue:self.timeLabel.text forKey:dateKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)formatDate:(NSDate *) date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
