// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensRaw
import MISOTokensSemantic
import Testing

/// To ensure the `ColorSemanticToken` follow the expected rules
struct ColorSemanticTokensTests {

    /// Tests controls on `ColorSemanticToken` to ensure that if it is a forbidden value we know it
    @Test func hasForbiddenColorValues() {
        // Given
        let forbiddenColorValue = "miso-forbidden-color-value"
        let notForbiddenColorValue = ColorRawTokens.functionalMalachite300

        // When, then
        var colorSemanticToken: ColorSemanticToken = notForbiddenColorValue
        #expect(colorSemanticToken.isForbiddenValueColor() == false)

        // When, then
        colorSemanticToken = forbiddenColorValue
        #expect(colorSemanticToken.isForbiddenValueColor() == true)
    }
}
