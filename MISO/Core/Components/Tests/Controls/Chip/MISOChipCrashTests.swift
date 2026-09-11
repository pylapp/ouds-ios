// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if os(macOS)
import MISOComponents
import SwiftUI
import Testing

/// Tests crash scenarios for chip components using Swift Testing's `#expect(exitsWith:)`.
/// These tests verify that the components correctly enforce design constraints by crashing when
/// forbidden parameter combinations or values are used.
///
/// **Should be run on macOS to catch the failure crash, not possible on iOS yet**
struct MISOChipCrashTests {

    /// Verify that `MISOFilterChip` crashes when text parameter is empty.
    /// An empty text is forbidden by design.
    @Test
    func `filter chip crashes with empty text`() async {
        await #expect(processExitsWith: .failure) {
            _ = MISOFilterChip(text: "") {}
        }
    }

    /// Verify that `MISOSuggestionChip` crashes when text parameter is empty.
    /// An empty text is forbidden by design.
    @Test
    func `suggestion chip crashes with empty text`() async {
        await #expect(processExitsWith: .failure) {
            _ = MISOSuggestionChip(text: "") {}
        }
    }
}
#endif
