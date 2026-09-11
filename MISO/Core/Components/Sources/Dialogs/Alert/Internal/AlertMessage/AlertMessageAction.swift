// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct AlertMessageAction: View {

    // MARK: - Properties

    let link: MISOAlertMessage.Link?
    let onClose: (() -> Void)?

    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        HStack(alignment: .center, spacing: theme.alert.spaceColumnGapAction) {
            if let link, self.link?.position == .topTrailing {
                MISOLink(text: link.text, size: .default, action: link.action)
                    .accessibilitySortPriority(MISOAlertMessage.actionLinkAccessibilityPriority)
            }

            if let onClose {
                MISOButton(image: MISOImage(asset: Image(decorative: "Component-button-expurge", bundle: theme.resourcesBundle),
                                            accessibilityLabel: "core_alertMessage_close_a11y".localized()),
                           appearance: .minimal,
                           action: onClose)
                    .accessibilitySortPriority(MISOAlertMessage.closeButtonAccessibilityPriority)
            }
        }
    }
}
