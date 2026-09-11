// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract
import MISOTokensComponent
import MISOTokensSemantic
import SwiftUI

struct LinkColorIndicatorModifier: ViewModifier {

    // MARK: - Proeprties

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
        MISOWCAG21Ratio.debugContrastRatio(colorToApply, surfaceColor, .nonTextual)
        return colorToApply
    }

    private var enabledColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentEnabled : theme.link.colorChevronEnabled
    }

    private var hoverColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentHover : theme.link.colorChevronHover
    }

    private var pressedColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentPressed : theme.link.colorChevronPressed
    }

    private var disabledColor: MultipleColorSemanticToken {
        useMonochrome ? theme.link.monoColorContentDisabled : theme.colors.actionDisabled
    }
}
