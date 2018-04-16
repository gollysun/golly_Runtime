//
//  GollyMessageForwarding.m
//  golly_Runtime
//
//  Created by 孙国立 on 2018/4/16.
//  Copyright © 2018年 孙国立. All rights reserved.
//

#import "GollyMessageForwarding.h"
#import "GollyAnimation.h"
#import <objc/message.h>
@implementation GollyMessageForwarding

/*
 方法执行规则从上到下开始  如果第一个方法没有做动态解析则走第二个 以此类推
 
 */




//动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if(sel == @selector(gollyRun)){
//        /*
//         Class   类
//         SEL  sel
//         IMP  要实现的方法
//         type:v@:
//         */
//        class_addMethod(self, sel, (IMP)gollyRunNew, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

void gollyRunNew(id self, SEL _cmd)
{
    NSLog(@"runtime动态添加一个方法实现gollyRun方法");
}
//快速消息转发
//注意Animation 中的方法需要和 aSelector方法名一致   方法名自行打印查看
- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    //return [[GollyAnimation alloc]init];
    
    return [super forwardingTargetForSelector:aSelector];
}

//生成方法签名
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = [anInvocation selector];
    GollyAnimation *animation = [GollyAnimation new];
    if ([animation respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:animation];
    }else{
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *selString = NSStringFromSelector(aSelector);
    if ([selString isEqualToString:@"gollyRun"]) {
        return [NSMethodSignature signatureWithObjCTypes:"i@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}
//如果动态解析后仍然失败则可以走这个方法
- (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@".....方法不存在");
    [super doesNotRecognizeSelector:aSelector];
}


@end
