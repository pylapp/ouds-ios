// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if os(macOS)
import MISOComponents
import SwiftUI
import Testing

/// Tests crash scenarios for `MISOCheckboxItemIndeterminate` using Swift Testing's `#expect(exitsWith:)`.
/// These tests verify that the component correctly enforces design constraints by crashing when
/// forbidden parameter combinations are used.
///
/// **Should be run on macOS to catch the failure crash, not possible on iOS yet**
struct MISOCheckboxItemIndeterminateCrashTests {

    /// Verify that `MISOCheckboxItemIndeterminate` crashes when both `isReadOnly` and `isError` are set to `true`.
    /// This is forbidden by design as a component cannot be in both error and read-only states.
    @Test
    func `checkbox item indeterminate crashes when read only and error`() async {
        await #expect(processExitsWith: .failure) {
            let selection = MISOCheckboxIndicatorState.indeterminate
            _ = MISOCheckboxItemIndeterminate("Test",
                                              selection: .constant(selection),
                                              isError: true,
                                              isReadOnly: true)
        }
    }
}
#endif
