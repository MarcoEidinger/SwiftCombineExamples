# SwiftCombineExamples

> Combine fits in to SwiftUI when the state has been externalized into a reference to a model object, most often using the property wrappers `@ObservedObject` to reference a class conforming to the `ObservableObject` protocol. The core of the `ObservableObject` protocol is a combine publisher `objectWillChange`, which is used by the SwiftUI framework to know when it needs to invalidate a view based on a model changing. The `objectWillChange` publisher only provides an indicator that something has changed on the model, not which property, or what changed about it. The author of the model class can "opt-in" properties into triggering that change using the `@Published` property wrapper. If a model has properties that aren’t wrapped with `@Published`, then the automatic objectWillChange notification won’t get triggered when those values are modified. Typically the model properties will be referenced directly within the View elements. When the view is invalidated by a value being published through the `objectWillChange` publisher, the SwiftUI View will request the data it needs, as it needs it, directly from the various model references.

## ObservableObject

Used with SwiftUI, objects conforming to ObservableObject protocol can provide a publisher.

When a class includes a Published property and conforms to the `ObservableObject` protocol, this class instances will get a `objectWillChange` publisher endpoint providing this publisher. The `objectWillChange` publisher will not return any of the changed data, only an indicator that the referenced object has changed.

Classes implementing `ObservedObject` are also expected to use `@Published` to provide notifications of changes on specific properties, or to optionally provide a custom announcement that indicates the object has changed.

It can also be used locally to watch for updates to a reference-type model.

## @Published

A property wrapper that adds a Combine publisher to any property

`@Published` is part of Combine, but allows you to wrap a property, enabling you to get a publisher that triggers data updates whenever the property is changed. The publisher’s output type is inferred from the type of the property, and the error type of the provided publisher is `<Never>`.

## Acknowledgements

Book: https://heckj.github.io/swiftui-notes/
Source: https://github.com/heckj/swiftui-notes
