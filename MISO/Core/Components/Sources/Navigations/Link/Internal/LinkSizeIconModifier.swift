// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

struct LinkSizeIconModifier: ViewModifier {

    // MARK: - Properties

    let size: MISOLink.Size

    @Environment(\.theme) private var theme

    // MARK: - Body

    func body(content: Content) -> some View {
        content.frame(width: width, height: height)
    }

    // MARK: - Helpers

    private var width: Double {
        switch size {
        case .small:
            theme.link.sizeIconSmall
        case .default:
            theme.link.sizeIconDefault
        }
    }

    private var height: Double {
        switch size {
        case .small:
            theme.link.sizeIconSmall
        case .default:
            theme.link.sizeIconDefault
        }
    }
}
