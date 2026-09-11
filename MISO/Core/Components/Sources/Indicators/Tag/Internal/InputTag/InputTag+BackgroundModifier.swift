// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

struct InputTagBackgroundModifier: ViewModifier {

    // MARK: Stored Properties

    let state: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        if let color {
            content.background(color)
        } else {
            content
        }
    }

    // MARK: Private helpers

    private var color: MultipleColorSemanticToken? {
        switch state {
        case .enabled:
            theme.inputTag.colorBgEnabled
        case .hover:
            theme.inputTag.colorBgHover
        case .pressed:
            theme.inputTag.colorBgPressed
        case .disabled:
            nil
        case .readOnly:
            // Should not appear
            nil
        }
    }
}
