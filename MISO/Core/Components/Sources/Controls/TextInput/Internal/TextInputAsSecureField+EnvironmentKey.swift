// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

extension EnvironmentValues {

    /// A flag to know if ``MISOTextInput`` is used as a secure field by ``MISOPasswordInput``
    @Entry var textInputAsSecureField: Bool = false
}
