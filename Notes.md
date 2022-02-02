# Release Notes

## Feb 4, 2022

- Class Information
  - Selected Client

- App Object Information
  - Preferences

- Client Information
  - Notes

## Jan 28, 2022

- App Server Information
  - Configuration
    - Objects API Url
    - Monitoring API Url
    - Logging API Url
  - Status
    - view app server version information
  - Privacy
    - view in browser
  - Terms and Conditions
    - view in browser

- Home Page Tabs
  - Search View
    - Selected Client Header
  - Client Info
    - Logo
    - Title: Code and Name
    - Description (html view)

  - User Info
    - View logged in status
    - links to login and logout

  - Settings Info
    - Ability to select from the app participating client business/
    organization

- Objects Views
  - Title
  - Logo
  - Icon
  - Description
    - HTML View

- Objects Lists Views
  - DropDown Button

## Issues/TODO

- Global Error handling
  - network not available case
- Setting Screen Sliver List index error
- Sign In, Sign Up, and Sign Out process
- API Key usage

## Plan/TODO

- Search for objects with the context of
  - app
    - app type
  - a client/team
  - a client class
    - object property value

  - an object children

- Advanced Search
  - object property

- Search Results views
  - list view
  - grid view
- Edit Object View
- Object Details View

## Issues & Solutions

### SetState() called after dispose

Error: setState() called after dispose(): _NsAppStatusWidgetState#33d1b(lifecycle
state: defunct, not mounted)
This error happens if you call setState() on a State object for a widget that no
longer appears in the widget tree (e.g., whose parent widget no longer includes the
widget in its build). This error can occur when code calls setState() from a timer  
or an animation callback.
The preferred solution is to cancel the timer or stop listening to the animation in
the dispose() callback. Another solution is to check the "mounted" property of this
object before calling setState() to ensure the object is still in the tree.
This error might indicate a memory leak if setState() is being called because
another object is retaining a reference to this State object after it has been
removed from the tree. To avoid memory leaks, consider breaking the reference to
this object during dispose().
    at Object.throw_ [as throw] (http://localhost:1226/dart_sdk.js:5063:11)
    at
    http://localhost:1226/packages/flutter/src/widgets/widget_inspector.dart.lib.js:    12807:23
    at status._NsAppStatusWidgetState.new.setState
    (http://localhost:1226/packages/flutter/src/widgets/widget_inspector.dart.lib.js    :12813:28)
    at http://localhost:1226/packages/ns_demo/app/widgets/status.dart.lib.js:379:14 
    at _RootZone.runUnary (http://localhost:1226/dart_sdk.js:40062:59)
    at _FutureListener.then.handleValue (http://localhost:1226/dart_sdk.js:34983:29)    at handleValueCallback (http://localhost:1226/dart_sdk.js:35551:49)
    at Function._propagateToListeners (http://localhost:1226/dart_sdk.js:35589:17)  
    at _Future.new.[_completeWithValue] (http://localhost:1226/dart_sdk.js:35437:23)    at async._AsyncCallbackEntry.new.callback
    (http://localhost:1226/dart_sdk.js:35458:35)
    at Object._microtaskLoop (http://localhost:1226/dart_sdk.js:40330:13)
    at _startMicrotaskLoop (http://localhost:1226/dart_sdk.js:40336:13)
    at http://localhost:1226/dart_sdk.js:35811:9
