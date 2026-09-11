// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOFoundations
import MISOThemesContract
import SwiftUI

// MARK: - MISO ToolBar Top View Modifier

/// The top toolbar (aka *navigation bar* on iOS and iPadOS 18 and lower) sits at the top of the screen and provides contextual information
/// and controls related to the current view.
/// It typically displays the page title, and may include navigation actions such as "Back" or "Close" as well as supplementary actions.
/// It can contain leading, principal (center, single item only), and trailing actions.
///
/// **Warning**: If an item is placed in principal position, the subtitle is never displayed (whatever `hasLargeTitle` is), because
/// SwiftUI's `.principal` placement only replaces the inline compact bar title, not `.navigationSubtitle()` (iOS 26+), which would
/// otherwise keep rendering next to the item with no visible title next to it. The title itself is displayed only if `hasLargeTitle`
/// is `true` (in that case it appears below the bar, in large title mode, not inside it).
///
/// ## Appearances
///
/// With Liquid Glass / iOS 26+ the OS will change the rendering of the toolbar items depending to the context:
/// - The OS can group the items of same types in one group with kind of rectangle (e.g. views with menus)
/// - But for buttons items they will remain isolated
/// - The placement of the title can be leading or centered depending to the length of the text
/// - The text can be truncated if there is not enough remaining space
/// - The OS can apply another style for the back button
///
/// Without Liquid Glass / iOS 18 and lower, the OS won't change that much the style of the toolbar items, Items won't be visually grouped.
///
/// Globaly the appearence of the * navigation bar* elements is changed by the `oudsNavigationBarAppearance`
/// helper of `View` that must be applyed on the root view of the `NavigationStack` for example.
///
/// ## Technical constraints
///
/// To be sure for iOS 18 and lower the back buttton and text have the good color, in your main view apply the following accent color:
///
/// ```swift
///     struct AppMainView: View {
///         var body: some View {
///             ContentView()
///                 .accentColor(theme.colors.contentDefault)
///         }
///     }
/// ```
///
/// ## Platform considerations
///
/// - The component is available on iOS, iPadOS, and visionOS
/// - The component is not available for watchOS, tvOS and macOS
///
/// ## Badges uses
///
/// For iOS 26 with Liquid Glass, the system badge is used because the OUDS badge component does not provide a suitable
/// rendering with the glassified effect applied on the top toolbar.
/// For iOS until 18 and without Liquid Glass  OUDS badge component is always used.
///
/// ## Code sample
///
/// ```swift
///     ContentView()
///         .toolBarTop("Title",
///             leadingItems: {
///                 MISOToolBarItem(navigation: .back())
///             },
///             principalItem: MISOToolBarItem(icon: Image(decorative: "search"), accessibilityLabel: "Search") { /* Action to process */ },
///             trailingItems: {
///                 MISOToolBarItem(label: "Label") { /* Action to process */ }
///                 MISOToolBarItem(icon: Image(decorative: "some_image"), accessibilityLabel: "Label") { /* Action to process */ }
///             }
///         )
/// ```
///
/// A `View` helper can also be used to apply a SwiftUI toolbar configuration.
///
/// ```swift
///     toolBarTop(_:hasLargeTitle:subtitle:leadingItems:principalItem:trailingItems:)
/// ```
///
/// - Version: 1.1.0 (Figma component design version)
/// - Since: 1.4.0
@available(iOS 15, visionOS 1, *)
public struct MISOToolBarTop: ViewModifier {
    // NOTE: As Swift DocC cannot build rich documention for methods, this struct does not the job

    // MARK: Properties

    /// The toolbar title
    private let title: String
    /// If the title must be displayed in large mode or not
    private let hasLargeTitle: Bool
    /// An optional subtitle displayed below the title if iOS 26+
    private let subtitle: String?
    /// The items to display in leading position
    @MISOToolBarItemsBuilder private let leadingItems: () -> [MISOToolBarItem]
    /// The item to display in principal (center) position (only one item supported)
    private let principalItem: MISOToolBarItem?
    /// The items to display in trailing position
    @MISOToolBarItemsBuilder private let trailingItems: () -> [MISOToolBarItem]

    // MARK: Initializer

    /// `ViewModifier` to define an OUDS top toolbar.
    ///
    ///  You should prefer `toolBarTop(_:hasLargeTitle:subtitle:leadingItems:principalItem:trailingItems:)` on view placed
    ///  inside `NavigationView` or`NavigationStack`.
    ///
    /// ```swift
    ///     MISOToolBarTop(title: "Home") {
    ///         MISOToolBarItem(navigation: .back { })
    ///     },
    ///     principalItem: MISOToolBarItem(icon: Image(decorative: "search"), accessibilityLabel: "Search") { },
    ///     trailingItems: {
    ///         MISOToolBarItem(label: "Done") { }
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - title: The toolbar title. Prefer a non-empty string.
    ///   - hasLargeTitle: If *title* must be displayed in large mode or not, *false* by default. If large mode, the *subtitle* is not displayed
    ///   - subtitle: Optional *subtitle* displayed below the *title* if iOS 26+, *nil* by default. **Never displayed if `principalItem` is not *nil*.**
    ///   - leadingItems: The items displayed on the leading side, *empty* by default.
    ///   - principalItem: The item displayed in the principal (center) position, *nil* by default. Only one item is supported.
    ///     If set, the *title* is displayed only if `hasLargeTitle` is `true`, and the *subtitle* is never displayed.
    ///   - trailingItems: The items displayed on the trailing side, *empty* by default.
    public init(title: String,
                hasLargeTitle: Bool = false,
                subtitle: String? = nil,
                leadingItems: @escaping () -> [MISOToolBarItem] = { [] },
                principalItem: MISOToolBarItem? = nil,
                trailingItems: @escaping () -> [MISOToolBarItem] = { [] })
    {
        self.title = title
        self.hasLargeTitle = hasLargeTitle
        self.subtitle = subtitle
        self.leadingItems = leadingItems
        self.principalItem = principalItem
        self.trailingItems = trailingItems
    }

    // MARK: - Body

    public func body(content: Content) -> some View {
        content.toolBarTop(title,
                           hasLargeTitle: hasLargeTitle,
                           subtitle: subtitle,
                           leadingItems: leadingItems,
                           principalItem: principalItem,
                           trailingItems: trailingItems)
    }
}

// MARK: - Extension of View

extension View {

    /// Creates a top toolbar with a title, optional subtitle (for iOS 26+), leading, principal and trailing items.
    ///
    /// The view which contains this *top toolbar* must be placed inside a `NavigationView` or `NavigationStack`,
    /// otherwise th top toolbar won't appear..
    ///
    /// There must be only one *top toolbar*.
    ///
    /// **Warning**: If an item is placed in principal position, the subtitle is never displayed (whatever `hasLargeTitle` is), because
    /// SwiftUI's `.principal` placement only replaces the inline compact bar title, not `.navigationSubtitle()` (iOS 26+), which would
    /// otherwise keep rendering next to the item with no visible title next to it. The title itself is displayed only if `hasLargeTitle`
    /// is `true` (in that case it appears below the bar, in large title mode, not inside it).
    ///
    /// - Parameters:
    ///   - title: The toolbar title. Prefer a non-empty string.
    ///   - hasLargeTitle: If *title* must be displayed in large mode or not, *false* by default. If large mode, the *subtitle* is not displayed for iOS < 26.
    ///   - subtitle: Optional *subtitle* displayed below the *title* if iOS 26+, *nil* by default. **Never displayed if `principalItem` is not *nil*.**
    ///   - leadingItems: The items displayed on the leading side, *empty* by default.
    ///   - principalItem: The item displayed in the principal (center) position, *nil* by default. Only one item is supported.
    ///     If set, the *title* is displayed only if `hasLargeTitle` is `true`, and the *subtitle* is never displayed.
    ///   - trailingItems: The items displayed on the trailing side, *empty* by default.
    @available(iOS 15, visionOS 1, *)
    public func toolBarTop(_ title: String,
                           hasLargeTitle: Bool = false,
                           subtitle: String? = nil,
                           @MISOToolBarItemsBuilder leadingItems: @escaping () -> [MISOToolBarItem] = { [] },
                           principalItem: MISOToolBarItem? = nil,
                           @MISOToolBarItemsBuilder trailingItems: @escaping () -> [MISOToolBarItem] = { [] }) -> some View
    {
        modifier(ToolBarTopModifier(title: title,
                                    hasLargeTitle: hasLargeTitle,
                                    subtitle: subtitle,
                                    leadingItems: leadingItems,
                                    principalItem: principalItem,
                                    trailingItems: trailingItems))
    }
}
#endif
