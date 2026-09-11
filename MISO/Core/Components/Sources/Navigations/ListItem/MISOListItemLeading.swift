// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// Defines the elements that can be displayed at the leading position (before the texts)
/// of a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// The leading element provides visual context or identification alongside the textual content
/// of the list item. Only one leading element can be set at a time.
///
/// **Note:** When using ``MISONavigationListItem`` with an indicator type of `.previous`,
/// the leading element is automatically hidden.
///
/// ## Available options
///
/// -  `icon`: A status or custom icon (see ``MISOListItemIcon``).
/// - `image`: A static image asset (see ``MISOListItemImage``).
/// - `flag`: A country flag image (see ``MISOListItemFlag``).
/// - `avatar`: An avatar with icon, initials, or image (see ``MISOListItemAvatar``).
/// - `slot`: Any custom SwiftUI view, e.g. any bespoke view.
///
/// ## Code samples
///
/// ```swift
///     // Leading with a status icon
///     let icon = MISOListItemIcon(type: .info, size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         leading: .icon(icon)
///     )
///
///     // Leading with an image
///     let image = MISOListItemImage(asset: Image("il_placeholder"), size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         leading: .image(image)
///     )
///
///     // Leading with a country flag
///     MISOStaticListItem(
///         data: MISOListItemData(label: "France"),
///         leading: .flag(.init(asset: Image("il_flag_fr"), description: "France"))
///     )
///
///     // Leading with an avatar
///     let avatar = MISOListItemAvatar(type: .icon, size: .medium)
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Profile"),
///         leading: .avatar(avatar)
///     )
///
///     // Leading with a custom view, e.g. a gauge showing a remaining SMS credit
///     MISOStaticListItem(
///         data: MISOListItemData(label: "SMS credit"),
///         leading: .slot {
///             MISOCircularProgressIndicator(progress: 0.75)
///         }
///     )
/// ```
///
/// ## Media appearance
///
/// Images can be displayed with rounded corners using the  ``SwiftUICore/View/misoListItemRoundedMedia(_:)`` view modifier.
///
/// ## Small size behavior
///
/// When the list item is displayed in small size (via ``SwiftUICore/View/misoListItemSize(_:)``), leading elements such as avatars and icons
/// are rendered in their smallest available size. The `.slot` element is not resized automatically and is **not displayed** in small size.
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
@frozen public enum MISOListItemLeading {
    /// A status or custom icon displayed at the leading position.
    ///
    /// See ``MISOListItemIcon`` for available icon types (`.neutral`, `.info`, `.warning`, `.negative`, `.positive`)
    /// and sizes (`.medium`, `.large`).
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
    ///
    ///     // Decorative image in large size
    ///     .image(.init(asset: Image(decorative: "il_placeholder"), size .large))
    /// ```
    case image(MISOListItemImage)

    /// A country flag image displayed at the leading position.
    case flag(MISOListItemFlag)

    /// An avatar displayed at the leading position.
    ///
    /// See ``MISOListItemAvatar`` for available types (`.icon`, `.image`, `.initials`)
    /// and sizes (`.medium`, `.large`, `.extraLarge`).
    /// An optional ``MISOBadgeStandard`` can be attached to the avatar.
    case avatar(MISOListItemAvatar)

    /// A custom SwiftUI view displayed at the leading position.
    ///
    /// Use this case to display any bespoke content that is not covered by the other options.
    ///
    /// The custom view is responsible for its own accessibility: unlike `.flag` and `.avatar`,
    /// it is **not** automatically hidden from assistive technologies.
    ///
    /// **Note:** Not displayed when the list item is in small size (via ``SwiftUICore/View/misoListItemSize(_:)``),
    /// since its layout cannot be adapted automatically to the reduced space.
    case slot(AnyView)

    /// Creates a ``slot(_:)`` leading element from a `@ViewBuilder` closure.
    ///
    /// ```swift
    ///     MISOStaticListItem(
    ///         data: MISOListItemData(label: "SMS credit"),
    ///         leading: .slot {
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
