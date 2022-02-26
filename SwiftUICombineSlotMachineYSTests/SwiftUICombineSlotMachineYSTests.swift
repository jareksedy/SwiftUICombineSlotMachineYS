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
        let expected = "Стоп!"
        
        viewModel.$buttonText
            .sink {
                
            }
        
        viewModel.$running
            .sink { _ in
                XCTAssertEqual(self.viewModel.buttonText, expected)
            }
            .store(in: &cancellables)
        
        // When
        viewModel.gameStarted = true
        viewModel.running = true
    }
}
