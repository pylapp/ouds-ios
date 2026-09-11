//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

#if !os(watchOS) && !os(macOS)
@testable import MISOComponents
import Testing

/// Tests some API for `MISOTextArea`
struct OUDSTextAreaTests {

    /// Test the controls on limit exceedings
    @MainActor @Test func `text does exceed limit`() {
        // Given
        let smallText = "1234567890"
        let helperForSmallText = MISOTextArea.HelperText.charactersMaxCount(50)
        // When
        let smallTextDoesNotExceedLimit = MISOTextArea.textDoesExceedLimit(smallText, helperText: helperForSmallText)
        // Then
        #expect(smallTextDoesNotExceedLimit == false)

        // Given
        let exactText = "Lorem ipsum"
        let helperForExactText = MISOTextArea.HelperText.charactersMaxCount(11)
        // When
        let exactTextDoesNotExceedLimit = MISOTextArea.textDoesExceedLimit(exactText, helperText: helperForExactText)
        // Then
        #expect(exactTextDoesNotExceedLimit == false)

        // Given
        let bigText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        let helperForBigText = MISOTextArea.HelperText.charactersMaxCount(10)
        // When
        let bigTextExceedsLimit = MISOTextArea.textDoesExceedLimit(bigText, helperText: helperForBigText)
        // Then
        #expect(bigTextExceedsLimit == true)

        // Given
        let emptyText = ""
        let helperForEmptyText = MISOTextArea.HelperText.charactersMaxCount(10)
        // When
        let emptyTextDoesNotExceedLimit = MISOTextArea.textDoesExceedLimit(emptyText, helperText: helperForEmptyText)
        // Then
        #expect(emptyTextDoesNotExceedLimit == false)

        // Given
        let zeroHelperForEmptyText = MISOTextArea.HelperText.charactersMaxCount(0)
        // When
        let emptyZeroTextDoesNotExceedLimit = MISOTextArea.textDoesExceedLimit(emptyText, helperText: zeroHelperForEmptyText)
        // Then
        #expect(emptyZeroTextDoesNotExceedLimit == false)
    }

    /// Test the controls on exceeeding counts
    @MainActor @Test func `text exceeding count`() {
        // Given
        var someText = "Lorem ipsum" // Length of 11
        var helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(5)
        // When
        var exceedingCount = MISOTextArea.textExceedingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(exceedingCount == 6) // 11 - 5 = 6

        // Given
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(11)
        // When
        exceedingCount = MISOTextArea.textExceedingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(exceedingCount == 0) // 11 - 11 = 0

        // Given
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(50)
        // When
        exceedingCount = MISOTextArea.textExceedingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(exceedingCount == 0) // 11 < 50, so 0 exceeding

        // Given
        someText = ""
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(10)
        // When
        exceedingCount = MISOTextArea.textExceedingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(exceedingCount == 0) // Empty string, 0 exceeding
    }

    /// Test the controls on remaining counts
    @MainActor @Test func `text remaining count`() {
        // Given
        var someText = "Lorem ipsum" // Length of 11
        var helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(5)
        // When
        var remainingCount = MISOTextArea.textRemainingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(remainingCount == 0) // 11 > 5, exceeding, 0 remaining

        // Given
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(11)
        // When
        remainingCount = MISOTextArea.textRemainingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(remainingCount == 0) // 11 - 11 = 0

        // Given
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(50)
        // When
        remainingCount = MISOTextArea.textRemainingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(remainingCount == 39) // 50 - 11 = 39

        // Given
        someText = ""
        helperForSomeText = MISOTextArea.HelperText.charactersMaxCount(10)
        // When
        remainingCount = MISOTextArea.textRemainingCount(someText, helperText: helperForSomeText)
        // Then
        #expect(remainingCount == 10)
    }
}
#endif
