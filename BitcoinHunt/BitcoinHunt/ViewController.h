//
//  ViewController.h
//  BitcoinHunt
//
//  Created by Tolga Beser on 4/3/16.
//  Copyright © 2016 Tolga Beser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudSight/CloudSight.h>

@interface ViewController : UIViewController<CloudSightQueryDelegate,UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic) NSString *same;

@end

