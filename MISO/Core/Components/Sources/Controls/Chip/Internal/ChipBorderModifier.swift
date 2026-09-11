// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensComponent
import MISOTokensSemantic
import SwiftUI

/// Used to apply a border with color, width and radius associated to the state
struct ChipBorderModifier: ViewModifier {

    // MARK: Stored Properties

    let state: MISOChipInteractionState
    let selected: Bool

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .border(
                style: theme.borders.styleDefault,
                width: width,
                radius: theme.chip.borderRadius,
                color: color)
    }

    // MARK: Private helpers

    private var width: BorderWidthSemanticToken {
        switch state {
        case .enabled, .disabled:
            selected ? theme.chip.borderWidthSelected : theme.chip.borderWidthUnselected
        case .hover, .pressed:
            selected ? theme.chip.borderWidthSelected : theme.chip.borderWidthUnselectedInteraction
        }
    }

    private var color: MultipleColorSemanticToken {
        switch state {
        case .enabled:
            selected ? theme.chip.colorBorderSelectedEnabled : theme.chip.colorBorderUnselectedEnabled
        case .hover:
            selected ? theme.chip.colorBorderSelectedHover : theme.chip.colorBorderUnselectedHover
        case .pressed:
            selected ? theme.chip.colorBorderSelectedPressed : theme.chip.colorBorderUnselectedPressed
        case .disabled:
            selected ? theme.chip.colorBorderSelectedDisabled : theme.chip.colorBorderUnselectedDisabled
        }
    }
}
