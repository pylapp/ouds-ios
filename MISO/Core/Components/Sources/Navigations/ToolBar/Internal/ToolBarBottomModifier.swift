// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOFoundations
import MISOThemesContract
import SwiftUI

struct ToolBarBottomModifier: ViewModifier {

    // MARK: - Properties

    private let leadingItems: [MISOToolBarItem]
    private let trailingItems: [MISOToolBarItem]
    private let groupedItems: [MISOToolBarItem]

    // MARK: - Initializer

    /// Creates a bottom toolbar with leading and trailing items, and a space between them.
    ///
    /// - Parameters:
    ///   - leadingItems: The items displayed on the leading side.
    ///   - trailingItems: The items displayed on the trailing side.
    init(@MISOToolBarItemsBuilder leadingItems: () -> [MISOToolBarItem] = { [] },
         @MISOToolBarItemsBuilder trailingItems: () -> [MISOToolBarItem] = { [] })
    {
        groupedItems = []
        self.leadingItems = leadingItems()
        self.trailingItems = trailingItems()
    }

    /// Creates a bottom toolbar with grouped items, centered to the screen.
    ///
    /// **Warning: Works only with iOS 26+ / Liquid Glass, otherwise items will be splitted by the system**
    ///
    /// - Parameters:
    ///   - groupedItems: All the items to place in the center of the s creen
    init(@MISOToolBarItemsBuilder groupedItems: () -> [MISOToolBarItem] = { [] }) {
        self.groupedItems = groupedItems()
        leadingItems = []
        trailingItems = []
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        if !groupedItems.isEmpty {
            content
                .toolbar {
                    ToolbarItemGroup(placement: bottomPlacement) {
                        itemsView(groupedItems)
                    }
                }
        } else {
            content
                .toolbar {
                    ToolbarItemGroup(placement: bottomPlacement) {
                        itemsView(leadingItems)
                        Spacer()
                        itemsView(trailingItems)
                    }
                }
        }
    }

    // MARK: - Helpers

    private var bottomPlacement: ToolbarItemPlacement {
        #if os(iOS) || os(visionOS)
        return .bottomBar
        #else
        return .automatic
        #endif
    }

    private func itemsView(_ items: [MISOToolBarItem]) -> some View {
        ForEach(items) { item in
            item
                .environment(\.toolbarItemLocation, .toolbarBottom)
        }
    }
}
#endif
