//
//  DetailViewController.m
//  DayX
//
//  Created by Michelle Tessier on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"
#import "Entry.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

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
    
    //random integer to get random greeting
    
    NSInteger count = self.greetings.count;
    
    NSInteger randomIndex = arc4random_uniform(count);
    
    self.textField.placeholder = self.greetings[randomIndex];
    
    
    [self updateWithEntry:self.entry];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark-save button and update entry

- (IBAction)saveButtonTapped {
    //for if an entry already exists
    
    if (self.entry){
        
        self.entry.title = self.textField.text;
        self.entry.bodyText = self.textView.text;
        NSDate *now = [NSDate date];
        self.entry.timeStamp = now;
        
    
      
        
    }else{
        
        //for if a new entry needs to be created
        Entry *entry = [Entry new];
        
        entry.title = self.textField.text;
        entry.bodyText = self.textView.text;
        NSDate *now = [NSDate date];
        entry.timeStamp = now;
   
    EntryController *entryController = [EntryController sharedInstance];
    [entryController addEntry:entry];
        
       
        
    }
    
     [[EntryController sharedInstance] save];
    
    //save pops back to table view
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)updateWithEntry:(Entry *)entry{
    self.textField.text = entry.title;
    self.textView.text = entry.bodyText;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    NSDate *entryDate = entry.timeStamp;
    NSString *prettyDate = [dateFormatter stringFromDate:entryDate];
    self.dateLabel.text = prettyDate;
   
}

#pragma mark- clear text view with button feature


- (IBAction)clearTextView:(id)sender {
   self.textField.text = @"";

    self.textView.text = @"";
}


#pragma mark-resign first responder

//resign first responder in textview (body text) with tap on screen (so return can be used to add
    //space to journal entry

- (IBAction)userTapped:(id)sender {
    [self.textView resignFirstResponder];
}

//resign first responder in textfield (title) with return button

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark- funky feature methods (delete text when shaken and random greetings)

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
