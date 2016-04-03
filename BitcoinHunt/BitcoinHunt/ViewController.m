#import "ViewController.h"
#import <SIOSocket/SIOSocket.h>


@interface ViewController ()
@property SIOSocket *socket;
@property BOOL socketIsConnected;
@end

@implementation ViewController{
    NSString *objectTryingToBeFound;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [SIOSocket socketWithHost: @"http://127.0.0.1:4210" response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
         };
         
         [self.socket on:@"itemToHunt" callback: ^(SIOParameterArray *args)
          {
              objectTryingToBeFound = args[0];
              NSLog(@"%@", objectTryingToBeFound);
              //Display this on the screen
          }];
         
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sendWinToServer {
    
    [SIOSocket socketWithHost: @"http://45.55.138.146:3000" response: ^(SIOSocket *socket)
     {
         self.socket = socket;
         
         __weak typeof(self) weakSelf = self;
         self.socket.onConnect = ^()
         {
             weakSelf.socketIsConnected = YES;
             
             
         };
         [self.socket emit:@"itemFound"];
     }];
    
}
@end