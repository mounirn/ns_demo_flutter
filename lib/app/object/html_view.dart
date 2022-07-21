
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
// import 'dart:ui' show platformViewRegistry;
import 'package:flutter/material.dart';
import 'html_policy.dart';


class NsHtmlContentView extends StatelessWidget {
  final String html;
  const NsHtmlContentView(this.html, {Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    var _element = DivElement()
      ..style.height = '100px'
      ..style.width = '100%'
      ..style.overflowY= 'scroll';
      
    // ignore: undefined_prefixed_name
    var viewType = DateTime.now().microsecondsSinceEpoch.toString();

   //  registerViewFactory(viewType, (int viewId) => _element);

    _element.innerHtml = '';
    _element.appendHtml(html, validator: getHtmlNodeValidator());
    return HtmlElementView(key: UniqueKey(), viewType: viewType);
  }
}

/// 
/// Use only if target platform is Web
class NsHtmlContentView2 extends StatefulWidget {
  final String html;
  const NsHtmlContentView2(this.html, {Key? key}) : super(key: key);

  @override
  NsHtmlContentViewState createState() => NsHtmlContentViewState();
}

class NsHtmlContentViewState extends State<NsHtmlContentView2> {
  late DivElement _element;

  @override
  void initState() {
    super.initState();
    _element = DivElement()
      ..style.height = '100px'
      ..style.width = '100%'
      ..appendHtml(widget.html,
          validator: getHtmlNodeValidator() );
    // ignore: undefined_prefixed_name
    // ui.platformViewRegistry.registerViewFactory('ns-html-view', (int viewId) => _element);
  }

  @override
  Widget build(BuildContext context) {
    _element.innerHtml = '';
    _element.appendHtml(widget.html, validator: getHtmlNodeValidator());
    return HtmlElementView(key: UniqueKey(), viewType: "ns-html-view");
  }
}

