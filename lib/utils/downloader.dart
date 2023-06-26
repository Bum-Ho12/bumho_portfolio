// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:html';

void download(
  List<int> bytes, {
  required String downloadName,
  required String url,
}) {
  // final anchor = AnchorElement(href: url);
  final _base64 = base64Encode(bytes);
  final anchor =
      AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
        ..target = 'blank';

  if (downloadName.isNotEmpty) {
    anchor.download = downloadName;
  }

  document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
