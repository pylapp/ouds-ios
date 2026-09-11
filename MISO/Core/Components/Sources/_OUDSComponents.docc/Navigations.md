# Navigations

@Metadata {
    @PageImage(purpose: icon, source: "ic_folder_categories")
    @PageImage(purpose: card, source: "ic_folder_categories")
}

Some components can be used for **navigation**.

## Overview

### Links

@TabNavigator {
    @Tab("Wireframe") {
        ![A link component in light and dark modes with Wireframe theme](component_link_Wireframe)
    }
}

The ``MISOLink`` proposes layout with text only or text with icon.
It also proposes layout to navigate forward, backward and outside the app.
The link can be displayed in `small` or `default` size.

```swift        
// Text in small size, with next indicator
MISOLink(text: "Feedback", indicator: .next, size: .small) { /* the action to process */ }

// Text and icon in default size
MISOLink(text: "Feedback", image: MISOImage(asset: Image("ic_heart")), size: .default) {}

// Text and raw icon (not tinted)
MISOLink(text: "Brand", image: MISOImage(asset: Image("ic_brand"), renderingMode: .original), size: .default) {}

// Navigate to previous page with link in a default size
MISOLink(text: "Back", indicator: .previous, size: .default) { /* the action to process */ }

// Navigate to outside the app with link in a default size
MISOLink(text: "Open outside", indicator: .external, size: .default) { /* the action to process */ }
```

### List items

The ``MISOStaticListItem`` displays a non-interactive row of information, while ``MISONavigationListItem`` adds tap interaction and a navigation affordance indicator (chevron or external link icon).

Both components use an ``MISOListItemData`` model for their textual content, and accept optional leading and trailing elements.

#### Static list item

Use ``MISOStaticListItem`` when the row is display-only and should not trigger any action or navigation.

@TabNavigator {
    @Tab("Wireframe") {
        ![A list item component in light and dark modes with Wireframe theme](component_static_list_item_Wireframe)
    }
}


```swift
// Simple list item with a label only
MISOStaticListItem(data: MISOListItemData(label: "Label"))

// List item with full textual content
MISOStaticListItem(data: MISOListItemData(
    label: "Label",
    hasBoldLabel: true,
    description: "Description",
    overline: "Overline",
    extraLabel: "Extra label",
    helperText: "Helper text providing guidance"
))

// List item with a leading icon and a trailing badge
let icon = MISOListItemIcon(status: .info, description: "", size: .medium)

MISOStaticListItem(
    data: MISOListItemData(label: "Notifications"),
    leading: .icon(icon),
    trailing: .badge(.count(.init(3, accessibilityLabel: "3 notifications", status: .negative, size: .medium)))
)

// List item with a leading image (static asset)
MISOStaticListItem(
    data: MISOListItemData(label: "Product"),
    leading: .image(MISOListItemImage(asset: Image("product_thumb"), size: .medium))
)

// List item with a leading async image (from URL)
MISOStaticListItem(
    data: MISOListItemData(label: "Remote Product"),
    leading: .image(MISOListItemImage(asyncImage: AsyncImage(url: URL(string: "https://example.com/image.png")), description: "Product image", size: .medium))
)

// List item with async image and custom placeholder
let asyncImageWithPlaceholder = AsyncImage(url: URL(string: "https://example.com/image.png")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}

MISOStaticListItem(
    data: MISOListItemData(label: "Loading Product"),
    leading: .image(MISOListItemImage(asyncImage: asyncImageWithPlaceholder, description: "Product image", size: .medium))
)

// List item with a trailing image
MISOStaticListItem(
    data: MISOListItemData(label: "Status"),
    trailing: .image(MISOListItemImage(asset: Image("status_icon"), size: .small))
)

// List item with slot (displayed under texts, before helper text)
MISOStaticListItem(
    data: MISOListItemData(
        label: "With slot",
        textSlot: .init { Text("Additional content") },
        helperText: "Helper text"
    )
)

// List item with bottom slot (displayed under main content, before helper text)
MISOStaticListItem(
    data: MISOListItemData(
        label: "With bottom slot",
        bottomSlot: .init { Text("Bottom content") },
        helperText: "Helper text"
    )
)

// List item with both slot and bottomSlot
MISOStaticListItem(
    data: MISOListItemData(
        label: "Label",
        textSlot: .init { Text("Slot content") },
        bottomSlot: .init { Text("Bottom content") },
        helperText: "Helper text"
    )
)
```

#### Navigable list item

Use ``MISONavigationListItem`` when tapping the row should trigger an action. The ``MISONavigationListItemIndicatorType`` defines the visual indicator shown:

@TabNavigator {
    @Tab("Wireframe") {
        ![A list item component in light and dark modes with Wireframe theme](component_navigation_list_item_Wireframe)
    }
}

```swift
// Forward navigation (default)
MISONavigationListItem(
    data: MISOListItemData(label: "Next screen")
) {
    // Navigate to next screen
}

// External navigation
MISONavigationListItem(
    data: MISOListItemData(label: "Open website"),
    indicatorType: .external
) {
    openURL(url)
}

// Backward navigation
MISONavigationListItem(
    data: MISOListItemData(label: "Go back"),
    indicatorType: .previous
) {
    // Navigate back
}

// With a leading avatar and a trailing text
let avatar = MISOListItemAvatar(type: .icon, size: .medium)

MISONavigationListItem(
    data: MISOListItemData(label: "Profile", description: "View your profile"),
    leading: .avatar(avatar),
    trailing: .text(.labelMuted("Details"))
) {
    // Navigate to profile
}

// With a leading async image loaded from URL
MISONavigationListItem(
    data: MISOListItemData(label: "Product", description: "View product details"),
    leading: .image(MISOListItemImage(asyncImage: AsyncImage(url: URL(string: "https://example.com/product.png")), description: "Product thumbnail", size: .medium))
) {
    // Navigate to product
}

// With async image and custom placeholder
let asyncImageWithPlaceholder = AsyncImage(url: URL(string: "https://example.com/product.png")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}

MISONavigationListItem(
    data: MISOListItemData(label: "Loading Product", description: "View product details"),
    leading: .image(MISOListItemImage(asyncImage: asyncImageWithPlaceholder, description: "Product thumbnail", size: .medium))
) {
    // Navigate to product
}

// List item with slot (displayed under texts, before helper text)
MISONavigationListItem(
    data: MISOListItemData(
        label: "Settings",
        textSlot: .init { Text("Configure options") },
        helperText: "Helper text"
    )
) {
    // Navigate to settings
}

// List item with bottomSlot (displayed under main content, before helper text)
MISONavigationListItem(
    data: MISOListItemData(
        label: "Profile",
        bottomSlot: .init { Text("Additional info") },
        helperText: "Helper text"
    )
) {
    // Navigate to profile
}

// List item with both slot and bottomSlot
MISONavigationListItem(
    data: MISOListItemData(
        label: "Settings",
        textSlot: { Text("Slot content") },
        bottomSlot: { Text("Bottom content") },
        helperText: "Helper text"
    )
) {
    // Navigate to settings
}
```

### Tab bars

@TabNavigator {
    @Tab("Wireframe (Liquid Glass)") {
        ![A tab bar component with Liquid Glass in light mode with Wireframe theme](component_tabBar_LiquidGlass_Wireframe_light)
        ![A tab bar component with Liquid Glass in dark mode with Wireframe theme](component_tabBar_LiquidGlass_Wireframe_dark)
    }
}

@TabNavigator {
    @Tab("Wireframe") {
        ![A tab bar component without Liquid Glass in light mode with Wireframe theme](component_tabBar_Wireframe_light)
        ![A tab bar component without Liquid Glass in dark mode with Wireframe theme](component_tabBar_Wireframe_dark)
    }
}

The ``MISOTabBar`` provides a native SwiftUI `TabView` with use of OUDS effects and styles.
The ``MISOTabBar`` lets users define their own hierarchy of views associated to tab items.

```swift        
// Use the OUDS tab bar to wrap tab bar items and associated views.
// Declare a @State to hold the selected tab index, then pass it as a binding.
@State private var selectedTab = 0

MISOTabBar(selectedTab: $selectedTab, count: 3) {
        
    // Add the views with the SwiftUI tab item and labels
    // No need to define colors, everything is done inside MISOTabBar
    SomeView()
        .tabItem {
            Label("Label 1", image: "image_1")
        }
        .tag(0)
    OtherView()
        .tabItem {
            Label("Label 2", image: "image_2")
        }
        .tag(1)
    LastView()
        .tabItem {
            Label("Label 3", image: "image_3")
        }
        .tag(2)
}
```

### Tab views

The `MISOTabView` and `MISOLiquidGlassTabView` use the native SwiftUI `Tab` API with OUDS styles.
They are complementary to ``MISOTabBar``:

- `MISOTabView` — iOS 18+ / macOS 15+ / visionOS 2+, exposes a `Binding<Int>` for programmatic selection, requires an explicit `value: Int` on every `Tab`.
- `MISOLiquidGlassTabView` — iOS 26+ / macOS 26+ / visionOS 26+ only, accepts `Tab` without `value:` and `Tab(role: .search)`, selection is managed natively.

```swift
// MISOTabView — iOS 18+
// Every Tab must carry an explicit value: Int matching the selectedTab binding
@State private var selectedTab = 0

MISOTabView(selectedTab: $selectedTab, count: 4) {
    Tab("Label 1", image: "image_1", value: 0) { FirstView() }
    Tab("Label 2", image: "image_2", value: 1) { SecondView() }
    Tab("Label 3", image: "image_3", value: 2) { ThirdView() }
    Tab(value: 3, role: .search) { SearchView() }
}
```

```swift
// MISOLiquidGlassTabView — iOS 26+ only
// Supports Tab without value: and Tab(role: .search), no selection binding
MISOLiquidGlassTabView {
    Tab("Label 1", image: "image_1") { FirstView() }
    Tab("Label 2", image: "image_2") { SecondView() }
    Tab("Label 3", image: "image_3") { ThirdView() }
    Tab(role: .search) { SearchView() }
}
```

### Toolbars

The toolbars components provide top and bottom navigation bars. They rely on SwiftUI toolbars and expose OUDS styles.
Top toolbars provide a title and optional subtitle, while bottom toolbars focus on actions.

There are different style depending to Liquid Glass (iOS 26+) or not (iOS 18 and older).

#### Top toolbar

@TabNavigator {
    @Tab("Wireframe (Liquid Glass)") {
        ![A toolbar top component with Liquid Glass in light mode with Wireframe theme](component_toolBarTop_LiquidGlass_Wireframe_light)
        ![A toolbar top component with Liquid Glass in dark mode with Wireframe theme](component_toolBarTop_LiquidGlass_Wireframe_dark)
    }
}

@TabNavigator {
    @Tab("Wireframe") {
        ![A toolbar top component with Liquid Glass in light mode with Wireframe theme](component_toolBarTop_Wireframe_light)
        ![A toolbar top component with Liquid Glass in dark mode with Wireframe theme](component_toolBarTop_Wireframe_dark)
    }
}

> **Principal item**: at most one item can be placed in the principal (center) position with `principalItem:`. When a `principalItem`
> is set, the subtitle is **never** displayed (whatever `hasLargeTitle` is), because SwiftUI's `.principal` placement only replaces
> the inline compact bar title, not `.navigationSubtitle()` (iOS 26+), which would otherwise keep floating with no visible title next
> to it. The title itself is displayed only if `hasLargeTitle` is `true`, in which case it appears below the bar (large title mode).

```swift
// Apply once on the root NavigationStack to style the system navigation bar
NavigationStack {
    SomeView()
        .toolBarTop("Title",
                    leadingItems: {
                        // Back button — system dismiss is automatic, no closure needed
                        MISOToolBarItem(navigation: .back())
                    },
                    principalItem: MISOToolBarItem(icon: Image(decorative: "search"), accessibilityLabel: "Search") { /* Action to process */ },
                    trailingItems: {
                        MISOToolBarItem(label: "Label") { /* Action to process */ }
                        MISOToolBarItem(icon: Image(decorative: "some_image"), accessibilityLabel: "Label") { /* Action to process */ }
                    })
}
.oudsNavigationBarAppearance() // required — apply on the NavigationStack, not on the child view

// Principal item + hasLargeTitle: title is displayed below the bar (large mode), subtitle is never displayed
SomeView()
    .toolBarTop("Title",
                hasLargeTitle: true,
                subtitle: "This subtitle will never be shown because a principalItem is set",
                principalItem: MISOToolBarItem(icon: Image(decorative: "search"), accessibilityLabel: "Search") { })

// Principal item without hasLargeTitle: neither title nor subtitle are displayed
SomeView()
    .toolBarTop("Title", principalItem: MISOToolBarItem(icon: Image(decorative: "search"), accessibilityLabel: "Search") { })

// Close button — .close takes NO closure, dismiss is handled automatically
SomeView()
    .toolBarTop("Title",
                leadingItems: {
                    MISOToolBarItem(navigation: .close)
                })

// Back button with a visible label (label text is ignored on iOS 26+ / Liquid Glass)
SomeView()
    .toolBarTop("Title",
                leadingItems: {
                    MISOToolBarItem(navigation: .back(label: "Cancel"))
                })

// Back button with custom action executed before automatic dismiss
SomeView()
    .toolBarTop("Title",
                leadingItems: {
                    MISOToolBarItem(navigation: .back(label: "Back") { saveDraft() })
                })

// On iOS ≤ 18, add on the root view to color the system back-button chevron correctly
.accentColor(theme.colors.contentDefault)
```

#### Bottom toolbar

@TabNavigator {
    @Tab("Wireframe (Liquid Glass)") {
        ![A toolbar bottom component with Liquid Glass in light mode with Wireframe theme](component_toolBarBottom_LiquidGlass_Wireframe_light)
        ![A toolbar bottom component with Liquid Glass in dark mode with Wireframe theme](component_toolBarBottom_LiquidGlass_Wireframe_dark)
    }
}

@TabNavigator {
    @Tab("Wireframe") {
        ![A toolbar bottom component with Liquid Glass in light mode with Wireframe theme](component_toolBarBottom_Wireframe_light)
        ![A toolbar bottom component with Liquid Glass in dark mode with Wireframe theme](component_toolBarBottom_Wireframe_dark)
    }
}

```swift
// Leading + trailing split — works on all supported OS versions
SomeView()
    .toolBarBottom(leadingItems: {
        MISOToolBarItem(label: "Some label") { /* Action to process */ }
    }, trailingItems: {
        MISOToolBarItem(icon: Image(decorative: "some_image"), accessibilityLabel: "Label") { /* Action to process */ }
    })

// Grouped / centered — meaningful on iOS 26+ (Liquid Glass) only
// On earlier OS versions the system splits the items into leading/trailing positions.
SomeView()
    .toolBarBottom(groupedItems: {
        MISOToolBarItem(label: "Save") { /* Action to process */ }
        MISOToolBarItem(icon: Image(decorative: "ic_delete"), accessibilityLabel: "Delete") { /* Action to process */ }
    })
```
