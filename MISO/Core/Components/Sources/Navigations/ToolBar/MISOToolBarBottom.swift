// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOThemesContract
import SwiftUI

// MARK: - MISO Toolbar Bottom View Modifier

/// The bottom toolbar is a kind of navigation bar component used to display leading and trailing actions
/// at the bottom of the screen when supported.
///
/// `toolBarBottom` View helper applies a SwiftUI toolbar configuration.
///
/// ## Platform considerations
///
/// - Available on iOS, iPadOS, and visionOS
/// - Not available on watchOS, tvOS and macOS
///
/// ## Guidelines
///
/// - Test the use of the `toolBarBottom` for both iOS with Liquid Glass and not Liquid Glass
/// - If you use both an  ``MISOTabBar`` with the `toolBarBottom`, the toolbar will be above the tabbar for iOS lower than 26, **not recommended**
/// - If you use both an  ``MISOTabBar`` with the `toolBarBottom`, the toolbar will be **behind** the tabbar for iOS 26+, so not usable, **not recommended**
/// - Avoid use of both `toolBarBottom` and ``MISOTabBar`` in the same page
///
/// ## Badges uses
///
/// Because the system does not render system badge for items in bottom toolbar, the OUDS badge component is used for iOS 26 with Liquid Glass and bottom toolbars.
/// However the glassified effect of Liquid Glass does not make sometimes the badge readable, that is the reason why you should use badge for bottom toolbars with lots of care
/// and prefer *prominent* or *tinted* styles for the item with the badge instead of *default*.
///
/// For iOS until 18 and without Liquid Glass the OUDS badge components are always used.
///
/// ## Code samples
///
/// Define leading and trailing items for the bottom toolbar
/// ```swift
///     SomeView()
///         .toolBarBottom(leadingItems: {
///                 MISOToolBarItem(label: "Some label") { /* Action to process */ }
///             }, trailingItems: {
///                 MISOToolBarItem(icon: Image(decorative: "some_image"), accessibilityLabel: "Label") { /* Action to process */ }
///         })
/// ```
///
/// - Since: 1.4.0
@available(iOS 15, visionOS 1, *)
public struct MISOToolBarBottom: ViewModifier {
    // NOTE: As Swift DocC cannot build rich documention for methods, this struct does not the job

    // MARK: Properties

    /// The items to display in leading position
    @MISOToolBarItemsBuilder private let leadingItems: () -> [MISOToolBarItem]
    /// The items to display in trailing position
    @MISOToolBarItemsBuilder private let trailingItems: () -> [MISOToolBarItem]
    /// The items to display in one group
    @MISOToolBarItemsBuilder private let groupedItems: () -> [MISOToolBarItem]
    /// Internal flag to know witch API to use to place items
    private let useGroupedItems: Bool

    // MARK: Initializer

    /// `ViewModifier` to define an OUDS bottom toolbar.
    ///
    ///  You should prefer `toolBarBottom(leadingItems:trailingItems:)`.
    ///
    /// ```swift
    ///     MISOToolBarBottom {
    ///         MISOToolBarItem(label: "Edit") { }
    ///     } trailingItems: {
    ///         MISOToolBarItem(label: "Done") { }
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - leadingItems: The items displayed on the leading side, *empty* by default.
    ///   - trailingItems: The items displayed on the trailing side, *empty* by default.
    public init(leadingItems: @escaping () -> [MISOToolBarItem] = { [] },
                trailingItems: @escaping () -> [MISOToolBarItem] = { [] })
    {
        self.leadingItems = leadingItems
        self.trailingItems = trailingItems
        groupedItems = { [] }
        useGroupedItems = false
    }

    /// `ViewModifier` to define an OUDS bottom toolbar.
    ///
    ///  You should prefer `toolBarBottom(groupedItems:)`.
    ///
    /// **Warning: Works only with iOS 26+ / Liquid Glass, otherwise items will be splitted by the system**
    ///
    /// ```swift
    ///     MISOToolBarBottom {
    ///         MISOToolBarItem(label: "Share") { }
    ///         MISOToolBarItem(label: "Save") { }
    ///     }
    /// ```
    ///
    /// - Parameter groupedItems: All the items to place in the center of the screen
    public init(groupedItems: @escaping () -> [MISOToolBarItem]) {
        leadingItems = { [] }
        trailingItems = { [] }
        self.groupedItems = groupedItems
        useGroupedItems = true
    }

    // MARK: - Body

    public func body(content: Content) -> some View {
        if useGroupedItems {
            content.toolBarBottom(groupedItems: groupedItems)
        } else {
            content.toolBarBottom(leadingItems: leadingItems,
                                  trailingItems: trailingItems)
        }
    }
}

// MARK: - Extension of View

extension View {

    /// Creates a bottom toolbar with leading and trailing items.
    ///
    /// There must be only one *bottom toolbar*.
    ///
    /// - Parameters:
    ///   - leadingItems: The items displayed on the leading side, default *empty*
    ///   - trailingItems: The items displayed on the trailing side, default *empty*
    @available(iOS 15, visionOS 1, *)
    public func toolBarBottom(@MISOToolBarItemsBuilder leadingItems: () -> [MISOToolBarItem] = { [] },
                              @MISOToolBarItemsBuilder trailingItems: () -> [MISOToolBarItem] = { [] }) -> some View
    {
        modifier(ToolBarBottomModifier(leadingItems: leadingItems,
                                       trailingItems: trailingItems))
    }

    /// Creates a bottom toolbar with grouped items, centered to the screen.
    ///
    /// **Warning: Works only with iOS 26+ / Liquid Glass, otherwise items will be splitted by the system**
    ///
    /// There must be only one *bottom toolbar*.
    ///
    /// - Parameter groupedItems: All the items to place in the center of the screen
    @available(iOS 15, visionOS 1, *)
    public func toolBarBottom(@MISOToolBarItemsBuilder groupedItems: () -> [MISOToolBarItem]) -> some View {
        modifier(ToolBarBottomModifier(groupedItems: groupedItems))
    }
}
#endif
