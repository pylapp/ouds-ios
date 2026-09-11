// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

struct TextInputCircularProgressIndicator: View {

    // MARK: Properties

    let progress: Double?

    @Environment(\.theme) private var theme

    // MARK: - Initializer

    init(progress: Double? = nil) {
        self.progress = progress
    }

    // MARK: - Body

    var body: some View {
        Group {
            if let progress {
                MISOCircularProgressIndicator(progress: progress, status: .neutral, track: false, animated: false, size: size)
            } else {
                MISOCircularProgressIndicator(status: .neutral, track: false, size: size)
            }
        }
        .accessibilityHidden(true)
    }

    private var size: CGFloat {
        theme.button.sizeProgressIndicatorDefault
    }
}
#endif
