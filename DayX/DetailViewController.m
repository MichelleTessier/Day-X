//
//  DetailViewController.m
//  DayX
//
//  Created by Michelle Tessier on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, readwrite) UIResponder *inputAccessoryViewController;
@property (nonatomic, strong) NSArray *greetings;

@end

@implementation DetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    UIToolbar *toolBar = [UIToolbar new];
    toolBar.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 40.0);
    toolBar.backgroundColor = [UIColor redColor];
    UIBarButtonItem *doneButton = [UIBarButtonItem new];
    doneButton.title = @"Thanks for listening!";
  
    [doneButton setTarget:self];
    [doneButton setAction:@selector(userTapped:)];
    
    NSArray *items = @[doneButton];
    
    [toolBar setItems:items];
    
    self.textView.inputAccessoryView = toolBar;
    
  NSInteger count = self.greetings.count;
    
    NSInteger randomIndex = arc4random_uniform(count);
    

    self.textField.placeholder = self.greetings[randomIndex];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)userTapped:(id)sender {
    [self.textView resignFirstResponder];
}

- (IBAction)clearTextView:(id)sender {
   self.textField.text = @"";

    self.textView.text = @"";
}

-(NSArray *)greetings{
    return @[@"What's a shakin?", @"Talk at me, yo...", @"What's up, buttercup?", @"I don't care today..."];
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (event.type == UIEventSubtypeMotionShake){
       self.textView.text = @"You seem frustrated...";
    }
}

- (BOOL) canBecomeFirstResponder{
    return YES;
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
