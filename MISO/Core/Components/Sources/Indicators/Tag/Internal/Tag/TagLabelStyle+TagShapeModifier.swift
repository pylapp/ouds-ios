// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct TagShapeModifier: ViewModifier {

    // MARK: Stored properties

    let shape: MISOTag.Shape

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    // MARK: Helper

    private var cornerRadius: CGFloat {
        switch shape {
        case .square:
            theme.borders.radiusNone
        case .rounded:
            theme.tag.borderRadius
        }
    }
}
