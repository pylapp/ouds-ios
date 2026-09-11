---
name: miso-ios-components-actions
description: Usage and code examples for MISO iOS Action components — MISOButton (text, icon, loading state, text+icon, icon-only with accessibility label). Load the miso-ios-framework-usage skill first for imports, themes, tokens, and image rules.
license: MIT
---

# MISO Actions components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes,
> token usage and image rules (`MISOImage`, `// swiftlint:disable:next accessibility_label_for_image`).

## MISOButton

```swift
MISOButton(text: "Label", appearance: .default) {}
MISOButton(text: "Label", appearance: .default, style: .loading()) {}
MISOButton(text: "Label", icon: Image("ic"), appearance: .default, size: .small) {}
MISOButton(icon: Image("ic"), accessibilityLabel: "Label", size: .small) {}
```
