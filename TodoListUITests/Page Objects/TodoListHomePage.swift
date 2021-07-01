//
//  TodoListHomePage.swift
//  TodoListUITests
//
//  Created by Andia Doma on 1/7/21.
//

import Foundation
import XCTest

class TodoListHomePage {
    
    func launch() {
        XCUIApplication().launch()
    }
    
    func typeInTaskTextField(_ text: String) {
        let textField = XCUIApplication().textFields["taskTextField"]
        textField.tap()
        textField.typeText(text + "\n")
    }
    
    func tapAddTaskButton() {
        XCUIApplication().buttons["addTaskButton"].tap()
    }
    
    var totalTasks: Int {
        return XCUIApplication().tables.children(matching: .cell).count
    }
}
