//
//  SwiftUICombineSlotMachineYSTests.swift
//  SwiftUICombineSlotMachineYSTests
//
//  Created by Ярослав on 26.02.2022.
//

import XCTest
import Combine
@testable import SwiftUICombineSlotMachineYS

class SwiftUICombineSlotMachineYSTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var viewModel: SlotViewModel!
    
    override func setUpWithError() throws {
        viewModel = SlotViewModel()
    }
    
    override func tearDownWithError() throws {
        cancellables = []
    }
    
    // Тест изменения текста кнопки в зависимости от состояния вьюмодели
    func testButtonTextChanged() {
        // Given
        let expected = "Крутить!"
        let expectation = XCTestExpectation(description: "Тест кнопки.")
        
        viewModel
            .$buttonText
            .dropFirst() // дропаем первое значение, заданное при инициализации
            .sink { value in XCTAssertEqual(value, expected); expectation.fulfill() }
            .store(in: &cancellables)
        
        // When
        viewModel.running = false
        
        // Then
        wait(for: [expectation], timeout: 1)
    }
}
