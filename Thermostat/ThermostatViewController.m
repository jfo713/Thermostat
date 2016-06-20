//
//  ViewController.m
//  Thermostat
//
//  Created by James O'Connor on 6/16/16.
//  Copyright © 2016 James O'Connor. All rights reserved.
//

#import "ThermostatViewController.h"

@interface ThermostatViewController ()

        
    @property (nonatomic, weak)     IBOutlet UILabel *temperature;
    @property (nonatomic, weak)     IBOutlet UISegmentedControl *unitToggle;
    @property (nonatomic, weak)    IBOutlet UISlider *dial;


@end

@implementation ThermostatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dial.minimumValue=0;
    self.dial.maximumValue=200;

    
}



-(IBAction) sliderValueChanged:(id) dial {
    
    int Value = (int) self.dial.value;
    NSLog(@"%d", Value);
    self.temperature.text = [NSString stringWithFormat:@"%d", Value];
    
}

-(void) setValue:(float) dial {
   
}


-(IBAction) UIControlEventValueChanged:(UISegmentedControl *) segmentedControl {
    switch (self.unitToggle.selectedSegmentIndex) {
        case 0:
            [self.dial setValue:((self.dial.value-32)*5)/9];
            self.temperature.text = [NSString stringWithFormat:@"%f", self.dial.value];
        break;
        case 1:
            self.temperature.text = [NSString stringWithFormat:@"%f", ((self.dial.value*9)/5)+32];
            [self.dial setValue:((self.dial.value*9)/5)+32];
        break;
        default:
        break;
    }
    NSLog(@"ValueChanged");
    // segmentedControl.selectedSegmentIndex // 0
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
