// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI

/// Badge is a UI element that emphasizes system notifications, status, or the categorization of an information, throughout colour only.
/// Badge is rendered as a coloured shape, without icon, text or number; and its chosen size remains unchanged regardless of the changes of the interface size.
/// ``MISOBadgeIcon`` displays an image.
///
/// ## Code samples
///
/// ```swift
///     // Info badge in medium size (default size) with default icon information
///     MISOBadgeIcon(status: .info, accessibilityLabel: "Like", size: .medium)
///
///     // Badge with neutral status with a custom decorative icon
///     MISOBadgeIcon(status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"), accessibilityLabel: "Like"), size: .medium)
///
///     // If your layout is in RTL mode but your badge has an icon with another meaning because of bad orientation,
///     // you can flip the icon
///     MISOBadgeIcon(status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"), flipped: true, accessibilityLabel: "Like"), size: .medium)
/// ```
///
/// ## Accessibility considerations
///
/// ### Sizes
///
/// Users may need to increase their text sizes. However by design their is no tokens for such cases.
/// Thus, if large text is used, a factor is applied on the largest token value based on the size percentage rate.
/// Thus it will make users able to have bigger badges.
///
/// ### Vocalizations
///
/// A badge needs an accessibility label to decribe the meaning that will be vocalized.
///
/// - Version: 1.3.0 Figma component design version)
/// - Since: 2.2.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOBadgeIcon: View {

    // MARK: - Properties

    private let accessibilityLabel: String
    private let configuration: BadgeIconConfiguration

    // MARK: - Configurations

    /// The status depends on the context of the information it represents.
    /// - Since: 2.2.0
    @frozen public enum Status {

        /// Used for general labels without specific emphasis.
        ///
        /// - Parameter image: The `MISOImage` to display in the badge
        case neutral(image: MISOImage)

        /// Employed to highlight discovery or exploration-related content
        ///
        /// - Parameter image: The `MISOImage` to display in the badge
        case accent(image: MISOImage)

        /// Indicates success, completion, or approval
        case positive

        /// Provides informational context without urgency
        case info

        /// Notifies the user to potential risks or cautionary messages
        case warning

        /// Draws attention to important or critical information.
        /// Often used for errors, restrictions, or urgent messages, but not exclusively for failures.
        case negative
    }

    // MARK: - Initializers

    /// Creates a badge which displays an icon to visually reinforce meaning.
    /// It is used for status indicators (e.g., "New", "Pending", "Success").
    /// The background color of the badge and the icon color are based on the given `status`.
    ///
    /// Use the `View/disabled(_:)` method to have badge in disabled state.
    ///
    /// ```swift
    ///     MISOBadgeIcon(status: .info, accessibilityLabel: "Information", size: .medium, size: .large)
    /// ```
    ///
    /// - Parameters:
    ///    - status: The status of this badge with icon (for all status, a default icon is displayed except for **accent**
    ///    and **neutral** status whrere a decorative icon is required)
    ///    - accessibilityLabel: The accessibility label the badge should have, describing the icon or brining meanings
    ///    - size: The size of this badge, default set to *medium*
    public init(status: MISOBadgeIcon.Status,
                accessibilityLabel: String,
                size: MISOBadgeStandard.Size = .medium)
    {
        self.init(size: size, status: status, accessibilityLabel: accessibilityLabel)
    }

    /// Creates a badge which displays an icon to visually reinforce meaning.
    /// It is used for status indicators (e.g., "New", "Pending", "Success").
    /// The background color of the badge and the icon color are based on the given `status`.
    ///
    /// Use the `View/disabled(_:)` method to have badge in disabled state.
    ///
    /// ```swift
    ///     MISOBadgeIcon(status: .info, accessibilityLabel: LocalizedStringKey("info_badge"), bundle: Bundle.module, size: .large)
    /// ```
    ///
    /// - Parameters:
    ///    - status: The status of this badge with icon (for all status, a default icon is displayed except for **accent**
    ///    and **neutral** status whrere a decorative icon is required)
    ///    - key: The text to vocalize with *Voice Over* the component must have, as as `LocalizedStringKey` for the given `Bundle`
    ///    - tableName: The name of the `.strings` file, or `nil` for the default
    ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///    - size: The size of this badge, default set to *medium*
    public init(status: MISOBadgeIcon.Status,
                accessibilityLabel key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                size: MISOBadgeStandard.Size = .medium)
    {
        let resolvedText = key.resolved(tableName: tableName, bundle: bundle)
        self.init(size: size, status: status, accessibilityLabel: resolvedText)
    }

    /// Private initializer of the badge
    ///
    /// - Parameters:
    ///    - size: The size of this badge
    ///    - status: The status of this badge with icon
    ///    - accessibilityLabel: The accessibility label the badge should have, describing the icon or brining meanings
    private init(size: MISOBadgeStandard.Size, status: MISOBadgeIcon.Status, accessibilityLabel: String) {
        if accessibilityLabel.isEmpty {
            ML.warning("The MISOBadgeIcon should not have an empty accessibility label, think about your disabled users!")
        }

        configuration = .init(size: size, status: status)
        self.accessibilityLabel = accessibilityLabel
    }

    // MARK: Body

    public var body: some View {
        HStack {
            BadgeIcon(configuration: configuration)
        }
        .modifier(BadgeModifier(configuration: configuration, accessibilityLabel: accessibilityLabel))
    }
}
