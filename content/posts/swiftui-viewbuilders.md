+++
title = "SwiftUI Super Powered - ViewBuilders"
date = "2020-05-10"
author = "Houman"
authorTwitter = "" #do not include @
cover = ""
tags = ["SwiftUI", "Super", "Power", "ViewBuilder"]
keywords = ["", ""]
description = "How SwiftUI ViewBuilders can clean up your Views and abstract away content"
showFullContent = false
+++

# The Problem

How can a View be augmented with new properties without having a knock on effect, changing all other uses of said view?

# The solution

ViewBuilders, a parameter attribute which allows you to supplement an existing view by capturing it as a view producing closure. The example we'll work with today is the concept of turning an existing view, used to represent a row in a List view, into a view which displays where it has been selected. All of which without changing the original functionality. This is an example of the [Decorator pattern](https://www.baeldung.com/java-decorator-pattern) realised through ViewBuilders.

``` swift
struct CheckableRow<Content: View> : View {
  private let content: Content
  @State let checked: Bool = false
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    Button(action: { self.checked.toggle }) {
      Image(systemName:  self.checked ? "checkmark.circle.fill" : "circle")
    }
    Spacer()
    content
  }
}
```

The snippet above allows you to accept a closure as a parameter that evaluates into a view. You'll also notice how our struct implements the View Protocol, containing a public variable body. This allows the SwiftUI subsystem to consider our changes as just another part of the view heirarchy during the View initialisation.

``` swift
struct MainView: View {
  var body: some View {
    VStack {
      List(rows()) {
        item in
        CheckableRow {
          RowView(item: item)
        }
      }
    }  
  }
}
```

Above is a slightly contrived example, whereby we take a row view and make it a selectable row, decorating its functionality without changing the object. This lets us add on additional functionality without changing `RowView` which would need to be updated everywhere else it is used.
