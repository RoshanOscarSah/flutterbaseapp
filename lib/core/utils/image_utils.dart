import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryUtils {
  static Future<File?> getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    //for video
    /*  final XFile? response1 =
        await picker.pickVideo(source: ImageSource.gallery); */
    final response = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 480,
      maxWidth: 640,
      imageQuality: 20,
    );
    if (response != null) {
      return File(response.path);
    }
    return null;
  }
}

class ImageUtils {
  static Future<File?> getImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final response = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 640,
        imageQuality: 20);
    if (response != null) {
      return File(response.path);
    }
    return null;
  }
}
