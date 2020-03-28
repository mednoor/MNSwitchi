# MNSwitchi

Custom animated segmented control written in Swift 5.2

## Requirements

- Xcode 11.4
- iOS 11.x+
- Swift 5.2

## Installation
#### Swift Package Manager
```swift
.package(
    url: "https://github.com/mednoor/MNSwitchi.git",
    from: "0.2.0"
)
```


## Usage
#### Import `MNSwitchi` module
```swift
import MNSwitchi
```

#### Init
You can initialize a `MNSwitchi` instance from code:

```swift
let switchiView = MNSwitchiView(frame: CGRect(x: 0, y: 0, width: 240, height: 36))
view.addSubview(switchiView)
```

#### Setup `MNSwitchi`
```swift
switchiView.render(
	content: MNSwitchiContent,
	appearance: MNSwitchiAppearance,
	options: MNSwitchiOptions
)
```

#### Configuring Content 
In order to set items you need to pass a tuple of type `MNSwitchiContent`:

```swift
let items: MNSwitchiContent = (first: "First", second: "Second")
```

#### Appearance 
In order to set the styling you need to pass an object of type `MNSwitchiAppearance`:

```swift
let appearance = MNSwitchiAppearance(backgroundColor: UIColor,
                                     cornersRounded: Bool,
                                     selectedViewBackgroundColor: UIColor,
                                     states: MNSwitchiStates)
```

then create an instance of `MNSwitchiStates`:
```swift
let states = MNSwitchiStates(

default: MNSwitchiStates.MNSwitchiState(textColor: UIColor,
                                        titleFont: UIFont),

selected: MNSwitchiStates.MNSwitchiState(textColor: UIColor,
                                         titleFont: UIFont),
            
highlighted: MNSwitchiStates.MNSwitchiState(textColor: UIColor,
                                            titleFont: UIFont)
)
```

#### Customization
`MNSwitchi` can be customized by passing an instance of `MNSwitchiOptions`:
```swift
let options = MNSwitchiOptions(defaultSelectedItem: Int,
                               enableAnimation: Bool)
```

#### Handling callback

```swift
switchiView.switchedTo = { index in
    print("Selected item at: \(index)")
}
```
