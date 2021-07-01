//
//  CucumberishLoader.m
//  TodoListUITests
//
//  Created by Andia Doma on 1/7/21.
//

#import <Foundation/Foundation.h>
#import "TodoListUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit() {
    [CucumberishInitializer setupCucumberish];
}
