// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation

// MARK: - Operators

infix operator <-

// MARK: - String extension - Localization

extension String {

    // swiftlint:disable nslocalizedstring_key
    // swiftlint:disable line_length
    /// Returns the localized result string using `self` as key.
    ///
    /// If language is supported by *Bundle.module* the localized string is retuned from it.
    /// Else, check if language is supported by *Bundle.main* (i.e. application), the localized string is retuned from it.
    /// Else, as fallback the default language from *Bundle.module* is used.
    ///
    /// - Returns String: The conversion of `self` as `NSLocalizedString`
    public func localized() -> String {

        // let preferredLocalization = Bundle.preferredLocalization

        // If language is supported by Bundle.module, prefer this translation
        let stringInModule = NSLocalizedString(self, tableName: nil, bundle: Bundle.module, value: "", comment: "")
        if stringInModule != self {
            // ML.debug("L10N: Preferred localization found: '\(preferredLocalization)' in Bundle.module")
            return stringInModule
        }

        // If language is supported by Bundle.main (i.e. application) use it.
        let stringInMain = NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
        if stringInMain != self {
            // ML.debug("L10N: Preferred localization found: '\(preferredLocalization)' in Bundle.main")
            return stringInMain
        }

        // Fallback, use default language from Bundle.module
        // ML.warning("L10N: Unable to find string '\(self)' from Bundle.module and Bundle.main for preferred localization '\(preferredLocalization)': use the default language of Bundle.module")
        return stringInModule
    }

    // swiftlint:enable nslocalizedstring_key
    // swiftlint:enable line_length

    /// Returns a localized String using `self` as wording key expected to be in localizables.
    /// Will then inject as `String` the given `argument` inside the parameterized string.
    /// - Parameter argument: The unique value to insert in the localized string with `self` as key
    /// - Returns: The localized `String`
    public func localized(with argument: CVarArg) -> String {
        String(format: localized(), argument)
    }

    /// Just an operator to inject as `String` one argument in a localizable
    /// - Parameters:
    ///    - lhs: The localizable value to update
    ///    - rhs: The value as String to inject in `lhs`
    /// - Returns String: The final result
    public static func <- (lhs: String, rhs: String) -> String {
        String(format: lhs.localized(), rhs)
    }

    /// Just an operator to inject as `Int` one argument in a localizable
    /// - Parameters:
    ///    - lhs: The localizable value to update
    ///    - rhs: The value as Int to inject in `lhs`
    /// - Returns String: The final result
    public static func <- (lhs: String, rhs: Int) -> String {
        String(format: lhs.localized(), rhs)
    }
}
