// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if os(macOS)
import MISOComponents
import SwiftUI
import Testing

/// Tests crash scenarios for `MISOCheckboxItem` using Swift Testing's `#expect(exitsWith:)`.
/// These tests verify that the component correctly enforces design constraints by crashing when
/// forbidden parameter combinations are used.
///
/// **Should be run on macOS to catch the failure crash, not possible on iOS yet**
struct MISOCheckboxItemCrashTests {

    /// Verify that `MISOCheckboxItem` crashes when both `isReadOnly` and `isError` are set to `true`.
    /// This is forbidden by design as a component cannot be in both error and read-only states.
    @Test
    func `checkbox item crashes when read only and error`() async {
        await #expect(processExitsWith: .failure) {
            _ = MISOCheckboxItem("Test",
                                 isOn: .constant(false),
                                 isError: true,
                                 isReadOnly: true)
        }
    }
}
#endif
