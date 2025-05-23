import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class CommentsManagement {
  static ImageProvider getImageProvider(Uint8List imageBytes) {
    if (imageBytes.isEmpty) {
      return const AssetImage('assets/default_comment_image.png');
    }
    return MemoryImage(imageBytes);
  }
}
