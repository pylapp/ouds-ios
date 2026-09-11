// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensComponent
import MISOTokensSemantic
import SwiftUI

/// Used to apply the right foreground color associated to the state
struct ChipForegroundModifier: ViewModifier {

    // MARK: Stored Properties

    let state: MISOChipInteractionState
    let selected: Bool

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content.foregroundColor(appliedColor)
    }

    // MARK: Private helpers

    private var appliedColor: MultipleColorSemanticToken {
        switch state {
        case .enabled:
            selected ? theme.chip.colorContentSelectedEnabled : theme.chip.colorContentUnselectedEnabled
        case .hover:
            selected ? theme.chip.colorContentSelectedHover : theme.chip.colorContentUnselectedHover
        case .pressed:
            selected ? theme.chip.colorContentSelectedPressed : theme.chip.colorContentUnselectedPressed
        case .disabled:
            selected ? theme.chip.colorContentSelectedDisabled : theme.chip.colorContentUnselectedDisabled
        }
    }
}
