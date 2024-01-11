import 'dart:typed_data';

import 'package:flutter/material.dart';

class ByteImage extends StatelessWidget {
  const ByteImage({Key? key, required this.bytes}) : super(key: key);
  final Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return bytes == null
        ? const Icon(
            Icons.image,
            size: 60.0,
          )
        : ClipOval(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Align(
                alignment: Alignment.center,
                child: Image.memory(bytes!),
              ),
            ),
          );
  }
}
