// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensRaw
import MISOTokensSemantic
import Testing

/// To ensure the `MultipleFontSizeSemanticToken` is tested as a provider of semantic tokens for compact and regular size classes.
struct MultipleFontSizeSemanticTokenTests {

    /// Tests if the unique value is applied for light and dark modes
    @Test func initWithOneValue() {
        let unique: FontSizeSemanticToken = FontRawTokens.size150
        let token = MultipleFontSizeSemanticToken(unique)

        #expect(token.compact == unique)
        #expect(token.regular == unique)
    }

    /// Tests if compact and regular values are preserved when defined with two assigned non nil values
    @Test func initWithTwoValues() {
        let compact: FontSizeSemanticToken = FontRawTokens.size150
        let regular: FontSizeSemanticToken = FontRawTokens.size550
        let token = MultipleFontSizeSemanticToken(compact: compact, regular: regular)

        #expect(token.compact == compact)
        #expect(token.regular == regular)
    }

    /// Tests comparisons between two `MultipleFontSizeSemanticToken` to ensure tokens are considered as equal
    /// if an only if they have the same compact and regular values and have the same types.
    @Test func isEqual() {
        let first = MultipleFontSizeSemanticToken(compact: FontRawTokens.size200, regular: FontRawTokens.size450)
        let second = MultipleFontSizeSemanticToken(compact: FontRawTokens.size550, regular: FontRawTokens.size950)
        let third = MultipleFontSizeSemanticToken(compact: FontRawTokens.size200, regular: FontRawTokens.size950)
        let fourth = MultipleFontSizeSemanticToken(compact: FontRawTokens.size550, regular: FontRawTokens.size450)
        let fifth = MultipleFontSizeSemanticToken(compact: FontRawTokens.size200, regular: FontRawTokens.size450)
        let sixth = MultipleSizeSemanticToken(compact: 12, regular: 12)

        #expect(first.isEqual(first))
        #expect(!first.isEqual(second))
        #expect(!first.isEqual(third))
        #expect(!first.isEqual(fourth))
        #expect(first.isEqual(fifth))
        #expect(!first.isEqual(sixth))
    }
}
