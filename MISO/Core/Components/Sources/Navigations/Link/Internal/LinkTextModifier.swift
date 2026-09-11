// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Link Text Modifier

struct LinkTextModifier: ViewModifier {

    // MARK: - Properties

    let interactionState: MISOButtonInteractionState
    let size: MISOLink.Size
    let layout: MISOLink.Layout

    @Environment(\.theme) private var theme

    // MARK: - Body

    func body(content: Content) -> some View {
        Group {
            switch size {
            case .small:
                content.labelStrongMedium(theme)
            case .default:
                content.labelStrongLarge(theme)
            }
        }
        .multilineTextAlignment(.leading)
        .modifier(LinkUnderlineModifier(interactionState: interactionState, layout: layout))
    }
}

// MARK: - Link Underline Modifier

private struct LinkUnderlineModifier: ViewModifier {

    let interactionState: MISOButtonInteractionState
    let layout: MISOLink.Layout

    @State private var textWidth: CGFloat = 0

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.underline(underlineActive, pattern: .solid)
        } else {
            if underlineActive {
                VStack(spacing: 0) {
                    content
                        .readSize { size in
                            textWidth = size.width
                        }
                    Rectangle().frame(width: textWidth, height: 1)
                }
            } else {
                content
            }
        }
    }

    private var underlineActive: Bool {
        switch layout {
        case .indicator:
            interactionState == .hover || interactionState == .pressed
        case .textOnly:
            true
        case .textAndIcon:
            interactionState == .hover || interactionState == .pressed
        }
    }
}
