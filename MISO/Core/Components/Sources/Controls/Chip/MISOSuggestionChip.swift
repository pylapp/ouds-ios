// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI

/// Suggestion chip is a UI element that allows to present recommended or predictive options based on user's input or context,
/// and is commonly used to capture filtering decisions.
/// Suggestion chip is typically non-selected by default and can be tapped or clicked to apply the suggestion, streamlining input and enhancing usability.
/// Chips can show multiple interactive elements together in the same area, such as a list of selectable movie times, or a serie of email contacts.
/// Best suited for category-based filters that do not require additional visual elements.
///
/// ## Accessibility considerations
///
/// This component does not define in its side some accessibility hints. If you use this component, you must define such hints so as to explain
/// to your users which actions are available for which interactions.
///
/// ## Code samples
///
/// ```swift
///     // Icon only
///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")), accessibilityLabel: "Heart") {}
///
///     // Icon only, raw image (not tinted)
///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart"), renderingMode: .original), accessibilityLabel: "Heart") {}
///
///     // Text only
///     MISOSuggestionChip(text: "Heart") {}
///
///     // Text from a localizable and a bundle
///     MISOSuggestionChip(LocalizedStringKey("category_chip"), bundle: Bundle.module) {}
///
///     // Text and icon
///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")), text: "Heart") {}
///
///     // Text and icon, raw image (not tinted)
///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart"), renderingMode: .original), text: "Heart") {}
/// ```
///
/// - Version: 1.5.0 (Figma component design version)
/// - Since: 0.17.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOSuggestionChip: View {

    // MARK: - Stored Properties

    private let layout: Chip.Layout
    private let action: () -> Void

    // MARK: - Initializers — icon + LocalizedStringKey text

    /// Creates a chip with a localized text and icon, looking up the key in the given bundle.
    ///
    /// ```swift
    ///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")),
    ///                        LocalizedStringKey("like_chip"),
    ///                        bundle: Bundle.module) {}
    /// ```
    ///
    /// - Parameters:
    ///    - image: An ``MISOImage`` encapsulating the asset and its rendering mode. Its accessibility label will be ignored.
    ///    - key: A `LocalizedStringKey` used to look up the text in the given bundle
    ///    - tableName: The name of the `.strings` file, or `nil` for the default
    ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///    - action: The action to perform when the user triggers the chip
    public init(image: MISOImage,
                _ key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                action: @escaping () -> Void)
    {
        let resolvedText = key.resolved(tableName: tableName, bundle: bundle)
        self.init(image: image, text: resolvedText, action: action)
    }

    // MARK: - Initializers — icon + String text (canonical)

    /// Creates a chip with text and icon.
    ///
    /// ```swift
    ///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")), text: "Heart") {}
    /// ```
    ///
    /// No accessibility hint is defined for this component.
    /// **Do not forget to define your own accessibility hint depending to what you want to do for the user when a tap is made.**
    ///
    /// - Parameters:
    ///    - image: An ``MISOImage`` encapsulating the asset and its rendering mode. Its accessibility label will be ignored.
    ///    - text: The text to display in the chip, should not be empty
    ///    - action: The action to perform when the user triggers the chip
    public init(image: MISOImage, text: String, action: @escaping () -> Void) {
        if text.isEmpty {
            OL.warning("The MISOSuggestionChip should not have an empty text! Prefer instead MISOSuggestionChip(icon:accessibilityLabel:action).")
        }
        layout = .textAndIcon(text: text, icon: image, iconPosition: .leading)
        self.action = action
    }

    // MARK: - Initializers — icon + LocalizedStringKey accessibilityLabel

    /// Creates a chip with an icon only and a localized accessibility label.
    ///
    /// ```swift
    ///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")),
    ///                        accessibilityLabel: LocalizedStringKey("like_chip"),
    ///                        bundle: Bundle.module) {}
    /// ```
    ///
    /// - Parameters:
    ///    - image: An ``MISOImage`` encapsulating the asset and its rendering mode. Its accessibility label will be ignored.
    ///    - key: The text to vocalize with Voice Over, as a `LocalizedStringKey` for the given `Bundle`
    ///    - tableName: The name of the `.strings` file, or `nil` for the default
    ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///    - action: The action to perform when the user triggers the chip
    public init(image: MISOImage,
                accessibilityLabel key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                action: @escaping () -> Void)
    {
        let resolvedText = key.resolved(tableName: tableName, bundle: bundle)
        self.init(image: image, accessibilityLabel: resolvedText, action: action)
    }

    // MARK: - Initializers — icon + String accessibilityLabel (canonical)

    /// Creates a chip with an icon only.
    ///
    /// ```swift
    ///     MISOSuggestionChip(image: MISOImage(asset: Image("ic_heart")), accessibilityLabel: "Heart") {}
    /// ```
    ///
    /// - Parameters:
    ///    - image: An ``MISOImage`` encapsulating the asset and its rendering mode. Its accessibility label will be ignored.
    ///    - accessibilityLabel: The text to vocalize with Voice Over describing the chip action, should not be empty
    ///    - action: The action to perform when the user triggers the chip
    public init(image: MISOImage, accessibilityLabel: String, action: @escaping () -> Void) {
        if accessibilityLabel.isEmpty {
            OL.warning("The MISOSuggestionChip should not have an empty accessibility label, think about your disabled users!")
        }
        layout = .icon(image, accessibilityLabel)
        self.action = action
    }

    // MARK: - Initializers — text only

    /// Creates a chip with a localized text only, looking up the key in the given bundle.
    ///
    /// ```swift
    ///     MISOSuggestionChip(LocalizedStringKey("category_chip"), bundle: Bundle.module) {}
    /// ```
    ///
    /// - Parameters:
    ///    - key: A `LocalizedStringKey` used to look up the text in the given bundle
    ///    - tableName: The name of the `.strings` file, or `nil` for the default
    ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///    - action: The action to perform when the user triggers the chip
    public init(_ key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                action: @escaping () -> Void)
    {
        let resolvedText = key.resolved(tableName: tableName, bundle: bundle)
        self.init(text: resolvedText, action: action)
    }

    /// Creates a chip with a text only.
    ///
    /// ```swift
    ///     MISOSuggestionChip(text: "Heart") {}
    /// ```
    ///
    /// - Parameters:
    ///    - text: The text of the button to display, must not be empty
    ///    - action: The action to perform when the user triggers the chip
    public init(text: String, action: @escaping () -> Void) {
        if text.isEmpty {
            OL.fatal("The MISOSuggestionChip must not have an empty text!")
        }
        layout = .text(text)
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        MISOInteractionButton(action: action) {
            Chip(layout: layout, selected: false, interactionState: MISOChipInteractionState(with: $0))
                .accessibilityHidden(true)
        }
        .accessibilityLabel(accessibilityLabel)
    }

    private var accessibilityLabel: String {
        switch layout {
        case let .text(text), let .textAndIcon(text, _, _), let .icon(_, text):
            text
        }
    }
}
