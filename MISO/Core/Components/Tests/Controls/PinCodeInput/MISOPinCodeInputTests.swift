// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS) && !os(macOS)
@testable import MISOComponents
import Testing
import UIKit

/// Tests some API for `MISOPinCodeInput`
@MainActor
struct MISOPinCodeInputTests {

    /// Test the raw values for the length of the component
    @Test func `pin code input length values`() {
        #expect(MISOPinCodeInput.Length.four.rawValue == 4)
        #expect(MISOPinCodeInput.Length.six.rawValue == 6)
        #expect(MISOPinCodeInput.Length.eight.rawValue == 8)
    }

    /// Test the string values used for obfuscation and placeholders
    @Test func `pin code input predefined symbols`() {
        #expect(MISOPinCodeInput.obfuscationCharacter == "●")
        #expect(MISOPinCodeInput.placeholderCharacter == "-")
    }

    @Test func `text field delegate reports focus changes`() {
        let coordinator = BackspaceDetectingTextField.Coordinator(text: .constant(""), index: 0)
        var focusChanges: [Bool] = []
        coordinator.onFocusChanged = { focusChanges.append($0) }
        let textField = UITextField()

        coordinator.textFieldDidBeginEditing(textField)
        coordinator.textFieldDidEndEditing(textField)

        #expect(focusChanges == [true, false])
    }

    @Test func `backspace triggers one callback`() {
        let textField = BackspaceTextField()
        var backspaceCount = 0
        textField.onBackspace = { backspaceCount += 1 }

        textField.deleteBackward()

        #expect(backspaceCount == 1)
    }

    @Test func `pasted digits are forwarded together`() async throws {
        let textField = BackspaceTextField()
        var insertedText = ""
        textField.onTextInserted = { insertedText = $0 }

        textField.accumulate(digit: "123456")
        try await Task.sleep(nanoseconds: 100_000_000)

        #expect(insertedText == "123456")
    }

    @Test func `completed value only uses active digits`() {
        #expect(PinCodeInputContainer.completedValue(from: ["1", "2", "3", "4"], length: 4) == "1234")
        #expect(PinCodeInputContainer.completedValue(from: ["1", "2", "3", "4", "5", "6"], length: 6) == "123456")
        #expect(PinCodeInputContainer.completedValue(from: ["1", "2", "3", "4", "5", "6", "7", "8"], length: 8) == "12345678")
        #expect(PinCodeInputContainer.completedValue(from: ["1", "2", "3", "4", "", ""], length: 4) == "1234")
    }

    @Test func `incomplete value is not exposed`() {
        #expect(PinCodeInputContainer.completedValue(from: ["1", "2", "3", ""], length: 4) == nil)
    }
}
#endif
