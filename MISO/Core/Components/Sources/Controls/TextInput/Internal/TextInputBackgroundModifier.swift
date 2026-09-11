// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

struct TextInputBackgroundModifier: ViewModifier {

    // MARK: - Properties

    let status: MISOTextInput.Status
    let isOutlined: Bool
    let interactionState: TextInputInteractionState

    @Environment(\.theme) private var theme

    // MARK: - Body

    func body(content: Content) -> some View {
        if let color {
            content.background(color)
        } else {
            content
        }
    }

    // MARK: - Helpers

    private var color: MultipleColorSemanticToken? {
        isOutlined ? outlinedColor : defaultColor
    }

    private var defaultColor: MultipleColorSemanticToken? {
        switch status {
        case .enabled:
            switch interactionState {
            case .idle:
                theme.colors.actionSupportEnabled
            case .focused:
                theme.colors.actionSupportPressed
            case .hover:
                theme.colors.actionSupportHover
            }
        case .error, .richError:
            theme.colors.surfaceStatusNegativeMuted
        case .loading:
            theme.colors.actionSupportLoading
        case .readOnly:
            nil
        case .disabled:
            theme.colors.actionSupportDisabled
        }
    }

    private var outlinedColor: MultipleColorSemanticToken? {
        if status == .readOnly {
            theme.colors.actionSupportDisabled
        } else {
            nil
        }
    }
}
#endif
