deeplink-tester-iOS
===================

Simple App to test deeplinks on iOS. it Does two things:

1. It claims the scheme 'deeplinktest' so that you can use this App to test deeplinks by calling deeplinktext://. When opened from a deeplink the App will display the deeplink that was used and the name of the caller App.
2. Test which deeplinks are working on the current device. The App will test if there is an App answering to a deeplink as you type in the input box.

This is a swift project, you need Xcode 6 or above to be able to compile it.
