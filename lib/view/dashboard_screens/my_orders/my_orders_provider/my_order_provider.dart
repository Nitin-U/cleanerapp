


import 'dart:io';

import 'package:binbookingapp/view/dashboard_screens/my_orders/model/my_order_model.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/service/my_order_api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderProvider extends ChangeNotifier{

bool loadingmyorderdata = false;
MyOrderModel? _myOrderModel;
MyOrderModel? get order => _myOrderModel;

    int tabs = 0;
void toggleTab(int index) {
    tabs = index;
    notifyListeners();
  }
Future<void> getMyordersData(token,id) async {
    try {
      loadingmyorderdata = true;
      notifyListeners();
      final binbook = await fetchMyorders(token,id);
      _myOrderModel = MyOrderModel.fromJson(binbook);
      print('myorder $binbook');

      loadingmyorderdata = false;
      notifyListeners();
    } catch (e) {
      loadingmyorderdata = false;
      notifyListeners();
      print('Error in getWalletData: $e');
      rethrow;
    }
  }

    File? selectedimage;

  Future<File?> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return null; // User cancelled picking an image
    return File(pickedImage.path);
  }

  Future<File?> captureImage() async {
    final capturedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (capturedImage == null) return null; // User cancelled capturing an image
    return File(capturedImage.path);
  }

  void pickImageAndUploadfromGallery(BuildContext context) async {
    // Pick an image from gallery
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      selectedimage = pickedImage;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {}
  }

  void pickimageanduploadfromcamera(BuildContext context) async {
    // Pick an image from gallery
    final pickedImage = await captureImage();
    if (pickedImage != null) {
      selectedimage = pickedImage;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {}
  }

}