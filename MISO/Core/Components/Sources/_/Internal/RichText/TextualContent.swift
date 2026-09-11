// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Textual Content

/// Some components can have textual contents like descriptions.
/// These things can be defined with raw `String` or rich text like `AttributedString`, or localized string.
/// Helps to have in one property several cases instead of several properties.
enum TextualContent {

    /// The text is a raw `String` to use as is
    case raw(String)

    /// The text is an `AttributtedString`, a rich text
    case attributed(AttributedString)

    /// Returns the text value of the element.
    /// Voice Over will be able to vocalize it, at least for `String` and `AttributedString(markdown:)` cases.
    var rawValue: String {
        switch self {
        case let .raw(text):
            text
        case let .attributed(text):
            String(text.characters)
        }
    }

    var isEmpty: Bool {
        switch self {
        case let .raw(text):
            text.isEmpty
        case let .attributed(text):
            text.isEmpty
        }
    }
}

// MARK: - Attributed String

extension AttributedString {

    var isEmpty: Bool {
        characters.isEmpty
    }
}
