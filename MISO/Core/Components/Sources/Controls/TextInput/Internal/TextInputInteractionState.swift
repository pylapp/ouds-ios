// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation

enum TextInputInteractionState {
    case idle
    case focused
    case hover

    init(focused: Bool, hover: Bool) {
        if focused {
            self = .focused
        } else {
            if hover {
                self = .hover
            } else {
                self = .idle
            }
        }
    }
}
