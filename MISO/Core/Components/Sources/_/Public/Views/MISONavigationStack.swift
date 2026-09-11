// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import SwiftUI

/// Use a navigation stack to present a stack of views over a root view.
/// and let system applies theme colors on navigation bar appearance.
///
/// - Since: 1.4.0
public struct MISONavigationStack<Content: View>: View {

    // MARK: - Properties

    private let hideBackButtonLabel: Bool
    @ViewBuilder private let content: Content

    // MARK: - Initializer

    /// Creates a navigation stack and apply the right appearance according to the current theme.
    ///
    /// ```swift
    ///     MISONavigationStack {
    ///         HomeView()
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///    - hideBackButtonLabel: Flag to say if the label in back button should be hidden. `true` by default
    ///    - content: The stack view's content.
    public init(hideBackButtonLabel: Bool = true,
                @ViewBuilder content: @escaping () -> Content)
    {
        self.hideBackButtonLabel = hideBackButtonLabel
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack { updatedContent }
        } else {
            #if os(macOS)
            NavigationView { updatedContent }
            #else
            NavigationView { updatedContent }
                .navigationViewStyle(.stack)
            #endif
        }
    }

    private var updatedContent: some View {
        content.misoNavigationBarAppearance(hideBackButtonLabel: hideBackButtonLabel)
    }
}

extension View {

    /// Can be used to apply the right elements on navigation bar according to the current theme
    /// (tiltes fonts, colors, and back indicator).
    /// If needed, it is possible to remove the label of the back button (associated to previous chevron).
    ///
    /// - Parameter hideBackButtonLabel: Flag to say if the label in back button should be hidden. `false` by default
    public func misoNavigationBarAppearance(hideBackButtonLabel: Bool = false) -> some View {
        modifier(NavigationStackRefresher(hideBackButtonLabel: hideBackButtonLabel))
    }
}
#endif
