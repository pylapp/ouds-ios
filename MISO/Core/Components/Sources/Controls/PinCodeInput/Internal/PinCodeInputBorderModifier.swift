// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

/// `ViewModifier` to draw borders on text fields in ``MISOPinCodeInput`` component
struct PinCodeInputBorderModifier: ViewModifier {

    let isOutlined: Bool
    let isError: Bool
    let isFocused: Bool

    @Environment(\.theme) private var theme

    func body(content: Content) -> some View {
        if !isOutlined {
            content
                .overlay(
                    Rectangle()
                        .frame(height: borderWidth)
                        .foregroundColor(borderColor),
                    alignment: .bottom)
                .cornerRadius(borderRadius)
        } else {
            content
                .border(style: theme.borders.styleDefault,
                        width: borderWidth,
                        radius: borderRadius,
                        color: borderColor)
        }
    }

    // MARK: - Helpers

    private var borderColor: MultipleColorSemanticToken {
        if isError {
            return theme.colors.actionNegativeEnabled
        }
        if isFocused {
            return theme.textInput.colorBorderFocus
        }
        return theme.textInput.colorBorderEnabled
    }

    private var borderWidth: BorderWidthSemanticToken {
        isFocused ? theme.textInput.borderWidthFocus : theme.textInput.borderWidthDefault
    }

    private var borderRadius: BorderRadiusSemanticToken {
        theme.tuning.hasRoundedTextInputs ? theme.textInput.borderRadiusRounded : theme.textInput.borderRadiusDefault
    }
}
#endif
