// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOTokensSemantic
import SwiftUI

struct TextInputLeadingIconContainer: View {

    // MARK: - Properties

    let leadingIcon: MISOImage?
    let status: MISOTextInput.Status

    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        leadingIcon?.asset?
            .resizable()
            .renderingMode(leadingIcon?.renderingMode ?? .template)
            .aspectRatio(contentMode: .fit)
            .frame(height: theme.textInput.sizeLeadingIcon, alignment: .center)
            .foregroundColor(color)
            .toFlip(leadingIcon?.flipped ?? false)
            .accessibilityHidden(true)
    }

    // MARK: - Helper

    private var color: MultipleColorSemanticToken {
        switch status {
        case .enabled, .error, .richError, .loading, .readOnly:
            theme.colors.contentMuted
        case .disabled:
            theme.colors.actionDisabled
        }
    }
}
#endif
