# Indicators

@Metadata {
    @PageImage(purpose: icon, source: "ic_folder_categories")
    @PageImage(purpose: card, source: "ic_folder_categories")
}

Some components can be used for **indicators**.

## Overview

### Badge

The badge is a small UI element used to highlight status, notifications, or categorization within an interface.

#### Badge Count

@TabNavigator {
    @Tab("Wireframe") {
        ![A count badge component in light and dark modes with Wireframe theme](component_badge_count_Wireframe)
    }
}
 
An ``MISOBadgeCount`` displays an integer value.

```swift            
// Neutral badge in medium size with an image
MISOBadgeIcon(status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"), accessibilityLabel: "Like"), size: .medium))
```

#### Badge Icon

@TabNavigator {
    @Tab("Wireframe") {
        ![An icon badge component in light and dark modes with Wireframe theme](component_badge_icon_Wireframe)
    }
}

An ``MISOBadgeIcon`` displays only an icon and has specific colors.

```swift            
// Neutral badge in medium size with an image
MISOBadgeIcon(status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"), accessibilityLabel: "Like"), size: .medium))
```

#### Badge Standard

@TabNavigator {
    @Tab("Wireframe") {
        ![A standard badge component in light and dark modes with Wireframe theme](component_badge_standard_Wireframe)
    }
}

An ``MISOBadgeStandard`` is an empty badge like a coloured pastille.

```swift            
// Info badge in medium size without information
MISOBadgeStandard(status: .info, size: .medium)
```

### Progress Indicators

#### Circular Progress Indicator

@TabNavigator {
    @Tab("Wireframe") {
        @Video(source: "component_progress_indicator_circular_Wireframe.video")
    }
}

An ``MISOCircularProgressIndicator`` is a progress indicator which can be used to display determinate value or indeterminate value with animations.

```swift            
// A circular gauge filled at 75% in neutral color with a track displayed with an animation
MISOCircularProgressIndicator(progress: 0.75, status: .neutral)

// A circular gauge without defined value and an accent color
MISOCircularProgressIndicator(status: .accent)
```

#### Linear Progress Indicator

@TabNavigator {
    @Tab("Wireframe") {
        @Video(source: "component_progress_indicator_linear_Wireframe.video")
    }
}

An ``MISOLinearProgressIndicator`` is a horizontal progress indicator which can be used to display determinate value or indeterminate value animations.

```swift
// A horizontal bar filled at 75% in neutral color with a track and reveal animation
MISOLinearProgressIndicator(progress: 0.75, status: .neutral)

// A horizontal bar without defined value and an accent color
MISOLinearProgressIndicator(status: .accent)

// A horizontal bar with a helper text center aligned, a stop indicator (determinate only) and no animations
MISOLinearProgressIndicator(progress: 0.5, stopIndicator: true, helperText: .description("Uploading…"), animated: false)

// A horizontal bar with a helper text with progress information start aligned
// The percentage rendering (symbol, spacing, position) follows the localized wording key
// `core_progressIndicator_percent_value` (e.g. "75%" in English, "75 %" in French, "٪75" in Arabic).
MISOLinearProgressIndicator(progress: 0.5, helperText: .percent(description: "Uploading…", alignment: .start))

// An indeterminate horizontal bar with a helper text start aligned 
MISOLinearProgressIndicator(status: .info, helperText: "Processing…", helperTextAlignment: .start)
```

### Tag

@TabNavigator {
    @Tab("Wireframe") {
        ![A tag component in light and dark modes with Wireframe theme](component_tag_Wireframe)
    }
}

An ``MISOTag`` is a small element that shows short information like a label, keyword, or category. It helps users quickly find, group, or understand content.

```swift            
// Text only with neutral status, for emphasized appearance with rounded shape in default size
MISOTag(label: "Label",  status: .neutral(), appearance: .emphasized, shape: .rounded, size: .default)
// Or also
MISOTag(label: "Label")
            
// Tag with negative status with bullet
MISOTag(label: "Label", status: .negative(leading: .bullet)
            
// Tag with neutral status with a custom decorative icon
MISOTag(label: "Label", status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"))))
// Flip the icon for RTL layouts using MISOImage.flipped
MISOTag(label: "Label", status: .neutral(image: MISOImage(asset: Image(decorative: "ic_heart"), flipped: true)))

// Tag with neutral status with a raw image (not tinted)
MISOTag(label: "Label", status: .neutral(image: MISOImage(asset: Image("ic_brand"), renderingMode: .original)))

// Tag with accent status with a raw image (not tinted)
MISOTag(label: "Label", status: .accent(image: MISOImage(asset: Image("ic_brand"), renderingMode: .original)))
            
// Text with neutral status with bullet
MISOTag(label: "Label", status: .neutral(bullet: true))
            
// Tag with indeterminate circular progress indicator, with rounded shape in small size
MISOTag(loadingLabel: "Processing...", shape: .rounded, size: .small)

// Tag with determinate circular progress indicator, with rounded shape in default size
MISOTag(loadingLabel: "Processing...", progress: 0.75)
```

### Input Tag

@TabNavigator {
    @Tab("Wireframe") {
        ![An input tag component in light and dark modes with Wireframe theme](component_inputTag_Wireframe)
    }
}

An ``MISOInputTag`` is a small element that shows short information like a label, keyword, or category, which can be removed or changed on tap.

```swift    
// Create an input tag
MISOInputTag("Label") {
    // Do something, usually remove itself from a list
}
    
// Show in a list and remove when clicked
var names: [String] = [ "Foo", "Bar", "Wizz" ]
    
ForEach(names, id: \.self) { name in
    MISOInputTag(label: name) {
        if let index = names.firstIndex(of: name) {
            names.remove(at: index)
        }
    }
}
```
