//
//  AppDelegate.m
//  SH_Utils
//
//  Created by weish on 2019/5/24.
//  Copyright © 2019 bbw. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)testGroup{
    dispatch_group_t gt = dispatch_group_create();
    dispatch_queue_t qt = dispatch_get_global_queue(0, 0);
    
    dispatch_semaphore_t st  = dispatch_semaphore_create(0);
    dispatch_async(qt, ^{
        sleep(2);
        NSLog(@"1");
        dispatch_semaphore_signal(st);
    });
    dispatch_semaphore_wait(st, DISPATCH_TIME_FOREVER);
    dispatch_async(qt, ^{
        sleep(1);
        NSLog(@"2");
        dispatch_semaphore_signal(st);
    });
    dispatch_semaphore_wait(st, DISPATCH_TIME_FOREVER);
    dispatch_async(qt, ^{
        sleep(3);
        NSLog(@"3");
        dispatch_semaphore_signal(st);
    });
    dispatch_semaphore_wait(st, DISPATCH_TIME_FOREVER);
    dispatch_async(qt, ^{
        sleep(0.5);
        NSLog(@"4");
        dispatch_semaphore_signal(st);
    });
    
    dispatch_semaphore_wait(st, DISPATCH_TIME_FOREVER);
    NSLog(@"ok ok ok ");
    
    
    
    
}

- (void)testBarrier{
    dispatch_queue_t qt = dispatch_queue_create("xxx", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(qt, ^{
        NSLog(@"1");
    });
    dispatch_async(qt, ^{
        NSLog(@"2");
    });
    dispatch_async(qt, ^{
        NSLog(@"3");
    });
    dispatch_async(qt, ^{
        NSLog(@"4");
    });
    dispatch_async(qt, ^{
        sleep(2);
        NSLog(@"5");
    });
    NSLog(@"-----");
    dispatch_barrier_async(qt, ^{
        NSLog(@"wait");
    });
    NSLog(@"=====");
    
    dispatch_async(qt, ^{
        sleep(1);
        NSLog(@"6");
    });
    dispatch_async(qt, ^{
        sleep(1);
        NSLog(@"7");
    });
    dispatch_async(qt, ^{
        sleep(1);
        NSLog(@"8");
    });
    
    NSLog(@"end");
}

- (void)testGCD{

    for (int i = 0; i<10; i++) {
        
        
        dispatch_semaphore_t st = dispatch_semaphore_create(0);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(arc4random()%4);
            NSLog(@"%ld %ld",i,arc4random()%4);
            dispatch_semaphore_signal(st);
        });

        dispatch_semaphore_wait(st, dispatch_time(DISPATCH_TIME_NOW, 100 *NSEC_PER_SEC ));
    }
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self test];
//    [self testGCD];
//    [self testBarrier];
    [self testGroup];
    
//    for (int i = 0; i<count-1; i++) {
//        for (int j=i+1; j<count; j++) {
//            if ([arr[i] integerValue]+ [arr[j] integerValue]==temp) {
//                NSLog(@"%@ %@",arr[i],arr[j]);
//            }else{
//                NSLog(@"没有");
//            }
//        }
//    }
    
    
    
    
    
    
    return YES;
}

    void sort(int *a, int left, int right)
    {
        
        
        if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
        {
            return ;
        }
        int i = left;
        int j = right;
        int key = a[left];
        
        while(i < j)                               /*控制在当组内寻找一遍*/
        {
            while(i < j && key <= a[j])
            /*而寻找结束的条件就是，1，找到一个小于或者大于key的数（大于或小于取决于你想升
             序还是降序）2，没有符合条件1的，并且i与j的大小没有反转*/
            {
                j--;/*向前寻找*/
            }
            
            a[i] = a[j];
            /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
             a[left]，那么就是给key）*/
            
            while(i < j && key >= a[i])
            /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
             因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
            {
                i++;
            }
            
            a[j] = a[i];
        }
        
        a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
        
        sort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
        sort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
        /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
        
//         printArr(a);
        
        printArr(a,10);
    }


void printArr(int *a,int count) {
//    int count = sizeof(a)/sizeof(a[0]);
//    a s只是个 地址 32 d系统 4字节 64 8字节
    for (int i = 0; i<count; i++) {
        NSLog(@"%d",a[i]);
    }
    printf("\n==================\n");
    
}

- (NSArray *)flushArr:(NSMutableArray *)arr2{
    NSMutableArray *arr = @[].mutableCopy;
    
    for (id obj in arr2) {
        
        if([[obj class] isKindOfClass:[NSArray class]]){
            for ( id temp in obj) {
                [arr2 addObject:temp];
            }
        }else{
       [arr addObject:obj];
            NSLog(@"没有数组");
        }
    }
    
    
    return arr;
}
- (void)test{
    NSArray *a  = @[];
    id obj = [NSArray class];
    id onn = [@[] class];
    
    NSLog(@"%d",[@[] isKindOfClass:[NSArray class]]);
    NSLog(@"a %@",[a class]);
    NSLog(@"array %@",[NSArray class]);
    return;
    NSMutableArray *arr3 =@[@(1),@(3),@[@(3),@(4)]].mutableCopy;
    NSArray *arr23 =  [self flushArr:arr3];
    NSLog(@"%@",arr23);
    
    
//    return

//    int arr2[] ={56,28,45,93,10,32,44,95,60,58};
//    printArr(arr2, 10);
//    int count = sizeof(arr2)/sizeof(arr2[0]);
//    sort(arr2, 0, count-1);
    
//    printArr(&arr2);
//    for (int i = 0; i<count; i++) {
//        NSLog(@"%d",arr2[i]);
//    }

    NSMutableArray *arr = @[@(1),@(3),@(44),@(21),@(99)].mutableCopy;
    id temp = 0;
    NSInteger count = arr.count;
    
    
    
//    return;
    for (int i = 0; i<count; i++) {
        for (int j=i; j<count - i - 1; j++) {
            if(arr[j]<arr[j+1]){
                temp = arr[j];
                
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    NSLog(@"%@",arr);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
