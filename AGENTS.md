---
type: ai-agent-guide
framework: MISO-iOS
language: Swift
ui-framework: SwiftUI
platforms: [iOS, iPadOS, macOS, visionOS, watchOS, tvOS]
min-deployment: iOS 15.0
---

# MISO iOS - AI Agent Guide

MISO (Orange Unified Design System) is a Swift Package providing design tokens, themes and SwiftUI components for Orange Group products.
The demo application is called "Design System Toolbox".
The project is open source (MIT) at https://github.com/Orange-OpenSource/miso-ios.
Target platforms: iOS 15, iPadOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16. Language: Swift 6 / SwiftUI.

## Skills

Load skills on demand for detailed guidance:

Framework:
- **`miso-ios-framework-usage`** — setup and shared reference: imports, themes, token namespaces, view modifiers, image rules, shared control patterns, custom fonts. Load this first when any MISO code is involved.

Components:
- **`miso-ios-components-actions`** — MISOButton
- **`miso-ios-components-content-display`** — MISOBulletList
- **`miso-ios-components-controls`** — Checkbox, Radio, Switch, Chips, PinCodeInput, PasswordInput, TextInput, TextArea
- **`miso-ios-components-dialogs`** — MISOAlertMessage, MISOInlineAlert
- **`miso-ios-components-foundations`** — Typography (MISODisplay, MISOHeading, MISOBody, MISOLabel, MISOCode)
- **`miso-ios-components-indicators`** — MISOBadge, MISOTag, MISOInputTag, MISOCircularProgressIndicator
- **`miso-ios-components-layouts`** — MISOColoredSurface, MISOHorizontalDivider, MISOVerticalDivider
- **`miso-ios-components-navigations`** — MISOLink, MISOTabBar, Toolbars (MISOToolBarItem, `toolBarTop`, `toolBarBottom`)

Guides:
- **`miso-ios-guide-vocabulary`** — glossary of MISO-specific terms (tokenator, token types, theme, …)
- **`miso-ios-guide-create-theme`** — step-by-step guide to create a custom MISO theme (subclass OrangeTheme, from scratch on MISOTheme, mix of providers, local fonts)

## Key files

| File | Purpose |
|------|---------|
| `.github/copilot-instructions.md` | Architecture, build commands, best practices, accessibility, ecodesign, review checklist |
| `Package.swift` | Swift Package manifest — targets, products, dependencies |
| `.swiftformat` / `.swiftlint.yml` | Code style configuration |

## Critical rules

- Always load the **`miso-ios-guide-vocabulary`** skill before discussing tokens or themes.
- Always load the **`miso-ios-framework-usage`** skill first before writing or reviewing any code that uses MISO. Then also load the matching **`miso-ios-components-<family>`** skill (`actions`, `content-display`, `controls`, `dialogs`, `foundations`, `indicators`, `layouts`, `navigations`) for the specific component family you are working with.
- Always load the **`miso-ios-guide-create-theme`** skill when the user wants to create a custom MISO theme or brand theme.
- Before committing: format → build → fix errors → run tests → lint (see `.github/copilot-instructions.md` §3).
- Use `#available` for iOS 26 SDK APIs (min deployment is iOS 15).
- Use `#if os(…)` for platform-specific code.
- Never use UIKit unless strictly required for an accessibility API.
