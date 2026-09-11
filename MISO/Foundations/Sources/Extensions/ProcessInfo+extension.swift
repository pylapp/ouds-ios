// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation

extension ProcessInfo {

    /// Flag saying if the current environment is the Xcode Preview (true) or not (false)
    public static var doesRunOnXcodePreview: Bool {
        #if DEBUG
        processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        #else
        false
        #endif
    }
}
