---
name: miso-ios-components-foundations
description: Usage and code examples for MISO iOS Foundations components — Typography (MISODisplay, MISOHeading, MISOBody, MISOLabel, MISOCode). Load the miso-ios-framework-usage skill first for imports, themes and image rules.
license: MIT
---

# MISO Foundations components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes and shared rules.

## Typography

## Display

Three sizes for `MISODisplay`: `.large` (default), `.medium`, `.small`.
Four sizes for `MISOHeading`: `.xLarge`, `.large` (default), `.medium`, `.small`.
Three sizes for `MISOBody`: `.large`, `.medium` (default), `.small`.
Four sizes for `MISOLabel`: `.xLarge`, `.large`, `.medium` (default), `.small`
Three weights for `MISOBody` and `MISOLabel`: `.default` (default), `.moderate`, `.strong`.

```swift
MISODisplay(text: "Welcome")
MISODisplay(text: "Welcome", size: .medium)
MISODisplay(LocalizedStringKey("welcome_title"), bundle: .module, size: .small)

MISOHeading(text: "Title")
MISOHeading(text: "Sub-section", size: .medium)
MISOHeading(LocalizedStringKey("section_title"), bundle: .module, size: .xLarge)

MISOBody(text: "Lorem ipsum dolor sit amet.")
MISOBody(text: "Lorem ipsum", size: .large, weight: .strong)
MISOBody(LocalizedStringKey("body_content"), bundle: .module, size: .small, weight: .moderate)

MISOLabel(text: "Label")
MISOLabel(text: "Label", size: .xLarge, weight: .strong)
MISOLabel(LocalizedStringKey("label_key"), bundle: .module, size: .small, weight: .moderate)

MISOCode(text: "let x = 42")
MISOCode(LocalizedStringKey("code_sample"), bundle: .module)
```

`MISOHeading` can have *marker*. `hasMarker: true` draws a small brand-coloured marker below the text — only when:
- `size == .large`, AND
- the current theme supports it (`theme.typography.headingLargeMarker == true`, e.g. Wireframe).

A dedicated initializer takes a `coloredText: String` sub-string rendered with `theme.colors.contentBrandSecondary`. 
Useful to emphasise a specific word (typically a brand name). Works on themes that do not support the marker.
