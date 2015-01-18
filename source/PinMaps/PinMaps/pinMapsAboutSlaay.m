//
//  pinMapsAboutSlaay.m
//  PinMaps
//
//  Created by Presley on 18/01/15.
//  Copyright (c) 2015 SlaaySourceCoders. All rights reserved.
//

#import "pinMapsAboutSlaay.h"

@interface pinMapsAboutSlaay ()

@end

@implementation pinMapsAboutSlaay

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imgPresley.layer.cornerRadius = self.imgPresley.frame.size.width / 2;
    self.imgPresley.clipsToBounds = YES;
    self.imgPresley.layer.borderWidth = 3.0f;
    self.imgPresley.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.imgVidel.layer.cornerRadius = self.imgVidel.frame.size.width / 2;
    self.imgVidel.clipsToBounds = YES;
    self.imgVidel.layer.borderWidth = 3.0f;
    self.imgVidel.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.imgSanket.layer.cornerRadius = self.imgSanket.frame.size.width / 2;
    self.imgSanket.clipsToBounds = YES;
    self.imgSanket.layer.borderWidth = 3.0f;
    self.imgSanket.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    self.imgCasburn.layer.cornerRadius = self.imgCasburn.frame.size.width / 2;
    self.imgCasburn.clipsToBounds = YES;
    self.imgCasburn.layer.borderWidth = 3.0f;
    self.imgCasburn.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.imgAlison.layer.cornerRadius = self.imgAlison.frame.size.width / 2;
    self.imgAlison.clipsToBounds = YES;
    self.imgAlison.layer.borderWidth = 3.0f;
    self.imgAlison.layer.borderColor = [UIColor greenColor].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
