// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract
import MISOTokensComponent
import MISOTokensSemantic
import SwiftUI

struct LinkColorContentModifier: ViewModifier {

    // MARK: - Properties

    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoUseMonochrome) private var useMonochrome
    @Environment(\.misoSurfaceColor) private var surfaceColor

    // MARK: - Body

    func body(content: Content) -> some View {
        content.foregroundStyle(appliedColor())
    }

    // MARK: - Helpers

    private func appliedColor() -> MultipleColorSemanticToken {
        let colorToApply: MultipleColorSemanticToken = switch interactionState {
        case .enabled:
            enabledColor
        case .hover:
            hoverColor
        case .pressed:
            pressedColor
        case .disabled, .readOnly:
            disabledColor
        }
        MISOWCAG21Ratio.debugContrastRatio(colorToApply, surfaceColor)
        return colorToApply
    }

    private var enabledColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentEnabled : theme.link.colorContentEnabled
    }

    private var hoverColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentHover : theme.link.colorContentHover
    }

    private var pressedColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentPressed : theme.link.colorContentPressed
    }

    private var disabledColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentDisabled : theme.colors.actionDisabled
    }
}
