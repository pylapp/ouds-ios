// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

struct TextInputLabelContainer: View {

    // MARK: Properties

    let label: String
    let status: MISOTextInput.Status
    let interactionState: TextInputInteractionState
    let position: Position

    @Environment(\.theme) private var theme

    // MARK: Positions

    enum Position {
        case top
        case middle
    }

    // MARK: Body

    var body: some View {
        if !label.isEmpty {
            switch position {
            case .top:
                content.labelDefaultSmall(theme)
            case .middle:
                content.labelDefaultLarge(theme)
            }
        }
    }

    // MARK: Helper

    private var content: some View {
        Text(label)
            .lineLimit(numberOfLines)
            .minimumScaleFactor(1.0)
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityHidden(true)
    }

    private var numberOfLines: Int {
        switch position {
        case .top:
            1
        case .middle:
            2
        }
    }

    private var color: MultipleColorSemanticToken {
        switch status {
        case .enabled, .loading, .readOnly:
            theme.colors.contentMuted
        case .error, .richError:
            switch interactionState {
            case .idle:
                theme.colors.actionNegativeEnabled
            case .focused:
                theme.colors.actionNegativeFocus
            case .hover:
                theme.colors.actionNegativeHover
            }
        case .disabled:
            theme.colors.actionDisabled
        }
    }
}
#endif
