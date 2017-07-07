# RLRoundedProgressBar
an IBDesignable progress bar with rounded corners. Supports RTL.
Example included.

#### Written in Swift 3


<img src="https://github.com/RoniLeshes/RLRoundedProgressBar/blob/master/Images/Pink.png" width="200"/>
<img src="https://github.com/RoniLeshes/RLRoundedProgressBar/blob/master/Images/White.png" width="200"/>
<img src="https://github.com/RoniLeshes/RLRoundedProgressBar/blob/master/Images/Green.png" width="200"/>
<img src="https://github.com/RoniLeshes/RLRoundedProgressBar/blob/master/Images/giphy.gif" width="200"/>

### Things you can change using Interface Builder : 

 - Progress bar background color
 - Progress bar color 

 - Progress percentage (So you could see how it looks in interface builder)
 
 - Horizontal padding
 - Vertical padding
 
 - RTL support (Simply changes the direction of the progress)




### Usage : 
```swift
        progressView.setProgress(percent:myProgressPercentage)
```

For animation, simply wrap setProgress(:) in a UIView animation block
```swift
            UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveEaseInOut, animations: {
                    progressView.setProgress(percent:myProgressPercentage)
            }, completion: nil)    
```
