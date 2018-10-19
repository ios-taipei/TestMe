//
//  TestMeUITest.m
//  TestMeUITests
//
//  Created by aki.yu on 2018/10/4.
//  Copyright © 2018 aki.yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestMeUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit()
{
    [CucumberishInitializer CucumberishSwiftInit];
}

