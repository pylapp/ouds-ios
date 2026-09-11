// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOComponents
import Testing

/// Tests some API for `MISOCheckbox`
struct MISOCheckboxStateTests {

    /// A selected checkbox must be toggled to an unselected checkbox.
    @Test func toggle() {
        var selectedState = MISOCheckboxIndicatorState.selected
        selectedState.toggle()
        #expect(selectedState == MISOCheckboxIndicatorState.unselected)
    }

    /// An unselected checkbox must be toggled to a selected checkbox.
    @Test func `toggle unselected must give selected`() {
        var unselectedState = MISOCheckboxIndicatorState.unselected
        unselectedState.toggle()
        #expect(unselectedState == MISOCheckboxIndicatorState.selected)
    }

    /// An indeterminate checkbox must be toggled to a selected checkbox.
    @Test func `toggle undetermibate must give selected`() {
        var indeterminateState = MISOCheckboxIndicatorState.indeterminate
        indeterminateState.toggle()
        #expect(indeterminateState == MISOCheckboxIndicatorState.selected)
    }
}
