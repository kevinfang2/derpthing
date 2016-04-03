//
//  sameViewController.m
//  BitcoinHunt
//
//  Created by Kevin Fang on 4/3/16.
//  Copyright © 2016 Tolga Beser. All rights reserved.
//

#import "sameViewController.h"
#import <Coinbase.h>
#import <CoinbaseAccount.h>
#import <CoinbaseAddress.h>
#import <CoinbaseTransaction.h>
#import <CoinbaseUser.h>


@interface sameViewController ()

@end

@implementation sameViewController {
    
    __weak IBOutlet UITextField *textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)submitButtonpressed:(id)sender {
    NSString *typedInAddress = textField.text;
      Coinbase *apiClient = [Coinbase coinbaseWithApiKey:@"Hc0mYX0KDEaGusU0" secret:@"GCG1eza4ZhfTfEZ88Zkq4G2fUc9uSArZ"];
    CoinbaseAccount *account = [[CoinbaseAccount alloc] initWithID:@"536a541fa9393bb3c7000034" client:apiClient];
    [account transferAmount:@"0.001" to:typedInAddress completion:^(CoinbaseTransaction *transaction, NSError *error) {
        if (error) {
        } else {
        }
    }];
}

@end
