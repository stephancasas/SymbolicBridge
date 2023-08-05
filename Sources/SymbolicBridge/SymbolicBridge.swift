
import Foundation;

open class SymbolicBridge {
    internal static var __frameworkHandle: UnsafeMutableRawPointer? = nil;
}

public protocol SymbolicBridgeProvider: SymbolicBridge {
    static var framework: String { get }
}

public extension SymbolicBridgeProvider {
    
    private static var frameworkHandle: UnsafeMutableRawPointer {
        if let handle = Self.__frameworkHandle {
            return handle;
        }
        
        guard let handle = dlopen(
            Self.framework, RTLD_LAZY
        ) else { fatalError(
            "Could not open framework at path \(Self.framework)"
        ) }
        
        Self.__frameworkHandle = handle;
        
        return handle;
    }
    
    static func pointer(to symbolName: String) -> UnsafeMutableRawPointer {
        guard let pointer = dlsym(
            Self.frameworkHandle, symbolName
        ) else { fatalError(
            "Could not acquire pointer to symbol with name \"\(symbolName).\""
        ) }
        
        return pointer;
    }
    
    static func getSymbol<T>(named symbolName: String, as type: T.Type) -> T {
        unsafeBitCast(Self.pointer(to: symbolName), to: T.self)
    }
    
}

