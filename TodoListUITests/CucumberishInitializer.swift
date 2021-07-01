//
//  CucumberishInitializer.swift
//  TodoListUITests
//
//  Created by Andia Doma on 1/7/21.
//

import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    
    @objc class func setupCucumberish() {
        
        let todoListHomePage = TodoListHomePage()
        
        before({ _ in
            //write our tests
            Given("I launch the app") { args, userInfo in
                todoListHomePage.launch()
            }
            
            When("I add \"([^\\\"]*)\" as a task") { args, _ in
                
                let task = (args?[0])!
                todoListHomePage.typeInTaskTextField(task)
                todoListHomePage.tapAddTaskButton()
            }
            
            Then("I should have \"([^\\\"]*)\" item in the list") { args, _ in
                let itemCount = Int((args?[0])!)!
                XCTAssertEqual(itemCount, todoListHomePage.totalTasks)
            }
            
            //zero tasks
            Given("I launch the app for the first time") { _, _ in
                todoListHomePage.launch()
            }
            
            Then("I should see 0 tasks") { _, _ in
                XCTAssertEqual(0, todoListHomePage.totalTasks)
            }
        })
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags:nil, excludeTags: nil)
    }
}
