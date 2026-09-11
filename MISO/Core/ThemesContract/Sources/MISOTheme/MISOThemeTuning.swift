// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation

// MARK: - Type aliases

/// Type alias to keep things simple and short
public typealias Tuning = MISOThemeTuning

// MARK: - MISO Theme Tuning

/// To ease flexibility of themes and enhance their adoption some parts of the theme can be tuned.
/// This allows for example to have a theme defined by the Brand but to apply some customization.
///
/// - Since: 0.19.0
public struct MISOThemeTuning: @unchecked Sendable {

    /// Unique identifier for the tuning
    private let id = UUID()

    // MARK: Tuned properties

    /// If components like button (`MISOButton`) must have always rounded corners or not
    public let hasRoundedButtons: Bool

    /// If text input components (e.g. `MISOTextInput`, `MISOPinCodeInput`, `MISOPasswordInput` and `MISOTextArea`)
    /// must have always rounded corners or not
    public let hasRoundedTextInputs: Bool

    /// If components like alert message (e.g. `MISOAlertMessage`) must have always rounded corners or not
    public let hasRoundedAlertMessages: Bool

    /// If components like progress indicators (e.g. `MISOCircularProgressIndicator` or `MISOLinearProgressIndicator`) must have always rounded corners or not
    public let hasRoundedProgressIndicators: Bool

    /// If components like list item (`MISOStaticListItem` and `MISONavigationListItem`) must have always rounded corners or not
    public let hasRoundedListItems: Bool

    /// Defines the tuning for a theme
    ///
    /// - Parameters:
    ///    - hasRoundedButtons: If buttons must have rounded corners or not (default set to *false*)
    ///    - hasRoundedTextInputs: If text-based inputs components must have rounded corners or not (default set to *false*)
    ///    - hasRoundedAlertMessages: If alert messages components must have rounded corners or not (default set to *false*)
    ///    - hasRoundedProgressIndicators: If progress indicators components must have rounded corners or not (default set to *false*)
    ///    - hasRoundedListItems: If list items components must have rounded corners or not (default set to *false*)
    public init(hasRoundedButtons: Bool = false,
                hasRoundedTextInputs: Bool = false,
                hasRoundedAlertMessages: Bool = false,
                hasRoundedProgressIndicators: Bool = false,
                hasRoundedListItems: Bool = false)
    {
        self.hasRoundedButtons = hasRoundedButtons
        self.hasRoundedTextInputs = hasRoundedTextInputs
        self.hasRoundedAlertMessages = hasRoundedAlertMessages
        self.hasRoundedProgressIndicators = hasRoundedProgressIndicators
        self.hasRoundedListItems = hasRoundedListItems
    }
}

// MARK: - Equatable

extension Tuning: Equatable {

    /// Checks if tunings are equals
    ///
    /// - Parameters:
    ///    - lhs: One of the tuning to test
    ///    - rhs: One of the tuning to test
    public static func == (lhs: Tuning, rhs: Tuning) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Predefine tunings

extension Tuning {

    /// By default a theme does not have rounded corners at all
    public static let `default` = Tuning()
}
