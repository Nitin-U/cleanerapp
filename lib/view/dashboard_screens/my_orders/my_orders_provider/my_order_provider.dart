


import 'dart:io';

import 'package:binbookingapp/view/dashboard_screens/my_orders/model/my_order_model.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/service/my_order_api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderProvider extends ChangeNotifier{
bool isdamaged = true;

void toggleisdamaged(){
  isdamaged = isdamaged;
  notifyListeners();
}
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

 final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];

  Future<void> pickImage(BuildContext context) async {
    if (images.length >= 3) {
      _showLimitSnackbar(context);
      return;
    }

    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      images.add(pickedImage);
    }
  }

  Future<void> captureImage(BuildContext context) async {
    if (images.length >= 3) {
      _showLimitSnackbar(context);
      return;
    }

    final capturedImage = await _picker.pickImage(source: ImageSource.camera);

    if (capturedImage != null) {
      images.add(capturedImage);
    }
  }

  void _showLimitSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You can only select up to 3 images.'),
        duration: Duration(seconds: 2),
      ),
    );
  }
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