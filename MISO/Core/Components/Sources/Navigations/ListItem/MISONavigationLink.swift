// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(tvOS) && !os(watchOS) && !os(visionOS)
// Component available only for iOS, but macOS not excluded to allow documentation build
import SwiftUI

/// Uses an ``MISONavigationListItem``  object backed by a `NavigationLink`
/// so as to use easily the navigation list item from MISO inside the navigation of the app.
///
/// ## Code samples
///
/// ```swift
///     // Title will be used both for MISONavigationListItem label and navigation title
///     MISONavigationLink(title: "Title of my destination view") {
///         // The view to display when the user taps on the item
///         MyDestinationView()
///     }
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, *)
public struct MISONavigationLink<Destination: View>: View {

    // MARK: - Properties

    /// The label of the ``MISONavigationListItem``, used then as navigation title
    private let title: String

    /// Set to `true`  if the label must be bold, false otherwise
    private let hasBoldLabel: Bool

    /// The type of indicator for the ``MISONavigationListItem``, e.g. `.next` or `.previous` to define the chevron.
    private let indicatorType: MISONavigationListItemIndicatorType

    /// The style to apply to the ``MISONavigationListItem``
    private let style: MISOListItemContentStyle

    /// The ``SwiftUICore/View`` to display when the user taps on the element
    @ViewBuilder private let destination: () -> Destination

    /// Flag to know if the user taps the item or not, i.e. if `Destination` view must be displayed.
    @State private var isActive: Bool = false

    // MARK: - Initializers

    /// Defines an ``MISONavigationListItem`` backed by a `NavigationLink`
    /// with a `Destination` ``SwiftUICore/View``  to display whe the user taps.
    ///
    /// - Parameters:
    ///    - title: The label for the ``MISONavigationListItem``
    ///    - hasBoldLabel: Flag to rise if title must be bold or not, default set to *false*
    ///    - indicatorType: The type of link to apply, default set to `.next`
    ///    - style: The type of style to apply, default set to `.item(divider: false, background: false)`
    ///    - destination: A closure providing the view to display when the user taps the item.
    public init(title: String,
                hasBoldLabel: Bool = false,
                indicatorType: MISONavigationListItemIndicatorType = .next,
                style: MISOListItemContentStyle = .item(divider: true, background: false),
                destination: @escaping () -> Destination)
    {
        self.title = title
        self.hasBoldLabel = hasBoldLabel
        self.indicatorType = indicatorType
        self.style = style
        self.destination = destination
        isActive = false
    }

    /// Defines an ``MISONavigationListItem`` backed by a `NavigationLink`
    /// with a `Destination` ``SwiftUICore/View``  to display whe the user taps.
    ///
    /// - Parameters:
    ///    - key: A `LocalizedStringKey` used to look up the label in the given bundle
    ///    - tableName: The name of the `.strings` file, or `nil` for the default
    ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///    - hasBoldLabel: Flag to rise if title must be bold or not, default set to *false*
    ///    - indicatorType: The type of link to apply, default set to `.next`
    ///    - style: The type of style to apply, default set to `.item(divider: true, background: false)`
    ///    - destination: A closure providing the view to display when the user taps the item.
    public init(_ key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                hasBoldLabel: Bool = false,
                indicatorType: MISONavigationListItemIndicatorType = .next,
                style: MISOListItemContentStyle = .item(divider: true, background: false),
                destination: @escaping () -> Destination)
    {
        self.init(title: key.resolved(tableName: tableName, bundle: bundle),
                  hasBoldLabel: hasBoldLabel,
                  indicatorType: indicatorType,
                  style: style,
                  destination: destination)
    }

    // MARK: - Body

    public var body: some View {
        MISONavigationListItem(data: .init(label: title, hasBoldLabel: hasBoldLabel), indicatorType: indicatorType) {
            isActive = true
        }
        .misoListContentStyle(style)
        .background {
            NavigationLink(destination: destination().navigationTitle(title), isActive: $isActive) {
                EmptyView()
            }
            .hidden()
        }
    }
}
#endif
