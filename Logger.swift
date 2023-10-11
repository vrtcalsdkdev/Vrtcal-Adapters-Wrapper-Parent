//
//  Logger.swift
//  Vrtcal-Adapters-Wrapper-Parent
//
//  Created by Scott McCoy on 10/10/23.
//

import Foundation

public protocol Logger {
    func logInternal(
        _ message: String,
        file: StaticString,
        line: UInt,
        column: UInt,
        function: StaticString
    )
}

public extension Logger {
    func log(
        _ message: String = "",
        file: StaticString = #file,
        line: UInt = #line,
        column: UInt = #column,
        function: StaticString = #function
    ) {
        logInternal(
            message,
            file: file,
            line: line,
            column: column,
            function: function
        )
    }
}
