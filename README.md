# SwiftyRegex

Just to make regular expression API usable in iOS/OS X development.

## Motivation

SwiftyRegex is a microlibrary (<100 LOC) which simply wraps clunky `NSRegularExpression` class API.
It is opinionated and focuses on most common use cases dealing with regular expressions:

* to check if string matches to regex
* to find matches of specified regex in string
* to find capture groups `()` in string
* regular expression **must be valid**, otherwise program will crash with runtime error

Everything should be doable in oneliner, as simple as the task is.
Compare JavaScript built-in regular expression class:

```javascript
var rex = RegExp("\\d+")

console.log(rex.test("123")); 
// true

console.log(rex.exec("foo 123 abc")); 
// [ '123', index: 4, input: 'foo 123 abc' ]
```
Wouldn't be cool to have something similar available in Mac/iOS programming?

## How to use

Initialize instance of Regex class with regular expression. Runtime error will be thrown in case of bad syntax. This is intended as bad regexp is likely a programming error anyway.

```swift
let rex = Regex("\\d+")
```
### Is string matching the regex?

```swift
Regex("\\d+").test("123") == true
```

I am for using custom/overloaded operators sparringly, but this one is borrowed from Perl world:

```swift
"12345" =~ "\\d+" == true
```

### Find matches of regex in string. 

Returns array of strings matching regexp. If no matches were found, empty array is returned, following Null Object pattern.

```swift  
Regex("\\d+").matches("123 456") == [ "123", "456" ]  
```

### Find capture groups. 

Useful for parsing simple text documents. At index zero there is full match,
and starting with index 1, each capture groups follow.

```swift
Regex("(\\d{2})-(\\d{3})").captures("31-234") == ["31-234", "31", "234"]
```


## How to import into your project

### Manually
Just copy [SwiftyRegex.swift](https://github.com/tomekc/SwiftyRegex/blob/master/Sources/SwiftyRegex.swift) to your project. Everything is in one file.

### CocoaPods

```
use_frameworks!

pod "SwiftyRegex", "1.0.0"
```

Because of limitations, SwiftyRegex will be included as framework, so minimum deployment target is iOS 8 and OS X 10.9.


## Author

SwiftyRegex has been written by Tomek Cejner by urgent need of comfortable use of regular expressions in his project. Forks, pull requests are always welcome.

Find me on Twitter as [@tomekcejner](http://twitter.com/tomekcejner)

I also have a [website](https://www.japko.net/)


