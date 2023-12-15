import Foundation

// MARK: HContext

/// A @propertyWrapper for useContext
///
///```swift
///
///      let todos = useContext(TodoContext.self)
///
///      @HContext
///      var context = TodoContext.self
///
///       let todos = $context.value
///```
///
///It's similar ``useContext(_:)``, but using propertyWrapper instead.

@propertyWrapper
public struct HContext<Node> {
  
  public init(wrappedValue: @escaping () -> Context<Node>.Type) {
    self.wrappedValue = wrappedValue()
  }
  
  public init(wrappedValue: Context<Node>.Type) {
    self.wrappedValue = wrappedValue
  }
  
  public var wrappedValue: Context<Node>.Type
  
  public var projectedValue: Self {
    self
  }
  
  public var value: Node {
    useContext(wrappedValue)
  }
}
