import 'package:flutter/cupertino.dart';

/// String extensions
import 'package:flutter/material.dart';

extension TextExtensions on Text {
  /// Creates a new Text widget with HTML tags removed from the text content.
  Text removeHtmlTags() {
    final String cleanedText = data?.replaceAll(RegExp(r'<[^>]*>'), '').trim() ?? '';
    return Text(
      cleanedText,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      locale: locale,
      softWrap: softWrap,
      strutStyle: strutStyle,
    );
  }
}
