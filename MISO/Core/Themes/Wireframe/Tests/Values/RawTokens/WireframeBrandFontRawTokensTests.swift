// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOThemesWireframe
import Testing

/// The aim of this tests class is to look for regressions in **Wriframe brand font raw tokens**.
///
/// Because these values will be at least generated through an external tool, is it not relevant to test each token values.
/// Indeed, each future generation of Swift code may break these tests because there are new values.
/// However, in the semantics of **Wireframe brand font raw tokens**, there will be some unchanged things like relationships between tokens.
struct WireframeBrandFontRawTokensTests {

    @Test func wireframeBrandFontRawTokenFontFamilyBrandDefault() throws {
        #expect(WireframeBrandFontRawTokens.familyDefault == "Shantell Sans")
    }
}
