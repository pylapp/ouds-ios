// swift-tools-version: 6.3

// Software Name: MISO iOS
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.

import PackageDescription

/// Exposing MISO through a Swift Package is a good start.
/// Expose it through Pod or XCFramework should be investigated later.
/// Defining here hierarchy between targets will prevent us to have cyclic dependencies and help to have separated responsibilities.
let package = Package(

    // MARK: - Package setup

    name: "MISO",
    defaultLocalization: "en",
    platforms: [.iOS(.v15) /* and also iPadOS v15 */, .macOS(.v13), .visionOS(.v1), .watchOS(.v11), .tvOS(.v16)],

    // MARK: - Products

    // Products define the executables and libraries a package produces, making them visible to other packages.
    products: [

        // MARK: Umbrella products

        // Umbrella library to improve Developer eXperience and let users use MISO in only one import

        // Embeds all libraries and all themes
        .library(
            name: "MISO",
            targets: ["MISO"]),

        // MARK: Atomic products

        .library(
            name: "MISOThemesContract",
            targets: ["MISOThemesContract"]),
        .library(
            name: "MISOModules",
            targets: ["MISOModules"]),
        .library(
            name: "MISOComponents",
            targets: ["MISOComponents"]),
        .library(
            name: "MISOTokensComponent",
            targets: ["MISOTokensComponent"]),
        .library(
            name: "MISOTokensSemantic",
            targets: ["MISOSTokensRaw"]),
        .library(
            name: "MISOTokensRaw",
            targets: ["MISOTokensRaw"]),
        .library(
            name: "MISOFoundations",
            targets: ["MISOFoundations"]),
    ],

    // MARK: - Dependencies

    dependencies: [

        // MARK: Tooling dependencies

        // Apple Swift tool to build documentation
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", exact: "1.5.0"),
        // Linter for Swift code
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", exact: "0.65.1"),
        // Formatter for Swift code
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.63.0"),
    ],

    // MARK: - Targets

    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    targets: [

        // MARK: Umbrella targets

        .target(
            name: "MISO",
            dependencies: [
                "MISOThemesWireframe",
                "MISOThemesContract",
                "MISOModules",
                "MISOComponents",
                "MISOTokensComponent",
                "MISOTokensSemantic",
                "MISOTokensRaw",
                "MISOFoundations",
            ],
            path: "MISO/exported/MISO/Sources"),

        // MARK: Atomic targets

        .target(
            name: "MISOThemesWireframe",
            dependencies: ["MISOThemesContract"],
            path: "MISO/Core/Themes/Wireframe/Sources",
            resources: [.process("Resources/")]),
        .testTarget(
            name: "MISOThemesWirefame-Tests",
            dependencies: ["TestsUtils", "MISOThemesWireframe"],
            path: "MISO/Core/Themes/Wireframe/Tests"),

        .target(
            name: "MISOThemesContract",
            dependencies: ["MISOTokensRaw", "MISOTokensSemantic", "MISOTokensComponent"],
            path: "MISO/Core/ThemesContract/Sources"),
        .testTarget(
            name: "MISOThemesContract-Tests",
            dependencies: ["MISOThemesContract", "TestsUtils"],
            path: "MISO/Core/ThemesContract/Tests"),

        .target(
            name: "MISOModules",
            dependencies: ["MISOComponents"],
            path: "MISO/Modules/Sources"),

        .target(
            name: "MISOComponents",
            dependencies: ["MISOTokensComponent", "MISOThemesContract"],
            path: "MISO/Core/Components/Sources",
            resources: [.process("_/Resources/")]),
        .testTarget(
            name: "MISOComponents-Tests",
            dependencies: ["MISOComponents"],
            path: "MISO/Core/Components/Tests"),

        .target(
            name: "MISOTokensComponent",
            dependencies: ["MISOTokensSemantic"],
            path: "MISO/Core/Tokens/ComponentTokens/Sources"),

        .target(
            name: "MISOTokensSemantic",
            dependencies: ["MISOTokensRaw"],
            path: "MISO/Core/Tokens/SemanticTokens/Sources"),
        .testTarget(
            name: "MISOTokensSemantic-Tests",
            dependencies: ["MISOTokensSemantic"],
            path: "MISO/Core/Tokens/SemanticTokens/Tests"),

        .target(
            name: "MISOTokensRaw",
            dependencies: ["MISOFoundations"],
            path: "MISO/Core/Tokens/RawTokens/Sources"),
        .testTarget(
            name: "MISOTokensRaw-Tests",
            dependencies: ["TestsUtils", "MISOTokensRaw"],
            path: "MISO/Core/Tokens/RawTokens/Tests"),

        .target(
            name: "MISOFoundations",
            path: "MISO/Foundations/Sources"),
        .testTarget(
            name: "MISOFoundations-Tests",
            dependencies: ["MISOFoundations"],
            path: "MISO/Foundations/Tests"),
        .target(
            name: "TestsUtils",
            dependencies: ["MISOFoundations"],
            path: "MISO/Foundations/TestsUtils"),
    ],

    // MARK: - Swift language modes

    swiftLanguageModes: [.v6])
