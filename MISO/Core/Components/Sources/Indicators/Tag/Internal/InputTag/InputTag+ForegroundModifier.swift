// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

struct InputTagForegroundModifier: ViewModifier {

    // MARK: Stored Properties

    let state: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content.foregroundColor(color)
    }

    // MARK: Private helpers

    private var color: MultipleColorSemanticToken {
        switch state {
        case .enabled:
            theme.inputTag.colorContentEnabled
        case .hover:
            theme.inputTag.colorContentHover
        case .pressed:
            theme.inputTag.colorContentPressed
        case .disabled:
            theme.colors.actionDisabled
        case .readOnly:
            // should not appear
            theme.colors.actionDisabled
        }
    }
}
