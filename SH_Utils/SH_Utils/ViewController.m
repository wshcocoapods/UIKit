//
//  ViewController.m
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Sh_Init.h"
#import "SH_GlobalManager.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *lb;
@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSString *xxx;
@end

@implementation ViewController

- (void)addItemWith:(NSMutableArray *)arrM arr:(id)obj {
    
    if([obj isKindOfClass:[NSArray class]]){
        for(id sub in obj){
            [self addItemWith:arrM arr:sub];
        }
    }else{
        [arrM addObject:obj];
    }

}

- (NSArray *)createMneuWith:(NSString *)key :(NSArray *)arr :(NSMutableArray *)targetArr{
    
    NSMutableArray *arrM = @[].mutableCopy;

    for (NSDictionary<NSString *,NSString*> *obj in arr) {
        if([obj[@"sp"] isEqualToString:key]){
            [arrM addObject:obj];
        }
    }
    
    
    for (id obj in arrM) {
//        if([obj[@"id"] isEqualToString:key])
//        NSArray *itme =  [self createMneuWith:obj[@"id"] :arr :targetArr];
//        [obj[@"sub"] addObject:itme];

    }
    return arrM;
}

- (void)dg:(id )source :(NSMutableArray *)target{
    if ([source isKindOfClass:[NSArray class]]) {
        for (id obj  in source) {
            [self dg:obj :target];
        }
    }else{
        [target addObject:source];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@,%@",change[NSKeyValueChangeNewKey],keyPath);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr = @[].mutableCopy;
    self.xxx = @"";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.arr addObject:@"xx"];
        self.xxx = @"xxxxxx";
    });
    
    [self addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"xxx" options:NSKeyValueObservingOptionNew context:nil];
    UILabel *lb = [[UILabel alloc]initWithSuperView:self.view];
    self.lb = lb;
    lb.sh_font([UIFont systemFontOfSize:30]).sh_text(@"this is good");
    lb.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch)];
    [lb addGestureRecognizer:tap];
    lb.frame = CGRectMake(0, 0, 100, 100);
    
    NSLog(@"%.2f,%.2f",[UIScreen mainScreen].bounds.size.width,
          [UIScreen mainScreen].bounds.size.height);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
 // d递归 目录
    
    NSArray *menus = @[@{@"id":@"1",@"sp":@"0",@"sub":@[].mutableCopy},
                       @{@"id":@"2",@"sp":@"0",@"sub":@[].mutableCopy},
                       @{@"id":@"3",@"sp":@"0",@"sub":@[].mutableCopy},
                       @{@"id":@"11",@"sp":@"1",@"sub":@[].mutableCopy},
                       @{@"id":@"12",@"sp":@"1",@"sub":@[].mutableCopy},
                       @{@"id":@"111",@"sp":@"11",@"sub":@[].mutableCopy},
                       @{@"id":@"124",@"sp":@"12",@"sub":@[].mutableCopy},
                       @{@"id":@"123",@"sp":@"12",@"sub":@[].mutableCopy},];
    
    
    
    NSMutableArray *taG  = @[].mutableCopy;
    [self createMneuWith:@"0" :menus :taG];
//
    
    NSMutableArray *XM = @[].mutableCopy;
    NSArray *AM = @[@"1",@"2",@[@"31",@"31"],@[@[@"41"],@[@"42"]]];
//    [self addItemWith:XM arr:AM];
    [self dg:AM :XM];
    
    
    return;
    SH_GlobalManager *obj =  [SH_GlobalManager shareInstance];
    obj.name = @"嘻嘻嘻嘻嘻";
    NSLog(@"%@ == %@",obj,obj.name);
    obj = nil;
    NSLog(@"%@ == %@",obj,obj.name);
        [SH_GlobalManager destroy];
    obj = [SH_GlobalManager shareInstance];

    NSLog(@"%@ == %@",obj,obj.name);
    
    int arr[] = {1,20,34,9,5,0,1,3,414,-1};
    int count = 10;
    int temp;
//    for (int i = 0; i<10-1; i++) {
//        for (int j = 0; j<10-i-1; j++) {
//            if (arr[j]>arr[j+1]) {
//                temp = arr[j];
//                arr[j] = arr[j+1];
//                arr[j+1] = temp;
//            }
//        }
//    }
    quickSort(arr,0,9);
    
    for (int i = 0; i<10; i++) {
        printf("%d,",arr[i]);
    }
    
    [self.lb addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:@"view_view"];
}

void quickSort(int *a ,int left,int right){
    int i = left ,j = right, key =a[i];
    if (left > right) {
        return;
    }
    
    while (i < j) {
        while (i<j && key <= a[j]) {
            j--;
        }
        a[i]=a[j];
        while (i<j && key >= a[i]) {
            i++;
        }
        a[j]=a[i];
    }
    a[i]=key;
    quickSort(a,left,i-1);
    quickSort(a,i+1,right);
}

-(void)touch{
    static int i = 0;
    NSString *str = [NSString stringWithFormat:@"点击 %ld",i++];
    [[SH_GlobalManager shareInstance] showMsgWith:str color:[UIColor redColor]];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    self.lb.text = @"1";
}



@end
