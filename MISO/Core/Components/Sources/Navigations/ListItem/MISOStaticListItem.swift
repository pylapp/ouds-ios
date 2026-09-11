// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// A list item component used to display a row of static (non-interactive, non-navigable) content within a list.
///
/// ``MISOStaticListItem`` typically contains a label, and optionally a description, an overline, an extra label,
/// a text slot, a bottom slot, and a helper text — all provided through ``MISOListItemData``.
/// It can also include an optional leading element (such as an icon, image, avatar, flag or custom view)
/// and an optional trailing element (such as a text, badge, tag, icon, image, avatar, flag or custom view).
///
/// Use this component when the list item should only display information without triggering any navigation or action.
/// For navigable list items, see ``MISONavigationListItem``.
///
/// ## Code samples
///
/// ```swift
///     // Simple list item with a label only
///     MISOStaticListItem(data: MISOListItemData(label: "Label"))
///
///     // List item with more textual content
///     let data = MISOListItemData(
///         label: "Label",
///         description: "Description",
///         overline: "Overline",
///         extraLabel: "Extra Label"
///     )
///     MISOStaticListItem(data: data)
///
///     // List item with leading icon and trailing badge
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label"),
///         leading: .icon(.init(type: .info, size: .medium)),
///         trailing: .badge(.count(.init(3, accessibilityLabel: "3 notifications", status: .negative, size: .medium)))
///     )
///
///     // List item with avatar as leading and text as trailing
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Label", description: "Description"),
///         leading: .avatar(.init(type: .icon, size: .medium)),
///         trailing: .text(.label("Info"))
///     )
///
///     // List item with a custom view as trailing, e.g. a gauge showing a remaining SMS credit
///     MISOStaticListItem(
///         data: MISOListItemData(label: "SMS credit"),
///         trailing: .custom {
///             MISOCircularProgressIndicator(progress: 0.75)
///         }
///     )
///
///     // List item with slot (displayed under texts, before helper text)
///     MISOStaticListItem(
///         data: MISOListItemData(
///             label: "Label",
///             textSlot: { Text("Additional content") },
///             helperText: "Helper text"
///         )
///     )
///
///     // List item with bottomSlot (displayed under main content, before helper text)
///     MISOStaticListItem(
///         data: MISOListItemData(
///             label: "Label",
///             bottomSlot: { Text("Bottom content") },
///             helperText: "Helper text"
///         )
///     )
/// ```
///
/// ## Leading elements
///
///  The leading position (before the texts) accepts one optional element via ``MISOListItemLeading``:
///  - `.icon(MISOListItemIcon)`: A status or custom icon (neutral, info, warning, negative, positive)
///  - `.image(MISOListItemImage)`: A static image asset
///  - `.flag(MISOListItemFlag)`: A country flag image
///  - `.avatar(MISOListItemAvatar)`: An avatar with icon, initials, or image
///  - `.slot { ... }`: Any custom SwiftUI view
///
/// ## Trailing elements
///
/// The trailing position (after the texts) accepts one optional element via ``MISOListItemTrailing``, like:
/// - `.text(.label(String))`: A default-styled label
/// - `.text(.labelMuted(String))`: A muted (secondary) label
/// - `.text(.labelStrong(String))`: An emphasized (bold) label
/// - `.text(.labelAndExtraLabel(String, String))`: A label with an additional extra label below
/// - `.badge(.count(MISOBadgeCount))`: A badge with count
/// - `.badge(.standard(MISOBadgeStandard))`: A badge with standard status
/// - `.tag(MISOTag)`: A tag for categorization
/// - `.icon(MISOListItemIcon)`: A status or custom icon
/// - `.image(MISOListItemImage)`:  A static image asset
/// - `.flag(MISOListItemFlag)`: A country flag image
/// - `.avatar(MISOListItemAvatar)`: An avatar with icon, initials, or image
/// - `.slot { ... }`: Any custom SwiftUI view
///
/// ## View modifiers
///
/// Several view modifiers can be applied to customize the appearance and layout of list items:
///
/// - ``SwiftUICore/View/misoListItemSize(_:)`` — Sets the size of the item (`.standard` or `.small`).
/// - ``SwiftUICore/View/misoListItemContainerAlignment(_:)`` — Aligns leading, trailing, and text containers (`.top` or `.center`).
/// - ``SwiftUICore/View/misoListItemStyle(divider:background:)`` — Applies a item style with optional divider and background.
/// - ``SwiftUICore/View/misoListCardStyle(_:)`` — Applies a card style on list items.
/// - ``SwiftUICore/View/misoListItemRoundedMedia(_:)`` — Defines whether media (images) should be displayed with rounded corners.
///
/// ```swift
///     MISOStaticListItem(data: MISOListItemData(label: "Label"))
///         .misoListItemSize(.small)
///         .misoListItemContainerAlignment(.top)
///         .misoListCardStyle(.outlined())
/// ```
///
/// ## Accessibility considerations
///
/// You should test with Voice Over your `MISOStaticListItem` to check which parts are vocalized and if they are well vocalized, specially for
/// the avatars, badges, tags and slot views.  Do not vocalize decorative elements.
///
/// If flags are used, do not suppose users know the flags and add in the texts parts of the `MISOStaticListItem` the country or region name.
///
/// - Version: 1.0.0 (Figma component design version)
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOStaticListItem: View {

    // MARK: - Properties

    private let data: MISOListItemData
    private let leading: MISOListItemLeading?
    private let trailing: MISOListItemTrailing?

    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Initializers

    /// Creates a list item to display static data, without interaction or navigation.
    ///
    /// - Parameters:
    ///    - data: The textual data of the item, including label, description, overline, extra label, slot, bottomSlot, and helper text.
    ///    - leading: An optional element displayed at the leading position (before the texts).
    ///     See ``MISOListItemLeading`` for available options (icon, image, flag, avatar, custom).
    ///    - trailing: An optional element displayed at the trailing position (after the texts).
    ///     See ``MISOListItemTrailing`` for available options (text, badge, tag, icon, image, flag, avatar, custom).
    ///
    /// - Note: Leading, trailing, and text containers can be aligned using the
    ///   ``SwiftUICore/View/misoListItemContainerAlignment(_:)`` view modifier.
    public init(data: MISOListItemData,
                leading: MISOListItemLeading? = nil,
                trailing: MISOListItemTrailing? = nil)
    {
        self.data = data
        self.leading = leading
        self.trailing = trailing
    }

    // MARK: - Body

    public var body: some View {
        ListItemContent(data: data,
                        indicatorType: nil,
                        leading: leading,
                        trailing: trailing,
                        interactionState: isEnabled ? .enabled : .disabled)
    }
}
