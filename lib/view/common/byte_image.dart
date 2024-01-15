import 'dart:typed_data';

import 'package:flutter/material.dart';

class ByteImage extends StatelessWidget {
  const ByteImage({Key? key, required this.bytes, this.length = 60.0})
      : super(key: key);
  final Uint8List? bytes;
  final double length;
  @override
  Widget build(BuildContext context) {
    return bytes == null
        ? Icon(
            Icons.image,
            size: length,
          )
        : ClipOval(
            child: SizedBox(
              width: length,
              height: length,
              child: Align(
                alignment: Alignment.center,
                child: Image.memory(bytes!),
              ),
            ),
          );
  }
}
