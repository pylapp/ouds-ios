// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import SwiftUI

/// A `ViewModifier` to apply to `ControlItem` views so as to define the background
struct ControlItemBackgroundModifier: ViewModifier {

    // MARK: Stored properties

    let interactionState: MISOButtonInteractionState
    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        if interactionState == .hover {
            content.background(theme.listItem.colorBgHover)
        } else if interactionState == .pressed {
            content.background(theme.listItem.colorBgPressed)
        } else {
            content
        }
    }
}
