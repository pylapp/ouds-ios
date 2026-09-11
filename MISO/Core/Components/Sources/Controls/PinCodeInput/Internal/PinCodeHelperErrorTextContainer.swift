// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

struct PinCodeHelperErrorTextContainer: View {

    let helperText: TextualContent?
    let status: MISOPinCodeInput.Status

    @Environment(\.theme) private var theme

    var body: some View {
        if !text.isEmpty {
            textView()
                .labelDefaultMedium(theme)
                .foregroundColor(color)
                .multilineTextAlignment(.leading)
                .padding(.top, theme.textInput.spacePaddingBlockTopHelperText)
        }
    }

    private var color: MultipleColorSemanticToken {
        switch status {
        case .error, .richError:
            theme.colors.contentStatusNegative
        case .enabled:
            theme.colors.contentMuted
        }
    }

    private var text: String {
        switch status {
        case let .error(message):
            message
        case let .richError(message):
            String(message.characters)
        case .enabled:
            helperText?.rawValue ?? ""
        }
    }

    private func textView() -> Text {
        switch status {
        case let .error(message):
            Text(message)
        case let .richError(message):
            Text(message)
        case .enabled:
            if let helperText {
                textView(for: helperText)
            } else {
                Text("") // Will never happen
            }
        }
    }
}
#endif
