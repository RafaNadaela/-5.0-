//
//  TRxiugaiViewController.m
//  xiangmu
//
//  Created by tarena on 16/1/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRxiugaiViewController.h"

#import "SJUserinfo.h"
#import "SJXmpptool.h"

#import "UIImageView+yuanjiaoimageview.h"

@interface TRxiugaiViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headimage;

@property (weak, nonatomic) IBOutlet UITextField *usernametext;

@property (weak, nonatomic) IBOutlet UITextField *nikenametext;



@end

@implementation TRxiugaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (self.uservcardtemp.photo) {
        
        self.headimage.image = [UIImage imageWithData:self.uservcardtemp.photo];
        
    }else{
        
        self.headimage.image = [UIImage imageNamed:@""];
    }
    
    self.usernametext.text = self.uservcardtemp.mailer ;
    
    self.nikenametext.text = self.uservcardtemp.nickname ;

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    
    [self.headimage tupianyuanjiaoshezhi];
    
    //对于非按钮的形式，要想进行点击，可以用增加手势的方法
    
    self.headimage.userInteractionEnabled = YES ;
    
    //因为图片默认是不能与用户进行交互的，所以先要开启
    //图片与用户的交互。
    
    UITapGestureRecognizer* reginster = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tupianjiaohu)];
    
    [self.headimage addGestureRecognizer:reginster];
    
    
 }

-(void)goback{

    [self dismissViewControllerAnimated:YES completion:nil];


}



-(void)tupianjiaohu{


    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    //让弹出框 在这个view中显示
    
    [action showInView:self.view];
    
    


}
#pragma mark UIActionSheetDelegate

//判断action 与它对应的上面的 数据，这里用的是action的协议。在这个方法中
//来具体的写相机与相册的对应的方法

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        
    }else if(buttonIndex == 1){
       
        UIImagePickerController *pc =
        [[UIImagePickerController alloc]init];
        
        pc.allowsEditing = YES;
        
        pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        pc.delegate = self;
        
        //最后把相册 推出
        
        [self presentModalViewController:pc animated:YES];
        
    }else{
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIImagePickerController *pc = [[UIImagePickerController alloc]init];
            
            pc.allowsEditing = YES;
            
            pc.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            pc.delegate = self;
            
            [self presentModalViewController:pc animated:YES];
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.headimage.image = image ;
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)updateshuju:(id)sender {
    
//点击按钮，进行数据更新
//在这里 用户名是不能 被改变的，怎么
    
    self.uservcardtemp.nickname = self.nikenametext.text ;

//可以改变的是电子 邮件
    
    self.uservcardtemp.mailer = self.usernametext.text ;
    
    //self.headimage.image = [UIImage imageNamed:@"recogniz_cd@2x.png"];
    
    NSData* data = UIImagePNGRepresentation(self.headimage.image);
    
    self.uservcardtemp.photo = data ;
    
//在这里直接调用 圆角的 分类即可
    
    
    
 #warning 一定要注意这种电子卡片的形式
    
    //然后对电子卡片进行更新数据
    
    //不用反向传值，直接用电子卡片，进行更新即可，数据就会显示到第一个界面
    
    [[SJXmpptool sharedSJXmpptool].vcard updateMyvCardTemp:self.uservcardtemp];
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}




@end
