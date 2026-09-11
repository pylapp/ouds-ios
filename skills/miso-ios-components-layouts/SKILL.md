---
name: miso-ios-components-layouts
description: Usage and code examples for MISO iOS Layouts components — MISOColoredSurface (color-mode tokens container) and MISOHorizontalDivider / MISOVerticalDivider. Load the miso-ios-framework-usage skill first for imports, themes and token namespaces.
license: MIT
---

# MISO Layouts components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes and token namespaces.

## Colored Surface

```swift
MISOColoredSurface(color: theme.colorModes.onStatusPositiveEmphasized) {
    // child views
}
```

---

## Divider

```swift
MISOHorizontalDivider(color: .brandPrimary)
MISOVerticalDivider(color: .brandPrimary)
```
