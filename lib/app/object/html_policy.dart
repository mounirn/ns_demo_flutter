// https://stackoverflow.com/questions/62840032/flutter-web-htmlelementview-removing-disallowed-attribute

// ignore: avoid_web_libraries_in_flutter
import "dart:html" as html;


class ItemUrlPolicy implements html.UriPolicy {
  RegExp regex = RegExp(r'(?:http://|https://)?.*');

  @override
  bool allowsUri(String uri) {
    return regex.hasMatch(uri);
  }
}

getHtmlNodeValidator() {
  var policy = ItemUrlPolicy();
  return html.NodeValidatorBuilder()
            ..allowHtml5(uriPolicy: policy)
            ..allowNavigation(policy)
            ..allowImages(policy);
}