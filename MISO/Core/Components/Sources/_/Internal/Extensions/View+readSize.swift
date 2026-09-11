// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Sizes management

private struct SizePreferenceKey: @preconcurrency PreferenceKey {
    @MainActor static var defaultValue: CGSize = .zero

    static func reduce(value _: inout CGSize, nextValue _: () -> CGSize) {}
}

extension View {

    /// Use to read the size of the current view (usefull to read the width of text)
    ///
    /// - Parameter onChange: Called when the size changes
    @MainActor
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            })
            .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
