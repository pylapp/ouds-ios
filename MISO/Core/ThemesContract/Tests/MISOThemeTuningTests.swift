// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOThemesContract
import Testing

/// Some tests on the default theme tuning setup
struct MISOThemeTuningTests {

    // MARK: - Defaults

    @Test("The default theme tuning must not have rounded corners")
    func defaultThemeTuningRoundedCorners() {
        #expect(Tuning.default.hasRoundedButtons == false)
        #expect(Tuning.default.hasRoundedTextInputs == false)
        #expect(Tuning.default.hasRoundedAlertMessages == false)
        #expect(Tuning.default.hasRoundedProgressIndicators == false)
        #expect(Tuning.default.hasRoundedListItems == false)
    }
}
