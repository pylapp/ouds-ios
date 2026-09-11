// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import SwiftUI

// MARK: - MISO List Item Containers Alignment

/// Defines the vertical alignment of the leading, trailing, and text containers
/// within a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// Use the ``SwiftUICore/View/misoListItemContainerAlignment(_:)`` view modifier
/// to apply the alignment on list items.
///
/// ## Code sample
///
/// ```swift
///     MISOStaticListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemContainerAlignment(.top)
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
@frozen public enum MISOListItemContainersAlignment {
    /// Containers are aligned to the top of the list item row.
    /// Best suited when the list item has multiple lines of text and
    /// leading/trailing elements should stay anchored at the top.
    case top

    /// Containers are vertically centered within the list item row.
    /// This is the default alignment.
    case center
}

// MARK: - MISO List Item Content Style

/// Defines the visual style of a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// The style controls the border, divider, and background appearance of list items.
/// Use the ``SwiftUICore/View/misoListContentStyle(_:)``,
/// ``SwiftUICore/View/misoListItemStyle(divider:background:)`` or
/// ``SwiftUICore/View/misoListCardStyle(_:)`` view modifiers to apply the style on list items.
///
/// ## Cases
///
/// - **`.card(_:)`**: A card-like appearance with various sub-styles (decoration) defined by
///   ``MISOListItemContentStyle/card(_:)``. Cards can be outlined, have a background,
///   or combine these effects only on interaction.
/// - **`.item(_:)`**: A standard list item appearance with an optional background and divider,
///   defined by ``MISOListItemContentStyle/item(divider:background:)``.
///
/// ## Known limitation
///
/// The `onlyOnInteraction` flag of the `outlined` decoration of a card has no action on ``MISOStaticListItem``, because
/// the item does not propose interaction (e.g. pressed or hover state)
///
/// ## Code samples
///
/// ```swift
///     // Card style with outline only on interaction
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListCardStyle(decoration: .outlined(onInteractionOnly: true))
///
///     // Card style with an outlined border on all states
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListCardStyle(decoration: .outlined(onInteractionOnly: false))
///
///     // Card style with divider, background
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListCardStyle(decoration: .standard(divider: true, background: true))
///
///     // Card style divider and without background
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListCardStyle(decoration: .standard(divider: true, background: false))
///
///     // Item style with background and divider
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemStyle(divider: true, .background: true)
///
///     // Item style with divider and without background
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemStyle(divider: true, .background: false)
///
///     // Using global modifier
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListContentStyle(.card(.outlined))
///
///     MISONavigationListItem(data: MISOListItemData(label: "Label"))
///         .misoListContentStyle(.item(divider: true, background: false))
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
@frozen public enum MISOListItemContentStyle {

    /// Defines the decoration (sub-styles) available for the ``MISOListItemContentStyle/card(_:)`` case.
    ///
    /// - Since: 3.0.0
    public enum CardDecoration {

        /// The oulined decoration of a card. A permanent border is drawn around the card. This border can be drawn only
        /// for interaction states (e.g. pressed or hover).
        ///
        /// - Parameter onlyOnInteraction: Used only for `MISONavigationListItem` to activate oulined style when
        /// card is pressed or hovered. By default, `false` so outlined available on all states of the card.
        case outlined(onlyOnInteraction: Bool = false)

        /// The standard card decoration with background and divider.
        ///
        ///  - Parameters:
        ///     - divider: Used to display a divider at bottom of the card.
        ///     - background: Used to fill the background, `true` by default. If set to `false`, the background is filled only
        ///     on interaction states (pressed on focussed)
        case standard(divider: Bool = true, background: Bool = true)
    }

    /// The card style of the `MISONavigationListItem` and `MISOStaticListItem`. It controls how the card border,
    /// background, and divider behave, including whether these visual effects are always visible or only appear during interaction
    /// (e.g. press, hover).
    ///
    ///  - Parameters:
    ///     - decoration: The decoration of the card item.
    case card(_ decoration: CardDecoration = .standard(divider: true, background: true))

    /// The item style of the `MISONavigationListItem` and `MISOStaticListItem`. It controls how
    /// the background and divider behave for regular list items, including whether these visual effects are always visible or
    /// only appear during interaction. (e.g. press, hover).
    ///
    ///  - Parameters:
    ///     - divider: Used to display a divider at bottom of the item.
    ///     - background: Used to fill the background, `false` by default. If set to `false`, means the background is filled only
    ///     on interaction states (e.g. press, hover).
    case item(divider: Bool = true, background: Bool = false)
}

// MARK: - MISO List Item Size

/// Defines the size of a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// The size affects the padding, the visibility of certain text fields, and the size of
/// leading/trailing elements within the list item.
///
/// Use the ``SwiftUICore/View/misoListItemSize(_:)`` view modifier to apply the size on list items.
///
/// ## Code samples
///
/// ```swift
///     // Standard size (default)
///     MISOStaticListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemSize(.standard)
///
///     // Small size — overline and extraLabel are hidden,
///     // avatars and icons use their smallest variant
///     MISOStaticListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemSize(.small)
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
@frozen public enum MISOListItemSize {
    /// The default (i.e. standard) size of the list item.
    /// All text fields and elements are displayed at their normal size.
    case `default`

    /// The small (compact) size of the list item.
    ///
    /// When using this size:
    /// - Some elements are displayed in their smallest variant (avatar, icon, badge, etc.).
    /// - Some text fields are **hidden**: `overline` and `extraLabel` from ``MISOListItemData``,
    ///   and the extra label from ``MISOListItemTrailing/TextType/labelAndExtraLabel(_:_:)``.
    case small
}

// MARK: - View Modifiers

extension View {

    /// Defines the visual style of a list item such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
    ///
    /// The style controls the border, divider, and background appearance of list items.
    ///
    /// ```swift
    ///     // Set outlined card style
    ///     VStack {
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 1"))
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 2"))
    ///     }
    ///     .misoListContentStyle(.card(.outlined())
    ///
    ///     // Set item style with background and divider
    ///     VStack {
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 1"))
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 2"))
    ///     }
    ///     .misoListContentStyle(.item(divider: true, background: true))
    /// ```
    ///
    /// - Parameter style: The ``MISOListItemContentStyle``  style to apply on items.
    ///
    /// - Returns: A view with the style applied to its list items.
    public func misoListContentStyle(_ style: MISOListItemContentStyle) -> some View {
        environment(\.misoListItemContentStyle, style)
    }

    /// Applies a *card* style on list items.
    ///
    /// This is a convenience modifier that applies an ``MISOListItemContentStyle/card(_:)`` style.
    /// It is typically applied globally on a container so that all enclosed
    /// list items share the same card-like appearance.
    ///
    /// ```swift
    ///     VStack {
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 1"))
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 2"))
    ///     }
    ///     .misoListCardStyle(.outlined())
    /// ```
    ///
    /// - Parameter decoration: The ``MISOListItemContentStyle/card(_:)`` decoration (sub-style) to apply on items.
    ///   Defaults to `.standard(divider: true, background: true)`.
    ///
    /// - Returns: A view with the card style applied to its list items, default set to `.standard(divider: true, background: true)`
    public func misoListCardStyle(_ decoration: MISOListItemContentStyle.CardDecoration = .standard(divider: true, background: true)) -> some View {
        environment(\.misoListItemContentStyle, .card(decoration))
    }

    /// Applies a *item* style on list items.
    ///
    /// This is a convenience modifier that applies an ``MISOListItemContentStyle/item(divider:background:)`` style.
    /// It is typically applied globally on a container (e.g. a `List`, `VStack`, or `ForEach`)
    /// so that all enclosed list items share the same appearance.
    ///
    /// ```swift
    ///     VStack {
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 1"))
    ///         MISOStaticListItem(data: MISOListItemData(label: "Item 2"))
    ///     }
    ///     .misoListItemStyle(divider: true, background: true)
    /// ```
    ///
    /// - Parameters:
    ///   - divider: Used to display a divider at bottom of the card.
    ///   - background: Used to fill the background, `true` by default. If set to `false`, the background is filled only
    ///     on interaction states (pressed on focussed)
    ///
    /// - Returns: A view with the item style applied to its list items, default set to `.item(divider: true, background: false)`
    public func misoListItemStyle(divider: Bool = true, background: Bool = false) -> some View {
        environment(\.misoListItemContentStyle, .item(divider: divider, background: background))
    }

    /// Defines whether media elements (images) in list items should be displayed
    /// with rounded corners.
    ///
    /// This modifier applies to both leading and trailing media elements
    /// (``MISOListItemLeading/image(_:)``, ``MISOListItemTrailing/image(_:)``).
    ///
    /// ```swift
    ///     MISOStaticListItem(
    ///         data: MISOListItemData(label: "Label"),
    ///         leading: .image(.init(asset: Image("il_placeholder"), size: .medium))
    ///     )
    ///     .misoListItemRoundedMedia(true)
    /// ```
    ///
    /// - Parameter rounded: When `true`, media elements are displayed with rounded corners.
    ///   When `false` (default), media elements are displayed with square corners.
    ///
    /// - Returns: A view with the rounded media setting applied to its list items, default set to *false*
    public func misoListItemRoundedMedia(_ rounded: Bool = false) -> some View {
        environment(\.misoListItemRoundedMedia, rounded)
    }

    /// Sets the vertical alignment of leading, trailing, and text containers within list items.
    ///
    /// This modifier is typically applied globally on a container so that all enclosed
    /// list items share the same alignment.
    ///
    /// ```swift
    ///     VStack {
    ///         MISOStaticListItem(
    ///             data: MISOListItemData(label: "Label", description: "Description"),
    ///             leading: .icon(MISOListItemIcon(type: .info, size: .medium)),
    ///             trailing: .text(.label(Text("Info")))
    ///         )
    ///     }
    ///     .misoListItemContainerAlignment(.top)
    /// ```
    ///
    /// - Parameter alignment: The ``MISOListItemContainersAlignment`` to apply.
    ///   Use `.center` (default) to vertically center all containers, or `.top` to align them
    ///   to the top of the row.
    ///
    /// - Returns: A view with the specified containers alignment applied to its list items.
    public func misoListItemContainerAlignment(_ alignment: MISOListItemContainersAlignment = .center) -> some View {
        environment(\.misoListItemContainersAlignment, alignment)
    }

    /// Sets the size of list items.
    ///
    /// This modifier affects the padding, the visibility of certain text fields
    /// (`overline` and `extraLabel` are hidden in `.small`), and the size of
    /// leading/trailing elements (avatars, icons, badges use their smallest variant in `.small`).
    ///
    /// ```swift
    ///     VStack {
    ///         MISOStaticListItem(data: MISOListItemData(label: "Compact item"))
    ///         MISOStaticListItem(data: MISOListItemData(label: "Another compact item"))
    ///     }
    ///     .misoListItemSize(.small)
    /// ```
    ///
    /// - Parameter size: The ``MISOListItemSize`` to apply.
    ///   Use `.standard` (default) for normal sizing, or `.small` for a compact layout.
    ///
    /// - Returns: A view with the specified size applied to its list items.
    public func misoListItemSize(_ size: MISOListItemSize) -> some View {
        environment(\.misoListItemSize, size)
    }
}

// MARK: - Environment Values

extension EnvironmentValues {

    /// The current vertical alignment of leading, trailing, and text containers in list items.
    ///
    /// Defaults to ``MISOListItemContainersAlignment/center``.
    /// Set via ``SwiftUICore/View/misoListItemContainerAlignment(_:)``.
    @Entry var misoListItemContainersAlignment: MISOListItemContainersAlignment = .center

    /// The current content style of list items.
    ///
    /// Defaults to `.item(divider: true, background: false)`.
    /// Set via ``SwiftUICore/View/misoListItemStyle(divider:background:)`` or
    /// ``SwiftUICore/View/misoListCardStyle(_:)``.
    @Entry var misoListItemContentStyle: MISOListItemContentStyle = .item(divider: true, background: false)

    /// Whether media elements (images) in list items should be displayed with rounded corners.
    ///
    /// Defaults to `false` (square corners).
    /// Set via ``SwiftUICore/View/misoListItemRoundedMedia(_:)``.
    @Entry var misoListItemRoundedMedia: Bool = false

    /// The current size of list items.
    ///
    /// Defaults to ``MISOListItemSize/standard``.
    /// Set via ``SwiftUICore/View/misoListItemSize(_:)``.
    @Entry var misoListItemSize: MISOListItemSize = .default
}
