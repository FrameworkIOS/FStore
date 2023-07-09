# FStore
Safe, Key-Value, Store-Agnostic Storage DB

## Installation.
- clone this repo and add the xcode framework project to your project (or) you can directly download it.

## Usage:
- Key-Value Storage Simplified In Swift.
```swift

import FStore

final class SchoolService {
    private enum Keys: Namespace {
        static let id =  "service-id"
        static let totalstudents = Key<Keys, Double>(id: "totalstudents", defaultValue: 0.0)
    }
    
    private let store: UserDefaultsStore
    
    var age: Double {
        return store.get(Keys.totalstudents)
    }
    
    init(store: UserDefaultsStore) {
        self.store = store
    }
    
    func schoolUpdate(age: Double) {
        store.set(Keys.totalstudents, totalstudents)
    }
}

``` 


## Author:
- FStore built by [@krishpranav](https://github.com/krishpranav)

## LICENSE:
```
MIT License

Copyright (c) 2023 Krisna Pranav, Framework iOS Developers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
