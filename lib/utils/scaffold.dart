// import 'package:flutter/material.dart';
// https://stackoverflow.com/questions/54454017/flutter-scaffold-actions-and-end-drawer-together
/*
class CustomScaffoldWidget extends Scaffold {
  CustomScaffoldWidget({
    AppBar? appBar,
    Widget? body,
    GlobalKey<ScaffoldState>? key,
    Widget? endDrawer,
    Widget? drawer,
    FloatingActionButton? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Color? backgroundColor,
    Widget? bottomSheet,
    Widget? bottomNavigationBar,
    bool resizeToAvoidBottomPadding = true,
    bool primary = true,
  })  : assert(key != null),
        super(
          key: key,
          appBar: endDrawer != null &&
                  appBar.actions != null &&
                  appBar.actions.isNotEmpty
              ? _buildEndDrawerButton(appBar, key)
              : appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
          primary: primary,
        );

  static AppBar _buildEndDrawerButton(
      AppBar myAppBar, GlobalKey<ScaffoldState> _keyScaffold) {
    myAppBar.actions.add(IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => !_keyScaffold.currentState.isEndDrawerOpen
            ? _keyScaffold.currentState.openEndDrawer()
            : null));
    return myAppBar;
  }
}
*/