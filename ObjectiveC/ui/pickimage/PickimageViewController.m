//
//  PickimageViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/4/17.
//  Copyright © 2019 William. All rights reserved.
//

#import "PickimageViewController.h"

@interface PickimageViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *showImageV;
@property (weak, nonatomic) IBOutlet UISwitch *isEdit;
@property(nonatomic, strong)UIImagePickerController *imagePickerG;

@end

@implementation PickimageViewController

//检测前置摄像头是否可用
- (BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
//检测后置摄像头是否可用
- (BOOL)isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self isFrontCameraAvailable]) {
        NSLog(@"检测前置摄像头 可用");
    }else {
        NSLog(@"检测前置摄像头 不可用");
    }
    if ([self isRearCameraAvailable]) {
        NSLog(@"检测后置摄像头 可用");
    }else{
        NSLog(@"检测后置摄像头 不可用");
    }
}

- (IBAction)cameraAction:(UIButton *)sender {
    [self persentImagePicker];
}

- (IBAction)albumAction:(UIButton *)sender {
    [self persentImageAlbumPicker];
}

///调用相机
- (void)persentImagePicker{
    if (!_imagePickerG) {
        ///初始化
        _imagePickerG = [[UIImagePickerController alloc]init];
        ///代理
        _imagePickerG.delegate = self;
    }
    
    // 前面的摄像头是否可用
    if ([self isFrontCameraAvailable]) {
        _imagePickerG.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    // 后面的摄像头是否可用
    else if ([self isRearCameraAvailable]){
        _imagePickerG.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        NSLog(@"没有相机可用");
        return;
    }
    [_imagePickerG setAllowsEditing:self.isEdit.isOn]; // 允许拍照后裁剪
    [self presentViewController:_imagePickerG animated:YES completion:nil];
}

///调用本地相册
- (void)persentImageAlbumPicker{
    if (!_imagePickerG) {
        ///初始化
        _imagePickerG = [[UIImagePickerController alloc]init];
        ///代理
        _imagePickerG.delegate = self;
    }
    ///相册
    _imagePickerG.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [_imagePickerG setAllowsEditing:self.isEdit.isOn]; //是否允许编辑
    [self presentViewController:_imagePickerG animated:YES completion:nil];
}

///取消选择图片（拍照）
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

///选择图片完成（从相册或者拍照完成）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    if (self.isEdit.isOn) {
        UIImage *imageUp = [info objectForKey:UIImagePickerControllerEditedImage];//编辑后的图片
        self.showImageV.image = imageUp; //获取修剪后的图片
    }else{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];//原图
        self.showImageV.image = image; //获取原图
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
