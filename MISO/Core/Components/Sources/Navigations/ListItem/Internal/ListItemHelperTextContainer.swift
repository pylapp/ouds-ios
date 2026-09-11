// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// Displays an helper message below ``ListItemContent`` text.
/// and updates text color according to the ``MISOButtonInteractionState``.
struct ListItemHelperTextContainer: View {

    // MARK: Properties

    let text: TextualContent?
    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        if let text, !text.isEmpty {
            textView(for: text)
                .labelDefaultMedium(theme)
                .foregroundColor(color)
                .multilineTextAlignment(.leading)
                .padding(.top, theme.listItem.spacePaddingBlockTopHelperText)
                .padding(.horizontal, theme.listItem.spacePaddingInline)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }

    // MARK: Helper

    private var color: MultipleColorSemanticToken {
        interactionState == .disabled ? theme.colors.actionDisabled : theme.colors.contentMuted
    }
}
