# Foundations

@Metadata {
    @PageImage(purpose: icon, source: "ic_folder_categories")
    @PageImage(purpose: card, source: "ic_folder_categories")
}

Some components can be used for **typography**.

## Overview

The **Foundations** family gathers primitive building blocks of the design system. Today it exposes the *Typography* components.

### Typography

@TabNavigator {
    @Tab("Wireframe") {
        ![A heading typography component in light and dark modes with Wireframe theme](component_typography_heading_Wireframe)
    }
}

Typography components render text using the semantic font tokens exposed by the current theme. 
They are the recommended way to display text inside your app since they automatically apply the right font elements.
There are 5 types: ``MISODisplay``, ``MISOHeading``, ``MISOBody``, ``MISOLabel`` and ``MISOCode``.

```swift
// Display
MISODisplay(text: "Woy!")
MISODisplay(text: "Woy!", size: .medium)

// Heading
MISOHeading(text: "Section title", size: .large, hasMarker: true)
MISOHeading(text: "Welcome to MISO", coloredText: "MISO")
MISOHeading(LocalizedStringKey("section_title"), bundle: Bundle.module, size: .xLarge)

// Body
MISOBody(text: "This is the black collar song...")
MISOBody(text: "This is the black collar song...", size: .large, weight: .strong)

// Label
MISOLabel(text: "Label")
MISOLabel(text: "Label", size: .xLarge, weight: .moderate)

// Code
MISOCode(text: "let x = 42")
```
