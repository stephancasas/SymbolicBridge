# SymbolicBridge

SymbolicBridge provides a wrapper class and protocol for dynamically loading undeclared symbols from external frameworks at runtime.

## Install

Add the package using Swift Package Manager:

```plaintext
https://github.com/stephancasas/SymbolicBridge
```

## Usage

Define a `class` which will scope your symbol bindings as static functions/variables. The `class` should extend `SymbolicBridge` and implement `SymbolicBridgeProvider`:

```swift

import Foundation;
import SymbolicBridge;

class CGSPrivate: SymbolicBridge, SymbolicBridgeProvider {
    
    static let framework: String = "/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics";
    
    /// The main CoreGraphics connection identity.
    ///
    static var mainConnectionID: Int {
        getSymbol(
            named: "CGSMainConnectionID",
            as: (@convention(c) () -> Int).self
        )()
    }
    
}
```

## Contact

[Follow Stephan on X](https://twitter.com/stephancasas)

## License

MIT
