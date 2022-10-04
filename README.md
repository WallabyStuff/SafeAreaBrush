<p align='center'>
<img src="https://user-images.githubusercontent.com/63496607/175499153-051c052a-6301-49d1-85ed-3a00ad90e835.png" width='557' title='SafeAreaBrush'/>
</p>

<p align='center'>
<a href="https://travis-ci.org/SunneyG/SafeAreaBrush"><img src="https://img.shields.io/travis/SunneyG/SafeAreaBrush.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/SafeAreaBrush"><img src="https://img.shields.io/cocoapods/v/SafeAreaBrush.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/SafeAreaBrush"><img src="https://img.shields.io/cocoapods/l/SafeAreaBrush.svg?style=flat"></img></a>
<a href="https://cocoapods.org/pods/SafeAreaBrush"><img src="https://img.shields.io/cocoapods/p/SafeAreaBrush.svg?style=flat"></img></a>
</p>

<p align='center'>
SafeAreaBrush helps you to fill SafeAreas super easily
</p>


<br/>

## Requirements

iOS 11.0+

<br/>


## Usage

Call following code on UIViewController to fill SafeAreas

```swift
import SafeAreaBrush

fillSafeArea(position: .top, color: .red)
fillSafeArea(position: .left, color: .green)
fillSafeArea(position: .right, color: .blue)
fillSafeArea(position: .bottom, color: .cyan)
```

<br/>

You also can fill SafeAreas with gradient color. like so ⬇️

```swift
import SafeAreaBrush

fillSafeArea(position: .top, color: .red, gradient: true)
fillSafeArea(position: .left, color: .green, gradient: true)
fillSafeArea(position: .right, color: .blue, gradient: true)
fillSafeArea(position: .bottom, color: .cyan, gradient: true)
```

<br/>

Even blur effect
```swift
import SafeAreaBrush

fillSafeArea(position: .top, blur: .regular)
fillSafeArea(position: .left, blur: .regular)
fillSafeArea(position: .right, blur: .regular)
fillSafeArea(position: .bottom, blur: .regular)

// Gradient on
fillSafeArea(position: .top, blur: .regular, gradient: true)
fillSafeArea(position: .left, blur: .regular, gradient: true)
fillSafeArea(position: .right, blur: .regular, gradient: true)
fillSafeArea(position: .bottom, blur: .regular, gradient: true)
```


## Resizing
It will resize frame automatically when trait colleciton has changed.
<br/>
<br/>
<img src="https://user-images.githubusercontent.com/63496607/175510324-3066b3f8-ced6-4a82-ac79-9e9c8ef77646.gif"/>


<br/>


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<br/>


## Installation

SafeAreaBrush is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SafeAreaBrush'
```
latest version: 1.0.1

<br/>

## Author

SeunggiLee, avocado34.131@gmail.com

<br/>

## License

SafeAreaBrush is available under the MIT license. See the LICENSE file for more info.
