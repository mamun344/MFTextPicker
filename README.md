# MFTextPicker

![alt text](https://gist.githubusercontent.com/mamun344/edf99b648def9bd7a7a6fc5bb509e3ef/raw/b16b353e4439415c00853ddb840b7a8012411943/mf_textpicker%2520ss.png "Demo ss")

A simple and elegant text picker for iOS (UIKit) written in Swift.

## Features
* Very simple calling and selection get back.
* No others helper needed to show/present popup.
* No hassle to push and present view-controller
* Easy customizable.

## Usage

##### On App Launch

Accorss the whole app, if your all popup looks same, then it's recommneded to set following values in AppDelegate's didFinishLaunchingWithOptions function or your home/landing viewcontroller's viewDidLoad method.

```
import MFTextPicker

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        MFTextPicker.shared.defaultColor = .white
        MFTextPicker.shared.defaultTintColor = .black

        /// Optional
        //MFTextPicker.shared.defaultHighlightColor = .systemBlue
        //MFTextPicker.shared.defaultSeparatorColor = .lightGray

        .....
    }

    .....
    .....
}
```

##### Customize picker

In some places if you want to set colors as you wish, then call the config() func  before calling the show() func.

N.B.: After Picker got dismissed you should call the reset() func.

```
import MFTextPicker


@IBAction func showDesignation(){

    let color = UIColor(red: 253.0/255.0, green: 243.0/255.0, blue: 208.0/255.0, alpha: 1.0)

    MFTextPicker.config(color: color, tintColor: .black, highlightColor: .systemRed)

    MFTextPicker.show(designations, title: "Select Designation", index: selectedIndex) { index, text in
        if let index {
            // hold the index to pass further picker show
            self.selectedIndex = index
        }
            
        MFTextPicker.shared.reset()
    }
}

```


For more example you can clone this repo and look at the example app.


## Installation

### Swift Package Manager
Add it to the dependencies value of your Package.swift.:
```
dependencies: [
.package(url: "https://github.com/mamun344/MFTextPicker.git", from: "version-tag")
]
```


## Contribution

Users are encouraged to become active participants in its continued development — by fixing any bugs that they encounter, or by improving the documentation wherever it’s found to be lacking.

If you wish to make a change, [open a Pull Request](https://github.com/mamun344/MFTextPicker/pull/new) — even if it just contains a draft of the changes you’re planning, or a test that reproduces an issue — and we can discuss it further from there.

