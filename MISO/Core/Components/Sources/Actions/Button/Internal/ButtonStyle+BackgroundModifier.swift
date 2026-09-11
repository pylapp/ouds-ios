// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensComponent
import MISOTokensSemantic
import SwiftUI

/// Used to apply the right background color associated to the appearance and style
struct ButtonBackgroundModifier: ViewModifier {

    // MARK: Stored Properties

    let appearance: MISOButton.Appearance
    let state: ButtonInternalState

    @Environment(\.theme) private var theme
    @Environment(\.misoUseMonochrome) private var useMonochrome

    // MARK: Body

    func body(content: Content) -> some View {
        if let appliedColor {
            content.background(appliedColor)
        } else {
            content
        }
    }

    // MARK: Private helpers

    private var appliedColor: MultipleColorSemanticToken? {
        switch state {
        case .enabled:
            enabledColor
        case .hover:
            hoverColor
        case .pressed:
            pressedColor
        case .loading:
            loadingColor
        case .disabled:
            disabledColor
        }
    }

    private var enabledColor: MultipleColorSemanticToken? {
        switch appearance {
        case .default:
            useMonochrome ? theme.button.monoColorBgDefaultEnabled : theme.button.colorBgDefaultEnabled
        case .strong:
            useMonochrome ? theme.button.monoColorBgStrongEnabled : theme.colors.actionEnabled
        case .brand:
            theme.button.colorBgBrandEnabled
        case .minimal:
            nil
        case .negative:
            theme.colors.actionNegativeEnabled
        }
    }

    private var hoverColor: MultipleColorSemanticToken {
        switch appearance {
        case .default:
            useMonochrome ? theme.button.monoColorBgDefaultHover : theme.button.colorBgDefaultHover
        case .strong:
            useMonochrome ? theme.button.monoColorBgStrongHover : theme.colors.actionHover
        case .brand:
            theme.button.colorBgBrandHover
        case .minimal:
            useMonochrome ? theme.button.monoColorBgMinimalHover : theme.button.colorBgMinimalHover
        case .negative:
            theme.colors.actionNegativeHover
        }
    }

    private var pressedColor: MultipleColorSemanticToken {
        switch appearance {
        case .default:
            useMonochrome ? theme.button.monoColorBgDefaultPressed : theme.button.colorBgDefaultPressed
        case .strong:
            useMonochrome ? theme.button.monoColorBgStrongPressed : theme.colors.actionPressed
        case .brand:
            theme.button.colorBgBrandPressed
        case .minimal:
            useMonochrome ? theme.button.monoColorBgMinimalPressed : theme.button.colorBgMinimalPressed
        case .negative:
            theme.colors.actionNegativePressed
        }
    }

    private var loadingColor: MultipleColorSemanticToken? {
        switch appearance {
        case .default:
            useMonochrome ? theme.button.monoColorBgDefaultLoading : theme.button.colorBgDefaultLoading
        case .strong:
            useMonochrome ? theme.button.monoColorBgStrongLoading : theme.colors.actionLoading
        case .brand:
            theme.button.colorBgBrandLoading
        case .minimal:
            nil
        case .negative:
            theme.colors.actionNegativeLoading
        }
    }

    private var disabledColor: MultipleColorSemanticToken? {
        switch appearance {
        case .default:
            useMonochrome ? theme.button.monoColorBgDefaultDisabled : theme.button.colorBgDefaultDisabled
        case .strong:
            useMonochrome ? theme.button.monoColorBgStrongDisabled : theme.colors.actionDisabled
        case .brand:
            theme.colors.actionDisabled
        case .minimal:
            nil
        case .negative:
            theme.colors.actionDisabled
        }
    }
}
