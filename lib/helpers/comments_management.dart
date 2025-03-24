import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';

class CommentsManagement {
  static ImageProvider getImageProvider(String path) {
    if (path.isEmpty) {
      return AssetImage('assets/default_comment_image.png');
    }
    if (path.startsWith('/')) {
      return FileImage(File(path));
    }
    try {
      final bytes = base64Decode(path);
      return MemoryImage(bytes);
    } catch (e) {
      print(e);
      return const AssetImage('assets/default_comment_image.png');
    }
  }
}
