

#import "WelcomeViewController.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic)UIButton *welBtn;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self showWelcomeScrollView];
    // Do any additional setup after loading the view.
}


-(void)showWelcomeScrollView{
    NSArray *welArray = @[@"welcome_1",@"welcome_2",@"welcome_3",@"welcome_4"];
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.contentSize=CGSizeMake(SCREEN_WIDTH*welArray.count,SCREEN_HEIGHT);
    _scrollView.backgroundColor=[UIColor whiteColor];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator= NO;
    _scrollView.showsVerticalScrollIndicator= NO;
    [self.view addSubview:_scrollView];
    
    
    for (int i = 0; i<welArray.count; i++) {
        NSString *imgName =welArray[i];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:IMAGE_NAME(imgName)];
        imgView.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [_scrollView addSubview:imgView];
    }
    
    _welBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //  [_welBtn setTitle:@"立即体验"forState:UIControlStateNormal];
    [_welBtn setBackgroundColor:[UIColor clearColor]];
    _welBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
    _welBtn.layer.cornerRadius = 8.0f;
    //  [_welBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_welBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_welBtn];
    _welBtn.hidden = YES;
    WS(weakSelf)
    [_welBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-30);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(160, 60));
    }];
    
    
}
-(void)btnClick:(UIButton *)button{
    [USER_DEFAULT setObject:@"welcome" forKey:@"welcome"];
    [USER_DEFAULT synchronize];
   
    
    
}

#pragma UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = (scrollView.contentOffset.x/SCREEN_WIDTH);
    self.welBtn.hidden = index<2?YES:NO;
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
