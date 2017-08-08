//
//  ViewController.m
//  TimerApp
//
//  Created by Prateek Sharma on 6/30/17.
//  Copyright © 2017 Bingo Tech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic) int hr,sec,min;
@property (nonatomic) BOOL timerStatus;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)timeFunc{
    //NSLog(@"sdsd");
    
    self.sec++;
    //NSLog(@"%d",self.sec);
    
    
    if(self.sec>59){
        self.min++;
    
        
        if(self.min>59){
         
            self.hr++;
            
            if(self.hr>23){
                self.hr=0;
            }
            
            
            self.min-=60;
        }
        
        self.sec-=60;
    }

    NSString *var;
    
    if(self.hr<10){
        var = [NSString stringWithFormat:@"0%d:",self.hr];
    }
    else var = [NSString stringWithFormat:@"%d:",self.hr];
    
    if(self.min<10){
        var = [NSString stringWithFormat:@"%@0%d:",var,self.min];
    }
    else var = [NSString stringWithFormat:@"%@%d:",var,self.min];
    
    if(self.sec<10){
        var = [NSString stringWithFormat:@"%@0%d",var,self.sec];
    }
    else var = [NSString stringWithFormat:@"%@%d",var,self.sec];
    
    self.timeLabel.text = var;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startAction:(UIButton *)sender {
    
    
    
    if(self.timerStatus == YES)
        return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFunc) userInfo:nil repeats:YES];
    
    self.timerStatus = YES;
    NSLog(@"Start");
    //sender.enabled = NO;
    
}

- (IBAction)stopAction:(UIButton *)sender {
    
    
    
    if(self.timerStatus == NO)
        return;
    
    
    [self.timer invalidate];
    
    self.timerStatus = NO;
    NSLog(@"Stop");

}

- (IBAction)resetAction:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Reset Confirmation" message:@"Are you sure you want to reset ?? " preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        NSLog(@"YES");
    
        if(self.timerStatus == YES)
        {
            [self.timer invalidate];
            self.timerStatus = NO;
        }
        
        self.timeLabel.text = @"00:00:00";
        NSLog(@"Reset");
        
        
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        
        
        NSLog(@"Cancel");
    
    }];
    
    
    [alert addAction:noAction];
    [alert addAction:yesAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

@end
