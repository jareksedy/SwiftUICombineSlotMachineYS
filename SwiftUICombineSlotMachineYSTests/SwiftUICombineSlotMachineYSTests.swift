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
    
    func test_collect() {
//        // Given
//        let values = [0, 1, 2]
//        let publisher = values.publisher
//        
//        // When
//        publisher
//            .collect()
//            .sink(receiveValue: {
//                // Then
//                XCTAssert(
//                    $0 == values,
//                    "Result was expected to be \(values) but was \($0)"
//                )
//            })
//            .store(in: &cancellables)
    }
}
