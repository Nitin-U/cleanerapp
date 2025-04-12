


import 'package:flutter/material.dart';

class MyOrderProvider extends ChangeNotifier{
    int tabs = 0;
void toggleTab(int index) {
    tabs = index;
    notifyListeners();
  }
  //   File? selectedimage;

  // Future<File?> pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage == null) return null; // User cancelled picking an image
  //   return File(pickedImage.path);
  // }

  // Future<File?> captureImage() async {
  //   final capturedImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (capturedImage == null) return null; // User cancelled capturing an image
  //   return File(capturedImage.path);
  // }

  // void pickImageAndUploadfromGallery(BuildContext context) async {
  //   // Pick an image from gallery
  //   final pickedImage = await pickImage();
  //   if (pickedImage != null) {
  //     selectedimage = pickedImage;
  //     // ignore: use_build_context_synchronously
  //     Navigator.pop(context);
  //   } else {}
  // }

  // void pickimageanduploadfromcamera(BuildContext context) async {
  //   // Pick an image from gallery
  //   final pickedImage = await captureImage();
  //   if (pickedImage != null) {
  //     selectedimage = pickedImage;
  //     // ignore: use_build_context_synchronously
  //     Navigator.pop(context);
  //   } else {}
  // }

}