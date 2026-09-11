// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if os(iOS)
@testable import MISOComponents
import Testing

/// Tests the public static constants exposed by `SelectedTabIndicator`.
struct MISOSelectedTabIndicatorTests {

    @Test func `animation duration value`() {
        #expect(SelectedTabIndicator.animationDuration == 0.2)
    }

    @Test func `async delay value`() {
        #expect(SelectedTabIndicator.asyncDelay == 0.1)
    }

    @Test func `async delay is less than animation duration`() {
        #expect(SelectedTabIndicator.asyncDelay < SelectedTabIndicator.animationDuration)
    }
}
#endif
