// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOTokensSemantic
import SwiftUI

/// Inline alert is a lightweight UI element, placed in the content flow, that displays information, system feedback,
/// status changes throughout short, prominent, persistent and non actionable communication. Inline alert includes functional
/// icon and semantic colour, and does not include a close button and/or action link. Inline alert does not disappear and remains visible.
///
/// ## Code samples
///
/// ```swift
///     // A inline alert with a label and the default neutral status
///     MISOInlineAlert(label: "Label")
///     // From a localizable in a bundle
///     MISOInlineAlert(LocalizedStringKey("label_wording"), bundle: Bundle.module)
///
///     // An inline alert
///     MISOInlineAlert(label: "Warning", status: .warning)
///
///     // Add a custom icon for accent and neutral status
///     MISOInlineAlert(label: "Label", status: .accent(image: MISOImage(asset: Image("ic_heart"))))
///     MISOInlineAlert(label: "Label", status: .neutral(image: MISOImage(asset: Image("ic_heart"))))
/// ```
///
/// - Version: 1.1.1 (Figma component design version)
/// - Since: 1.3.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOInlineAlert: View {

    // MARK: Stored properties

    private let text: String
    private let status: MISOAlertStatus

    @Environment(\.theme) private var theme

    // MARK: - Initializer

    /// Creates a inline alert.
    ///
    /// Use the `View/disabled(_:)` method to have component in disabled state.
    ///
    /// ```swift
    ///     MISOInlineAlert(label: "Your session will expire soon.", status: .warning)
    /// ```
    ///
    /// - Parameters:
    ///   - label: Label displayed in the inline alert. Main message that should be short, clear, and readable at a glance.
    ///   - status: The status of the inline alert. Its text and its icon color are based on this status. Default set to *neutral* without icon.
    public init(label: String, status: MISOAlertStatus = .neutral()) {
        text = label
        if text.isEmpty {
            OL.warning("The label for the MISOInlineAlert must not be empty!")
        }
        self.status = status
    }

    /// Creates an inline alert with a localized label, looking up the key in the given bundle.
    ///
    /// ```swift
    ///     MISOInlineAlert(LocalizedStringKey("info_message"), bundle: Bundle.module, status: .info)
    /// ```
    ///
    /// - Parameters:
    ///   - key: A `LocalizedStringKey` used to look up the label in the given bundle
    ///   - tableName: The name of the `.strings` file, or `nil` for the default
    ///   - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///   - status: The status of the inline alert, default set to *neutral* without icon
    public init(_ key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                status: MISOAlertStatus = .neutral())
    {
        self.init(label: key.resolved(tableName: tableName, bundle: bundle), status: status)
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .top, spacing: theme.alert.spaceColumnGap) {
            AlertLeadingIcon(status: status)
            InlineAlertLabel(text: text, status: status)
        }
    }
}
