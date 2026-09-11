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

@testable import MISOFoundations
import Testing

@Suite("MISOLogger Tests")
struct OUDSLoggerTests {

    @Test("verbose flag is false by default")
    func verboseFlagDefaultValue() {
        // The documented default is false; verify without resetting first
        // so we can detect if the declaration default were ever changed.
        #expect(MISOLogger.verbose == false)
    }

    @Test("verbose flag can be toggled by consumers")
    func verboseFlagCanBeChanged() {
        defer { MISOLogger.verbose = false } // Always restore, even on failure
        MISOLogger.verbose = true
        #expect(MISOLogger.verbose == true)
        MISOLogger.verbose = false
        #expect(MISOLogger.verbose == false)
    }
}
