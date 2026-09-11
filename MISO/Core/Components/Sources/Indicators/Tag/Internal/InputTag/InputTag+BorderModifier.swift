// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

struct InputTagBorderModifier: ViewModifier {

    // MARK: Stored Properties

    let state: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .border(
                style: theme.borders.styleDefault,
                width: width,
                radius: theme.tag.borderRadius,
                color: color)
    }

    // MARK: Private helpers

    private var width: BorderWidthSemanticToken {
        switch state {
        case .enabled, .disabled:
            theme.inputTag.borderWidthDefault
        case .hover, .pressed:
            theme.inputTag.borderWidthDefaultInteraction
        case .readOnly:
            // Should not appear
            theme.inputTag.borderWidthDefault
        }
    }

    private var color: MultipleColorSemanticToken {
        switch state {
        case .enabled:
            theme.inputTag.colorBorderEnabled
        case .hover:
            theme.inputTag.colorBorderHover
        case .pressed:
            theme.inputTag.colorBorderPressed
        case .disabled:
            theme.colors.actionDisabled
        case .readOnly:
            // Should not appear
            theme.colors.actionDisabled
        }
    }
}
