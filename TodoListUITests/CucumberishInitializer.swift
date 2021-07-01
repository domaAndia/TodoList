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
        before({ _ in
            //write our tests
            Given("I launch the app") { args, userInfo in
                XCUIApplication().launch()
            }
            
            When("I add \"([^\\\"]*)\" as a task") { args, _ in
                
                let task = (args?[0])!
                let taskTextField = XCUIApplication().textFields["taskTextField"]
                taskTextField.tap()
                taskTextField.typeText(task + "\n")
                
                XCUIApplication().buttons["addTaskButton"].tap()
            }

            Then("I should have \"([^\\\"]*)\" item in the list") { args, _ in
                let itemCount = Int((args?[0])!)!
                let taskCount = XCUIApplication().tables.children(matching: .cell).count
                XCTAssertEqual(itemCount, taskCount)
            }
        })
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags:nil, excludeTags: nil)
    }
}
