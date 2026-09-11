// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOFoundations
import MISOThemesContract
import SwiftUI

extension View {

    /// Wraps `self` `View` inside an `MISOThemeableView` applying the ``WireframeTheme``.
    /// This helper should be used in two cases:
    /// - to debug a `View` in Xcode `#Preview` macro
    /// - to let end-users testing on their side in `#Preview` macro your `View` based on MISO.
    ///
    /// ```swift
    ///     // In this case, apply the theme on the preview
    ///     #Preview {
    ///        SampleView().wireframePreview()
    ///     }
    /// ```
    ///
    /// ```swift
    ///     // In this case, you defined a `View` you provide to outside developers who use `#Preview` macro
    ///     // In your side:
    ///     struct YourView(): View {
    ///         var body: some View {
    ///            yourContentView.wireframePreview()
    ///         }
    ///     }
    ///
    ///     // In their side:
    ///     #Preview {
    ///         TheirView() // Using your view
    ///     }
    /// ```
    ///
    /// Note this second case works only if *YourView* does not refer directly to the `theme` (see [#1268](https://github.com/Orange-OpenSource/miso-ios/issues/1268))
    @ViewBuilder
    public func wireframePreview() -> some View {
        #if DEBUG
        if ProcessInfo.doesRunOnXcodePreview {
            MISOThemeableView(theme: WireframeTheme()) {
                self
            }
        } else {
            self
        }
        #else
        self
        #endif
    }
}
