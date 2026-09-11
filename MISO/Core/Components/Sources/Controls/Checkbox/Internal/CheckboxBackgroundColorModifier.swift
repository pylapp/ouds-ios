// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Checkbox Background Color

struct CheckboxBackgroundColorModifier: ViewModifier {

    // MARK: Properties

    var interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        switch interactionState {
        case .enabled, .disabled, .readOnly:
            content
        case .hover:
            content.background(theme.listItem.colorBgHover)
                .clipShape(RoundedRectangle(cornerRadius: theme.listItem.borderRadiusItemOnly))
        case .pressed:
            content.background(theme.listItem.colorBgPressed)
                .clipShape(RoundedRectangle(cornerRadius: theme.listItem.borderRadiusItemOnly))
        }
    }
}
