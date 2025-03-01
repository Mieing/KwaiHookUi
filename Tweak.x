// Use H7ang0's No Splash method "https://github.com/H7ang0/KuaishouNoAds"

#import <UIKit/UIKit.h>

@interface KSTabBarNewSlideFeedToolItemView : UIView
@end

@interface KSGPendantTaskAdsorptionBaoView : UIView
@end

@interface KSGPendantBgView: UIView
@end

@interface KSLocalPagePendantView: UIView
@end

@interface KSLocalPagePendantAdsorpView
- (id)closeButton;
- (void)didClickCloseButton;
@end

@interface KSAdSplashViewController : UIViewController
- (id)view;
- (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
@end

@interface KSLocalHeaderCollectionView : UICollectionView

@property (nonatomic, strong) UIView *view;
- (void)reloadData;
@end

@interface KSLocalHeaderCollectionCell : UICollectionViewCell
- (void)layoutSubviews;
@end


// 移除音乐转盘
%hook KSTabbarMusicDiskRootView 

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end


// 移除按钮
%hook KSTabBarNewSlideFeedToolItemView

- (void)layoutSubviews {
    %orig;

    // 获取accessibilityLabel
    NSString *accessibilityLabel = self.accessibilityLabel;

    // 隐藏收藏按钮
    if ([accessibilityLabel containsString:@"未收藏，收藏"]) {
        ((UIView *)self).hidden = YES;  // 隐藏按钮
    }

    // 隐藏分享按钮
    if ([accessibilityLabel containsString:@"分享"]) {
        ((UIView *)self).hidden = YES;  // 隐藏按钮
    }
}

%end

// 移除红包
%hook KSGPendantTaskAdsorptionBaoView

- (void)layoutSubviews {
    %orig; 
    ((UIView *)self).hidden = YES; 
}

%end

// 移除红包
%hook KSGPendantBgView

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end

// 移除同城悬浮
%hook KSLocalPagePendantView

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end


%hook KSLocalPagePendantAdsorpView

// 隐藏广告视图并阻止其显示
- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES;  // 隐藏广告视图
}

// 移除广告视图的初始化配置
- (void)configAdsorpViewWithItem:(id)item {
    // 不做任何事情，防止广告被显示或初始化
}

// 钩住关闭广告按钮的点击事件，防止关闭广告的操作
- (void)didClickCloseButton {
    // 什么都不做，防止关闭广告按钮起作用
}

// 移除广告的按钮视图（如果按钮是一个独立视图的话）
- (void)removeCloseButton {
    // 获取关闭按钮并强制转换为 UIView 类型
    id closeButton = [self closeButton];
    if (closeButton) {
        [(UIView *)closeButton setHidden:YES];  // 隐藏按钮
    }
}

%end


// 屏蔽启动广告
%hook KSAdSplashViewController

- (void)viewDidLoad {
    %orig;
    [self.view removeFromSuperview];
    [self dismissViewControllerAnimated:NO completion:nil];
}

%end

// 同城顶部广告
%hook KSLocalHeaderCollectionView

- (void)layoutSubviews {
    %orig;

    // 隐藏整个UICollectionView
    self.hidden = YES;
    
    // 也可以使用[self setHidden:YES]来隐藏具体的视图元素，避免完全移除
}

%end

// 同城顶部广告
%hook KSLocalHeaderCollectionCell

- (void)layoutSubviews {
    %orig;
    [self removeFromSuperview];
}

%end
