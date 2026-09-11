// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import MISOTokensRaw
import MISOTokensSemantic
import SwiftUI
import Testing

// swiftlint:disable type_name

/// Check if the semantic tokens provider for color mode tokens under test as the good rules implementations
struct WireframeThemeColorModeSemanticTokensProviderTests {

    private var provider: WireframeThemeColorModeSemanticTokensProvider

    init() {
        provider = WireframeThemeColorModeSemanticTokensProvider()
    }

    // MARK: - Types

    @Test func typeOfProviders() throws {
        #expect(provider.colors is WireframeThemeColorSemanticTokensProvider)
    }

    // MARK: - Tests for useColorScheme

    @Test func useColorSchemeAndReverse() throws {
        // Given
        let onStatusNegativeEmphasizedLight = ColorModeRawTokens.monochromeDark
        let onStatusNegativeEmphasizedDark = ColorModeRawTokens.monochromeLight
        let onStatusNegativeEmphasized = MultipleColorModeSemanticToken("Doll",
                                                                        light: onStatusNegativeEmphasizedLight,
                                                                        dark: onStatusNegativeEmphasizedDark)

        // When
        let colorSchemeToApplyWhenLight: ColorScheme = provider.useColorScheme(for: onStatusNegativeEmphasized, .light)
        let colorSchemeToApplyWhenDark: ColorScheme = provider.useColorScheme(for: onStatusNegativeEmphasized, .dark)

        // Then
        #expect(colorSchemeToApplyWhenLight == .dark)
        #expect(colorSchemeToApplyWhenDark == .light)
    }

    @Test func useColorSchemeAndForceLight() throws {
        // Given
        let onStatusInfoEmphasizedLight = ColorModeRawTokens.monochromeLight
        let onStatusInfoEmphasizedDark = ColorModeRawTokens.monochromeLight
        let onStatusInfoEmphasized = MultipleColorModeSemanticToken("Dagga",
                                                                    light: onStatusInfoEmphasizedLight,
                                                                    dark: onStatusInfoEmphasizedDark)

        // When
        let colorSchemeToApplyWhenLight: ColorScheme = provider.useColorScheme(for: onStatusInfoEmphasized, .light)
        let colorSchemeToApplyWhenDark: ColorScheme = provider.useColorScheme(for: onStatusInfoEmphasized, .dark)

        // Then
        #expect(colorSchemeToApplyWhenLight == .light)
        #expect(colorSchemeToApplyWhenDark == .light)
    }

    @Test func useColorSchemeAndForceDark() throws {
        // Given
        let onStatusInfoBazingaLight = ColorModeRawTokens.monochromeDark
        let onStatusInfoBazingaDark = ColorModeRawTokens.monochromeDark
        let onStatusInfoBazinga = MultipleColorModeSemanticToken("Buzz-Buzz",
                                                                 light: onStatusInfoBazingaLight,
                                                                 dark: onStatusInfoBazingaDark)

        // When
        let colorSchemeToApplyWhenLight: ColorScheme = provider.useColorScheme(for: onStatusInfoBazinga, .light)
        let colorSchemeToApplyWhenDark: ColorScheme = provider.useColorScheme(for: onStatusInfoBazinga, .dark)

        // Then
        #expect(colorSchemeToApplyWhenLight == .dark)
        #expect(colorSchemeToApplyWhenDark == .dark)
    }

    @Test func useColorSchemeAndKeepCurrent() throws {
        // Given
        let onStatusAccentMutedLight = ColorModeRawTokens.light
        let onStatusAccentMutedDark = ColorModeRawTokens.dark
        let onStatusAccentMuted = MultipleColorModeSemanticToken("Ziggety",
                                                                 light: onStatusAccentMutedLight,
                                                                 dark: onStatusAccentMutedDark)

        // When
        let colorSchemeToApplyWhenLight: ColorScheme = provider.useColorScheme(for: onStatusAccentMuted, .light)
        let colorSchemeToApplyWhenDark: ColorScheme = provider.useColorScheme(for: onStatusAccentMuted, .dark)

        // Then
        #expect(colorSchemeToApplyWhenLight == .light)
        #expect(colorSchemeToApplyWhenDark == .dark)
    }

    // MARK: - Tests for isMonochrome

    @Test func isMonochromeWithoutNone() throws {
        // Given
        let onStatusAccentMutedLight = ColorModeRawTokens.light
        let onStatusAccentMutedDark = ColorModeRawTokens.dark
        let onStatusAccentMuted = MultipleColorModeSemanticToken("Zag",
                                                                 light: onStatusAccentMutedLight,
                                                                 dark: onStatusAccentMutedDark)

        // When
        let isMonochrome: Bool = provider.isMonochrome(mode: onStatusAccentMuted)

        // Then
        #expect(isMonochrome == false)
    }

    @Test func isMonochromeWithOnlyLight() throws {
        // Given
        let modeSomeLight = ColorModeRawTokens.monochromeLight
        let modeSomeDark = ColorModeRawTokens.dark
        let modeSome = MultipleColorModeSemanticToken("Buzz",
                                                      light: modeSomeLight,
                                                      dark: modeSomeDark)

        // When
        let isMonochrome: Bool = provider.isMonochrome(mode: modeSome)

        // Then
        #expect(isMonochrome == false)
    }

    @Test func isMonochromeWithOnlyDark() throws {
        // Given
        let modeSomeLight = ColorModeRawTokens.light
        let modeSomeDark = ColorModeRawTokens.monochromeDark
        let modeSome = MultipleColorModeSemanticToken("Buzz",
                                                      light: modeSomeLight,
                                                      dark: modeSomeDark)

        // When
        let isMonochrome: Bool = provider.isMonochrome(mode: modeSome)

        // Then
        #expect(isMonochrome == false)
    }

    @Test func isMonochromeWithBoth() throws {
        // Given
        let modeSomeLight = ColorModeRawTokens.monochromeLight
        let modeSomeDark = ColorModeRawTokens.monochromeDark
        let modeSome = MultipleColorModeSemanticToken("Buzz",
                                                      light: modeSomeLight,
                                                      dark: modeSomeDark)

        // When
        let isMonochrome: Bool = provider.isMonochrome(mode: modeSome)

        // Then
        #expect(isMonochrome == true)
    }
}

// swiftlint:enable type_name
