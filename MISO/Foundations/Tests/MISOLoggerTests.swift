// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOFoundations
import Testing

@Suite("MISOLogger Tests")
struct MISOLoggerTests {

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
