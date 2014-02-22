//
//  MainViewController.m
//  MUIOS108
//
//  Created by Max Krylov on 2/21/14.
//  Copyright (c) 2014 Max Krylov. All rights reserved.
//

#import "MainViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *currentIndexLabel;




@end

@implementation MainViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionPlusOne:(id)sender {
    NSString *currentLabel = self.currentIndexLabel.text;
    

    if(currentLabel.length > 0){
        
        //не разобрался, насколько это адекватный метод — кастить строку символов в инт (при кастинге новой переменной присваивается 0, символы отбрасываются).
        NSInteger current = [currentLabel integerValue];
        current += 1;
        
        //при запуске в симуляторе current не приходилось дополнительно приводить к (int). при попытке запуске на девайсе на меня ругнулись и сказали, что нужно дополнительно кастить во (float), после чего снова ругнулись и сказали кастить в (int) =) как понимать такую реакцию компялтора?
        self.currentIndexLabel.text = [NSString stringWithFormat:@"%d", (int)current];
        self.currentIndexLabel.font = [UIFont systemFontOfSize:42];
        
        
        //play baaaaa sound. стырено со stackoverflow
        
        SystemSoundID soundID;
        
        NSString *filename = [NSString stringWithFormat:@"baaa%d", arc4random() % 6];
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:filename ofType:@"wav"];
        NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
        
        AudioServicesCreateSystemSoundID ((CFURLRef)CFBridgingRetain(soundUrl), &soundID);
        AudioServicesPlaySystemSound(soundID);
        
    }
}


@end
