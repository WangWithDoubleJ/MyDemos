//
//  PAAddressPicker.m
//  SZYiZhangTong
//
//  Created by 平安科技 on 2017/9/9.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import "PAAddressPicker.h"
#import "UIPickerView+malPicker.h"

@interface PAAddressPicker()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong) UIPickerView *picker;                 ///<选择器
@property (nonatomic, strong) UILabel *addressLab;///<显示当前选择城市名称
@property (nonatomic, strong) UIButton *cancelBtn;///<取消按钮
@property (nonatomic, strong) UIButton *confirmBtn;///<选择按钮
@property (nonatomic, strong) NSArray <NSString *>*datas;///<数据
@property (nonatomic, strong) NSString *titleString;///<标题
@property (nonatomic, strong) id selectedContent;///<当前选择选中的内容
@property (nonatomic, assign) NSInteger selectedIndex;///<选中的数据索引
@property (nonatomic, strong) UIView *pickerBkV;///<picker背景view
@end


static PAAddressPicker *pikerV = nil;

@implementation PAAddressPicker

- (instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
    if (self) {
        [self UIConfig];
    }
    return self;
}

+ (id)showCityPickerView:(UIView *)view :(NSString *)title :(NSArray *)datas :(void(^)(id content ,NSInteger index))completeBlock{
    
    if ( pikerV == nil) {
        pikerV = [[PAAddressPicker alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        pikerV.backgroundColor = ColorWithRGBA(0, 0, 0,0.25);
        pikerV.datas = datas;
        pikerV.addressLab.text = title;
        pikerV.selectedBlock = completeBlock;
        [view addSubview:pikerV];
        [view bringSubviewToFront:pikerV];
    }
    return pikerV;
}

- (void)UIConfig{
    
    _pickerBkV = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, CMScale(400))];
    _pickerBkV.backgroundColor = [UIColor whiteColor];
    [self addSubview:_pickerBkV];
    
    _picker = [[UIPickerView alloc] init];
    _picker.backgroundColor = [UIColor whiteColor];
    _picker.delegate = self;
    _picker.dataSource = self;
    [_pickerBkV addSubview:_picker];
    [_picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pickerBkV.mas_top);
        make.left.equalTo(_pickerBkV.mas_left);
        make.right.equalTo(_pickerBkV.mas_right);
        make.bottom.equalTo(_pickerBkV.mas_bottom).offset(CMScale(60));
    }];

    //功能栏按钮
    _addressLab = [UILabel new];
    _addressLab.font = [UIFont systemFontOfSize:CMFontSize(16) weight:1];
    [_pickerBkV addSubview:_addressLab];
    [_addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pickerBkV.mas_top).offset(CMScale(24));
        make.centerX.equalTo(_pickerBkV.mas_centerX);
        make.height.mas_equalTo(CMScale(22));
    }];
    
    //取消按钮
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:Color90949e forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:CMFontSize(14)];
    [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_pickerBkV addSubview:_cancelBtn];
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressLab);
        make.left.equalTo(_pickerBkV.mas_left).offset(CMScale(28));
        make.width.mas_equalTo(CMScale(50));
        make.height.mas_equalTo(CMScale(25));
    }];
    
    //确认按钮
    _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:CMFontSize(14)];
    [_confirmBtn setTitleColor:Color3c6bf0 forState:UIControlStateNormal];
    [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_pickerBkV addSubview:_confirmBtn];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressLab);
        make.right.equalTo(_pickerBkV.mas_right).offset(-CMScale(28));
        make.width.mas_equalTo(CMScale(50));
        make.height.mas_equalTo(CMScale(25));
    }];
    
    [UIView animateWithDuration:0.35 animations:^{
        CGRect frame =_pickerBkV.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - _pickerBkV.bounds.size.height;
        _pickerBkV.frame = frame;
    } completion:nil];
}

//点击取消按钮
- (void)cancelBtnClick:(UIButton *)btn{
    [self hiddenView];
}

- (void)confirmBtnClick:(UIButton *)btn{
    self.selectedBlock(_selectedContent,_selectedIndex);
    [self hiddenView];
}

- (void)setDatas:(NSArray *)datas{
    _datas = datas;
    [self.picker reloadAllComponents];
    [self pickerView:self.picker didSelectRow:0 inComponent:0];
}

#pragma mark - pickerView代理方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)   component{
    _selectedContent =  _datas[row];
    _selectedIndex = row;
}

#pragma mark - pickerView数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _datas.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    [pickerView clearSpearatorLine];
    
    UIView *componentV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, CMScale(66))];
    UILabel *lab = [UILabel new];
    lab.textColor = [UIColor blackColor];
    lab.text = _datas[row];
    lab.font = [UIFont systemFontOfSize:CMFontSize(16)];
    [componentV addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(componentV.mas_centerY);
        make.centerX.equalTo(componentV.mas_centerX);
    }];
    
    NSString *textTitle = [_datas objectAtIndex:row];
    CGSize titleSize = [textTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, CMScale(66)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:CMScale(16)]} context:nil].size;
    
    UIView *line = [UIView new];
    line.backgroundColor = Color90949e;
    [componentV addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(componentV.mas_bottom);
        make.centerX.equalTo(componentV.mas_centerX);
        make.width.mas_equalTo(titleSize.width);
        make.height.mas_equalTo(CMScale(1));
    }];
    return componentV;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return kScreenWidth;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return CMScale(66);
}

#pragma mark - 隐藏
- (void)hiddenView{
    [UIView animateWithDuration:0.35 animations:^{
        CGRect frame = _pickerBkV.frame;
        if (frame.origin.y < kScreenHeight) {
            frame.origin.y += frame.size.height;
            _pickerBkV.frame = frame;
        }
    } completion:^(BOOL finished) {
        pikerV.hidden = YES;
        [pikerV removeFromSuperview];
        pikerV = nil;
    }];
}

-(void)dealloc{
    pikerV = nil;
}

//点击空白部位隐藏
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hiddenView];
}

@end
