// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

/// An icon element that can be used at the leading or trailing position of a list item
/// such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// ``MISOListItemIcon`` displays a status icon (info, warning, positive, negative) with a predefined asset,
/// or a custom neutral icon from a provided image. Each icon type has a semantic color applied automatically
/// based on the current theme.
///
/// An optional notification badge can be attached to neutral icons to indicate additional status.
///
/// ## Status
///
/// The ``IconStatus`` enum defines the available icon variants:
/// - **`.neutral(asset:badge:)`**: A custom icon from a provided `Image` asset, rendered with the default
///   content color. An optional notification badge (small dot) can be displayed at the top-trailing corner.
/// - **`.positive`**: A predefined checkmark/confirmation icon with a positive (green) semantic color.
/// - **`.info`**: A predefined information icon with an informational (blue) semantic color.
/// - **`.warning`**: A predefined warning icon with a warning (yellow/orange) semantic color.
///   This icon uses a two-layer rendering with distinct internal and external shape colors.
/// - **`.negative`**: A predefined alert/important icon with a negative (red) semantic color.
///
/// ## Sizes
///
/// The ``Size`` enum defines the available sizes:
/// - **`.medium`**: The default size, corresponding to the theme's `controlItem.sizeAssetMedium` token.
/// - **`.large`**: The largest size, corresponding to the theme's `controlItem.sizeAssetLarge` token.
///
/// **Note:** When the icon is embedded in a list item with small size
/// (via `SwiftUI/View/misoListItemSize(_:)`), the icon is always rendered at its smallest size
/// regardless of the `size` parameter.
///
/// ## Code samples
///
/// ```swift
///     // Info icon with medium size (default)
///     MISOListItemIcon(status: .info, description: "Something new")
///
///     // Warning icon with large size
///     MISOListItemIcon(status: .warning, description: "Mobile data almost used", size: .large)
///
///     // Negative icon with medium size
///     MISOListItemIcon(status: .negative, description: "Payment failed", size: .medium)
///
///     // Custom neutral icon without badge
///     MISOListItemIcon(status: .neutral(asset: Image(decorative: "ic_heart"), descritpion: "Emails"))
///
///     // Custom neutral icon with notification badge
///     MISOListItemIcon(status: .neutral(asset: Image(decorative: "ic_heart"), description: "New emails received", badge: true))
///
///     // Usage as leading element in a list item
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Information"),
///         leading: .icon(MISOListItemIcon(status: .info, description: "", size: .medium))
///     )
///
///     // Usage as trailing element in a list item
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Warning"),
///         trailing: .icon(MISOListItemIcon(status: .warning, description: "", size: .medium))
///     )
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOListItemIcon: View {

    // MARK: Status

    /// Defines the type of icon to display.
    /// Each type determines the icon asset and its semantic foreground color.
    ///
    /// - Since: 3.0.0
    @frozen public enum IconStatus {
        /// A custom icon from a provided `Image` asset, rendered with the default content color.
        ///
        /// - Parameters:
        ///   - asset: The `Image` to display as the icon.
        ///   - badge: When `true`, a small notification badge (``MISOBadgeStandard`` with `.negative` status)
        ///     is displayed at the top-trailing corner of the icon. Defaults to `false`.
        case neutral(asset: Image, badge: Bool = false)

        /// A predefined checkmark/confirmation icon with a positive semantic color.
        case positive

        /// A predefined information icon with an informational semantic color.
        case info

        /// A predefined warning icon with a warning semantic color.
        /// This icon uses a two-layer rendering with distinct colors for the
        /// internal and external shapes of the warning symbol.
        case warning

        /// A predefined alert/important icon with a negative semantic color.
        case negative
    }

    /// Defines the available sizes for the icon.
    /// When the icon is embedded in a list item with `.small` size, this parameter is ignored
    /// and a smallest size is always used.
    ///
    /// - Since: 3.0.0
    @frozen public enum Size {
        /// The default icon size.
        case medium

        /// The largest icon size.
        case large
    }

    // MARK: Initializer

    /// Creates an icon element for use in a list item at the leading or trailing position.
    ///
    /// ```swift
    ///     MISOListItemIcon(status: .info, description: "Information")
    ///     MISOListItemIcon(status: .neutral(asset: Image(decorative: "ic_heart"), badge: true), description: "Like", size: .large)
    /// ```
    ///
    /// - Parameters:
    ///   - status: The type of icon to display. See ``IconStatus`` for available options.
    ///   - description: The description of the icon
    ///   - size: The size of the icon. Defaults to `.medium`.
    ///     **Note:** Ignored when the icon is embedded in a list item with small size
    ///     (via ``SwiftUICore/View/misoListItemSize(_:)``), where the smallest size is always applied.
    public init(status: IconStatus, description: String, size: Size = .medium) {
        self.status = status
        self.description = description
        self.size = size
    }

    // MARK: Properties

    private let status: IconStatus
    private let size: Size
    private let description: String

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    // MARK: Body

    public var body: some View {
        Group {
            switch status {
            case .warning:
                if isEnabled {
                    ZStack {
                        MISOImage(name: "Component-alert-warning-external-shape", color: theme.icon.colorContentStatusWarningExternalShape)
                        MISOImage(name: "Component-alert-warning-internal-shape", color: theme.icon.colorContentStatusWarningInternalShape)
                    }
                } else {
                    asset.foregroundColor(theme.colors.actionDisabled)
                }

            case let .neutral(asset, badge):
                ZStack(alignment: .topTrailing) {
                    asset
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(foregroundColor)
                    if badge {
                        MISOBadgeStandard(accessibilityLabel: "", status: .negative, size: badgeSize)
                            .border(style: theme.borders.styleDefault,
                                    width: theme.borders.widthThin,
                                    radius: theme.borders.radiusPill,
                                    color: theme.listItem.colorBgBadgeSafetyArea)
                    }
                }

            default:
                asset.foregroundColor(foregroundColor)
            }
        }
        .frame(width: assetSize, height: assetSize)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(description)
        .accessibilityHidden(description.isEmpty)
    }

    // MARK: Private Helpers

    private var asset: Image {
        let assetName =
            switch status {
            case .neutral:
                ""
            case .positive:
                "Component-alert-tick-confirmation-fill"
            case .info:
                "Component-alert-info-fill"
            case .warning:
                "Component-alert-warning-external-shape"
            case .negative:
                "Component-alert-important-fill"
            }

        return Image(decorative: assetName, bundle: theme.resourcesBundle)
            .resizable()
            .renderingMode(.template)
    }

    private var foregroundColor: MultipleColorSemanticToken {
        if isEnabled {
            switch status {
            case .neutral:
                theme.colors.contentDefault
            case .positive:
                theme.colors.contentStatusPositive
            case .info:
                theme.colors.contentStatusInfo
            case .warning:
                theme.colors.contentStatusWarning
            case .negative:
                theme.colors.contentStatusNegative
            }
        } else {
            theme.colors.actionDisabled
        }
    }

    private var assetSize: SizeSemanticToken {
        let rawSize = switch itemSize {
        case .default:
            switch size {
            case .medium:
                theme.listItem.sizeAssetMedium
            case .large:
                theme.listItem.sizeAssetLarge
            }
        case .small:
            theme.listItem.sizeAssetSmall
        }

        return rawSize * dynamicTypeSize.percentageRate / 100
    }

    private var badgeSize: MISOBadgeStandard.Size {
        if itemSize == .small {
            .extraSmall
        } else {
            switch size {
            case .medium:
                .extraSmall
            case .large:
                .small
            }
        }
    }
}
