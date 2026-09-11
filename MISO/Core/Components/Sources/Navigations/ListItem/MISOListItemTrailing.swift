// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// Defines the elements that can be displayed at the trailing position (after the texts)
/// of a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// The trailing element provides supplementary information, actions, or visual indicators
/// alongside the textual content of the list item. Only one trailing element can be set at a time.
///
/// ## Available options
///
/// - `text(_:)`: A textual element with various styles (see ``TextType``).
/// - `badge(_:)`: A badge component (see ``MISOBadgeStandard`` or ``MISOBadgeCount``).
/// - `tag(_:)`: A tag component (see ``MISOTag``).
/// - `icon(_:)`: A status or custom icon (see ``MISOListItemIcon``).
/// - `image(_:)`: A static image asset (see ``MISOListItemImage``).
/// - `flag(_:)`: A country flag image (see ``MISOListItemFlag``).
/// - `avatar(_:)`:  An avatar with icon, initials, or image (see ``MISOListItemAvatar``).
/// - `slot(_:)`: Any custom SwiftUI view, e.g. any bespoke view.
///
/// ## Code samples
///
/// ```swift
///     // Trailing with a default label text
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         trailing: .text(.label("Info"))
///     )
///
///     // Trailing with a muted label
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         trailing: .text(.labelMuted("Secondary"))
///     )
///
///     // Trailing with label and extra label
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         trailing: .text(.labelAndExtraLabel("Label", "Extra"))
///     )
///
///     // Trailing with a badge according to type
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Notifications"),
///         trailing: .badge(.count(.init(3, accessibilityLabel: "3 notifications", status: .negative, size: .medium)))
///     )
///
///     // Trailing with a tag
///     let tag = MISOTag(label: "New", size: .small)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Feature"),
///         trailing: .tag(tag)
///     )
///
///     // Trailing with an icon
///     let icon = MISOListItemIcon(type: .info, size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         trailing: .icon(icon)
///     )
///
///     // Trailing with an image
///     let image = MISOListItemImage(asset: Image("il_placeholder"), size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         trailing: .image(image)
///     )
///
///     // Trailing with a country flag
///     MISOStaticListItem(
///         data: MISOListItemData(label: "France"),
///         trailing: .flag(.init(asset: Image("il_flag_fr"), description: "France"))
///     )
///
///     // Trailing with an avatar
///     let avatar = MISOListItemAvatar(type: .initials("AB"), size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Contact"),
///         trailing: .avatar(avatar)
///     )
///
///     // Trailing with a custom view, e.g. a gauge showing a remaining SMS credit
///     MISOStaticListItem(
///         data: MISOListItemData(label: "SMS credit"),
///         trailing: .custom {
///             MISOCircularProgressIndicator(progress: 0.75)
///         }
///     )
/// ```
///
/// ## Media appearance
///
/// Images can be displayed with rounded corners using the
/// ``SwiftUICore/View/misoListItemRoundedMedia(_:)`` view modifier.
///
/// ## Small size behavior
///
/// When the list item is displayed in small size (via ``SwiftUICore/View/misoListItemSize(_:)``):
/// - Trailing elements such as avatars and icons are rendered in their smallest available size.
/// - The extra label in ``TextType/labelAndExtraLabel(_:_:)`` is **ignored**.
/// - The `.slot` element is not resized automatically and is **not displayed**.
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
@frozen public enum MISOListItemTrailing {

    // MARK: - Text Type

    /// Defines the type of trailing text displayed in the list item.
    ///
    /// Each variant controls the visual style and content of the text shown at the trailing position.
    ///
    /// - Since: 3.0.0
    @frozen public enum TextType {
        /// A default-styled label.
        case label(String)

        /// A muted (less prominent) label, typically displayed in a secondary color.
        case labelMuted(String)

        /// A strong (emphasized) label, typically displayed with a bold or prominent style.
        case labelStrong(String)

        /// A default label paired with an additional extra label displayed below it.
        ///
        /// **Note:** For small size of the list item (via ``SwiftUICore/View/misoListItemSize(_:)``),
        /// the extra label is **ignored** and only the primary label is shown.
        case labelAndExtraLabel(String, String)
    }

    // MARK: - Badge Type

    /// The type of badge displayed.
    ///
    /// - Since: 3.0.0
    @frozen public enum BadgeType {
        /// A standard badge
        case standard(MISOBadgeStandard)

        /// A badge with count
        case count(MISOBadgeCount)
    }

    // MARK: - Values

    /// A textual element with configurable style.
    ///
    /// See ``TextType`` for available styles: `.label`, `.labelMuted`, `.labelStrong`,
    /// and `.labelAndExtraLabel`.
    case text(TextType)

    /// A badge component providing status or count information.
    ///
    /// See ``MISOBadgeStandard``  or ``MISOBadgeCount``for available configurations.
    case badge(BadgeType)

    /// A tag component providing categorization or status information.
    ///
    /// See ``MISOTag`` for available configurations.
    case tag(MISOTag)

    /// A status or custom icon.
    ///
    /// See ``MISOListItemIcon`` for available icon types (`.neutral`, `.info`, `.warning`, `.negative`, `.positive`)
    /// and sizes (`.small`, `.medium`, `.large`).
    case icon(MISOListItemIcon)

    /// A static image asset displayed at the leading position.
    ///
    /// The image is displayed as-is. Use ``SwiftUICore/View/misoListItemRoundedMedia(_:)``
    /// to apply rounded corners. Do not forget to add an accessibility label if the image is not decorative.
    ///
    /// ```swift
    ///     // Decorative image
    ///     .image(.init(asset: Image(decorative: "il_placeholder")))
    ///
    ///     // Not decorative image
    ///     .image(.init(asset: Image("meaningful_image"), description: "A nice landscape"))
    /// ```
    case image(MISOListItemImage)

    /// A country flag image.
    case flag(MISOListItemFlag)

    /// An avatar with icon, initials, or image.
    ///
    /// See ``MISOListItemAvatar`` for available types (`.icon`, `.image`, `.initials`)
    /// and sizes (`.medium`, `.large`, `.extraLarge`).
    /// An optional Badge can be attached to the avatar.
    case avatar(MISOListItemAvatar)

    /// A custom SwiftUI view displayed at the trailing position.
    ///
    /// Use this case to display any bespoke content that is not covered by the other options.
    ///
    /// The custom view is responsible for its own accessibility: unlike `.flag` and `.avatar`,
    /// it is **not** automatically hidden from assistive technologies.
    ///
    /// **Note:** Not displayed when the list item is in small size (via ``SwiftUICore/View/misoListItemSize(_:)``),
    /// since its layout cannot be adapted automatically to the reduced space.
    case slot(AnyView)

    /// Creates a ``slot(_:)`` trailing element from a `@ViewBuilder` closure.
    ///
    /// ```swift
    ///     MISOStaticListItem(
    ///         data: MISOListItemData(label: "SMS credit"),
    ///         trailing: .slot {
    ///             MISOCircularProgressIndicator(progress: 0.75)
    ///         }
    ///     )
    /// ```
    ///
    /// - Parameter content: A view builder returning the custom view to display.
    public static func slot(@ViewBuilder _ content: () -> some View) -> Self {
        .slot(AnyView(content()))
    }
}
