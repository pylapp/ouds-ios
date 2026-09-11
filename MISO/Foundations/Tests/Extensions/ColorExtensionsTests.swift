// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI
import Testing

// swiftlint:disable force_unwrapping

/// To test some extensions of `SwiftUI.Color`
struct ColorExtensionsTests {

    // See https://github.com/Orange-OpenSource/miso-ios/issues/667
    #if !os(iOS)
    private static let doesRunOniOS = false
    #else
    private static let doesRunOniOS = true
    #endif

    @Test(.enabled(if: Self.doesRunOniOS))
    func initWithHexadecimalValue() throws {

        // White
        let pureWhite = Color(hexadecimalCode: "#FFFFFF")!
        #expect(pureWhite == Color.white)

        // Black
        let pureBlack = Color(hexadecimalCode: "#000000")!
        #expect(pureBlack == Color.black)

        // Color form palette
        let malachite500 = Color(hexadecimalCode: "#3DE35A")!
        #expect((malachite500.rgba!.red * 255).rounded() == 61, "Value is instead '\(malachite500.rgba!.red)'")
        #expect((malachite500.rgba!.green * 255).rounded() == 227, "Value is instead '\(malachite500.rgba!.green)'")
        #expect((malachite500.rgba!.blue * 255).rounded() == 90, "Value is instead '\(malachite500.rgba!.blue)'")

        // Color with transparency
        let white500 = Color(hexadecimalCode: "#FFFFFF52")!
        #expect((white500.rgba!.red * 255).rounded() == 255, "Value is instead '\(white500.rgba!.red)'")
        #expect((white500.rgba!.green * 255).rounded() == 255, "Value is instead '\(white500.rgba!.green)'")
        #expect((white500.rgba!.blue * 255).rounded() == 255, "Value is instead '\(white500.rgba!.blue)'")
        #expect((white500.rgba!.alpha * 255).rounded() == 82, "Value is instead '\(white500.rgba!.alpha)'")
        /*
         white500 is white with _500.
         In base 16, white is #FFFFFF and _500 adds 52 suffix.
         FF in base 16 is 255 in base 10, and 52 in base 16 is 82 in base 10.
         So, #FFFFFF52 is RGBA(255, 255, 255, 82)
         */
    }
}

// swiftlint:enable force_unwrapping
