//
//  WindmillChannelVersionViewController.m
//  WindmillSample
//
//  Created by Codi on 2021/12/6.
//

#import "WindmillChannelVersionViewController.h"
#import <WindSDK/WindSDK.h>
#import <BUAdSDK/BUAdSDK.h>
#import <GDTMobSDK/GDTMobSDK.h>
#import <KSAdSDK/KSAdSDK.h>
#import <BaiduMobAdSDK/BaiduMobAdCommonConfig.h>


@interface WindmillChannelVersionViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation WindmillChannelVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"渠道版本号";
    [self initializeData];
    [self initializeForm];
}

- (void)initializeForm {
    XLFormDescriptor * form = [XLFormDescriptor formDescriptorWithTitle:@"RewardVideoAd"];;
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    //********************************************************************************
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    section.title = @"SDK Version";
    for (NSDictionary *dict in self.dataArray) {
        NSString *title = dict[@"title"];
        NSString *version = dict[@"version"];
        row = [XLFormRowDescriptor formRowDescriptorWithTag:@"info" rowType:XLFormRowDescriptorTypeInfo title:title];
        row.value = version;
        [section addFormRow:row];
    }

    self.form = form;
}

- (void)initializeData {
    
    _dataArray = @[
        @{@"title": @"Sigmob", @"version": [WindAds sdkVersion]},
        @{@"title": @"穿山甲", @"version": [BUAdSDKManager SDKVersion]},
        @{@"title": @"腾讯优量汇", @"version": [GDTSDKConfig sdkVersion]},
        @{@"title": @"快手", @"version": [KSAdSDKManager SDKVersion]}
    ];
}


- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue {
    
}

@end
