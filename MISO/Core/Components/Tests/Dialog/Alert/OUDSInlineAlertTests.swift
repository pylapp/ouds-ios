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

@testable import MISOComponents
import SwiftUI
import Testing

/// Tests some values for `MISOInlineAlert` component.
struct OUDSInlineAlertTests {

    // MARK: - Default status

    @Test("Inline alert default status must be neutral with an icon")
    @MainActor func defaultStatusIsNeutralWithIcon() {
        let neutralWithIcon = MISOAlertStatus.neutral(image: MISOImage(name: "ic_heart"))
        #expect(neutralWithIcon.hasIcon, "Neutral status with a non-nil icon must report hasIcon as true")
    }

    // MARK: - hasIcon per status (drives failable AlertLeadingIcon rendering)

    @Test("Functional status positive must always have an icon")
    func positiveStatusHasIcon() {
        #expect(MISOAlertStatus.positive.hasIcon)
    }

    @Test("Functional status info must always have an icon")
    func infoStatusHasIcon() {
        #expect(MISOAlertStatus.info.hasIcon)
    }

    @Test("Functional status warning must always have an icon")
    func warningStatusHasIcon() {
        #expect(MISOAlertStatus.warning.hasIcon)
    }

    @Test("Functional status negative must always have an icon")
    func negativeStatusHasIcon() {
        #expect(MISOAlertStatus.negative.hasIcon)
    }

    // MARK: - Failable icon rendering for neutral and accent

    @Test("Neutral status without icon must not render a leading icon")
    func neutralStatusWithoutIconHasNoIcon() {
        let status = MISOAlertStatus.neutral(image: nil)
        #expect(!status.hasIcon, "Neutral status with nil icon must report hasIcon as false, preventing icon rendering")
    }

    @MainActor @Test("Neutral status with icon must render a leading icon")
    func neutralStatusWithIconHasIcon() {
        let status = MISOAlertStatus.neutral(image: MISOImage(name: "ic_heart"))
        #expect(status.hasIcon, "Neutral status with non-nil icon must report hasIcon as true, allowing icon rendering")
    }

    @Test("Accent status without icon must not render a leading icon")
    func accentStatusWithoutIconHasNoIcon() {
        let status = MISOAlertStatus.accent(image: nil)
        #expect(!status.hasIcon, "Accent status with nil icon must report hasIcon as false, preventing icon rendering")
    }

    @MainActor @Test("Accent status with icon must render a leading icon")
    func accentStatusWithIconHasIcon() {
        let status = MISOAlertStatus.accent(image: MISOImage(name: "ic_heart"))
        #expect(status.hasIcon, "Accent status with non-nil icon must report hasIcon as true, allowing icon rendering")
    }
}
