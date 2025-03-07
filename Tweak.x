// by Mieing 25.3.3

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

@interface KSDanmakuCellContentView : UIView
- (UIColor *)generateRandomColor;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@interface KSCubeHomeTopBarItemButton : UIButton
@end

// 移除音乐转盘
%hook KSTabbarMusicDiskRootView 

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end


// 移除收藏、分享按钮
%hook KSTabBarNewSlideFeedToolItemView

- (void)layoutSubviews {
    %orig;

    NSString *accessibilityLabel = self.accessibilityLabel;

    if ([accessibilityLabel containsString:@"未收藏，收藏"]) {
        ((UIView *)self).hidden = YES;
    }

    if ([accessibilityLabel containsString:@"分享"]) {
        ((UIView *)self).hidden = YES;

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

// Ad
%hook KSLocalPagePendantAdsorpView


- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES;

}

- (void)configAdsorpViewWithItem:(id)item {

}


- (void)didClickCloseButton {
}

- (void)removeCloseButton {
    id closeButton = [self closeButton];
    if (closeButton) {
        [(UIView *)closeButton setHidden:YES];
    }
}

%end

/*
// 屏蔽启动广告
%hook KSAdSplashViewController

- (void)viewDidLoad {
    %orig;
    [self.view removeFromSuperview];
    [self dismissViewControllerAnimated:NO completion:nil];
}

%end
*/

/*
// 隐藏同城顶栏
%hook KSLocalHeaderCollectionCell

- (void)didMoveToSuperview {
    %orig;
    if (self.superview) {
        [self removeFromSuperview];
    }
}

%end
*/

// 隐藏底栏皮肤
%hook KSCubeRFBottomBarView
- (void)setFromBgImageView:(id)arg1 {
}
%end

// 随机颜色弹幕
%hook KSDanmakuCellContentView
- (void)layoutSubviews {
    %orig;
    if (self.contentLabel && !self.contentLabel.hidden) {
        UIColor *randomColor = [self generateRandomColor];
        self.contentLabel.textColor = randomColor;
    }
}

%new
- (UIColor *)generateRandomColor {
    u_int32_t red = arc4random_uniform(256);
    u_int32_t green = arc4random_uniform(256);
    u_int32_t blue = arc4random_uniform(256);
    return [UIColor colorWithRed:red/255.0f
                         green:green/255.0f
                          blue:blue/255.0f
                         alpha:1.0];
}
%end

// 移除商城、热门按钮
%hook KSCubeHomeTopBarItemButton

- (void)layoutSubviews {
    %orig;
    
    if (self.currentTitle && 
       ([self.currentTitle isEqualToString:@"商城"] || 
        [self.currentTitle isEqualToString:@"热门"])) {
        [self removeFromSuperview];
    }
}

%end

// 移除我页面的“上周数据更新”
%hook KSProfileWeeklyReportButton
- (void)setupSubviews {
}
%end