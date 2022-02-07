
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'html_policy.dart';

/// 
/// Use only if target platform is Web
class NsHtmlContentView extends StatefulWidget {
  final String html;
  const NsHtmlContentView(this.html, {Key? key}) : super(key: key);

  @override
  NsHtmlContentViewState createState() => NsHtmlContentViewState();
}

class NsHtmlContentViewState extends State<NsHtmlContentView> {
  late html.DivElement _element;

  @override
  void initState() {
    super.initState();
    _element = html.DivElement()
      ..appendHtml(widget.html,
          validator: getHtmlNodeValidator() );
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('ns-html-view', (int viewId) => _element);
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(key: UniqueKey(), viewType: "ns-html-view");
  }
}