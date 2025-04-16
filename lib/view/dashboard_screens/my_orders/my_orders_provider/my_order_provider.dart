



import 'package:binbookingapp/view/dashboard_screens/my_orders/model/my_order_model.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/service/my_order_api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderProvider extends ChangeNotifier{
bool isdamaged = true;



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

  List<bool> isDamagedList = [];
  List<List<XFile>> imagesPerBin = [];

  void initializeDamagedList(int count) {
    isDamagedList = List.generate(count, (index) => false);
    imagesPerBin = List.generate(count, (index) => []);
    notifyListeners();
  }

  void toggleCheckbox(int index, bool? value) {
    if (value != null && index >= 0 && index < isDamagedList.length) {
      isDamagedList[index] = value;
      notifyListeners();
    }
  }

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && imagesPerBin[index].length < 3) {
      imagesPerBin[index].add(pickedFile);
      notifyListeners();
    }
  }

  Future<void> captureImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null && imagesPerBin[index].length < 3) {
      imagesPerBin[index].add(pickedFile);
      notifyListeners();
    }
  }

  void removeImage(int binIndex, int imageIndex) {
    imagesPerBin[binIndex].removeAt(imageIndex);
    notifyListeners();
  }

  void _showLimitSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You can only select up to 3 images.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

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

