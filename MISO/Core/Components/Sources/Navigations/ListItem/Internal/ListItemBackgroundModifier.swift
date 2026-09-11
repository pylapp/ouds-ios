// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

/// A `ViewModifier` to apply to `ListItemContent` views so as to define the background
struct ListItemBackgroundModifier: ViewModifier {

    // MARK: Properties

    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoListItemContentStyle) private var style

    // MARK: Body

    func body(content: Content) -> some View {
        switch style {
        case let .card(cardStyle):
            switch cardStyle {
            case .outlined:
                content
            case let .standard(_, background):
                self.background(content: content, withInteractionOnly: background == false)
            }
        case let .item(_, background):
            self.background(content: content, withInteractionOnly: background == false)
        }
    }

    // MARK: Helpers

    @ViewBuilder
    private func background(content: Content, withInteractionOnly: Bool) -> some View {
        let color = switch interactionState {
        case .enabled:
            withInteractionOnly ? nil : theme.colors.actionSupportEnabled
        case .disabled:
            withInteractionOnly ? nil : theme.colors.actionSupportDisabled
        case .hover:
            theme.colors.actionSupportHover
        case .pressed:
            theme.colors.actionSupportPressed
        case .readOnly:
            theme.colors.actionSupportEnabled
        }

        if let color {
            content.background(color)
        } else {
            content
        }
    }
}
