//
//  GollyMessageForwarding.h
//  golly_Runtime
//
//  Created by 孙国立 on 2018/4/16.
//  Copyright © 2018年 孙国立. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GollyMessageForwarding : NSObject
//.h文件中创建一个gollyRun方法 .m文件中不需要去实现这个方法。就使用gollyRun方法讲解消息转发机制
- (void)gollyRun;
@end
