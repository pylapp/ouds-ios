// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import SwiftUI

// MARK: - Checkbox Background Color

struct CheckboxBackgroundColorModifier: ViewModifier {

    // MARK: Properties

    var interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        switch interactionState {
        case .enabled, .disabled, .readOnly:
            content
        case .hover:
            content.background(theme.listItem.colorBgHover)
                .clipShape(RoundedRectangle(cornerRadius: theme.listItem.borderRadiusItemOnly))
        case .pressed:
            content.background(theme.listItem.colorBgPressed)
                .clipShape(RoundedRectangle(cornerRadius: theme.listItem.borderRadiusItemOnly))
        }
    }
}
