---
name: miso-ios-components-content-display
description: Usage and code examples for MISO iOS Content Display components — MISOBulletList (unordered, ordered, nested items, AttributedString labels). Load the miso-ios-framework-usage skill first for imports, themes, and shared rules.
license: MIT
---

# MISO Content Display components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes and shared rules.

## MISOBulletList

```swift
MISOBulletList {
    MISOBulletList.Item("Label 1")
    MISOBulletList.Item("Label 2")
}

MISOBulletList(type: .ordered) {
    MISOBulletList.Item("Label 1") { MISOBulletList.Item("Label 1.1") }
}

MISOBulletList { MISOBulletList.Item(AttributedString(…)) }
```
