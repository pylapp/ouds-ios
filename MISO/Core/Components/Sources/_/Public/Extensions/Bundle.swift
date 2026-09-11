// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOFoundations

extension Bundle {

    /// The MISO bundle, useful to find resources
    public static let MISOComponents = Bundle.module

    /// Loads the first  preferred localization from main Bundle or if not defined the english one
    public static var preferredLocalization: String {
        guard let firstPreferredLocalization = Bundle.main.preferredLocalizations.first else {
            OL.warning("Not able to find first preferred localization!")
            return "en"
        }
        return firstPreferredLocalization
    }
}
