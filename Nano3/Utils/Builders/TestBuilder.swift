//
//  TestBuilder.swift
//  Nano3
//
//  Created by Felipe Melo on 2/19/18.
//  Copyright © 2018 Felipe Melo. All rights reserved.
//

import Foundation

class TestBuilder {
    private var test: Test!
    
    init() {
        setup()
    }
    
    private func setup() {
        test = Test()
    }
}

extension TestBuilder {
    func getTest() -> Test {
        return test
    }
}
