// FormatterTests.swift
// ArgumentEncoding
//
// This source code is licensed under the MIT License (MIT) found in the
// LICENSE file in the root directory of this source tree.

import ArgumentEncoding
import Foundation
import XCTest

final class FormatterTests: XCTestCase {
    func testFlagFormatterSingleDashPrefix() {
        XCTAssertEqual(
            FlagFormatter(prefix: .singleDash).format(key: "flagKey"),
            "-flagKey"
        )
    }

    func testFlagFormatterDoubleDashPrefix() {
        XCTAssertEqual(
            FlagFormatter(prefix: .doubleDash).format(key: "flagKey"),
            "--flagKey"
        )
    }

    func testFlagFormatterEmptyPrefix() {
        XCTAssertEqual(
            FlagFormatter(prefix: .empty).format(key: "flagKey"),
            "flagKey"
        )
    }

    func testFlagFormatterKebabCaseBody() {
        XCTAssertEqual(
            FlagFormatter(key: .kebabCase).format(key: "flagKey"),
            "flag-key"
        )
    }

    func testFlagFormatterSnakeCaseBody() {
        XCTAssertEqual(
            FlagFormatter(key: .snakeCase).format(key: "flagKey"),
            "flag_key"
        )
    }

    func testOptionFormatterSingleDashPrefix() {
        XCTAssertEqual(
            OptionFormatter(prefix: .singleDash).format(key: "optionKey", value: "optionValue"),
            ["-optionKey", "optionValue"]
        )
    }

    func testOptionFormatterDoubleDashPrefix() {
        XCTAssertEqual(
            OptionFormatter(prefix: .doubleDash).format(key: "optionKey", value: "optionValue"),
            ["--optionKey", "optionValue"]
        )
    }

    func testOptionFormatterEmptyPrefix() {
        XCTAssertEqual(
            OptionFormatter(prefix: .empty).format(key: "optionKey", value: "optionValue"),
            ["optionKey", "optionValue"]
        )
    }

    func testOptionFormatterKebabCaseBody() {
        XCTAssertEqual(
            OptionFormatter(key: .kebabCase).format(key: "optionKey", value: "optionValue"),
            ["option-key", "optionValue"]
        )
    }

    func testOptionFormatterSnakeCaseBody() {
        XCTAssertEqual(
            OptionFormatter(key: .snakeCase).format(key: "optionKey", value: "optionValue"),
            ["option_key", "optionValue"]
        )
    }

    func testOptionFormatterEqualSeparator() {
        XCTAssertEqual(
            OptionFormatter(separator: .equal).format(key: "optionKey", value: "optionValue"),
            ["optionKey=optionValue"]
        )
    }

    func testOptionFormatterSingleQuoteValue() {
        XCTAssertEqual(
            OptionFormatter(value: .singleQuote).format(key: "optionKey", value: "optionValue"),
            ["optionKey", "'optionValue'"]
        )
    }
}
