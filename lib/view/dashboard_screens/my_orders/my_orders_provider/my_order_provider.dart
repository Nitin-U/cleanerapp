import 'package:binbookingapp/view/dashboard_screens/my_orders/model/my_order_model.dart';
import 'package:binbookingapp/view/dashboard_screens/my_orders/service/my_order_api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyOrderProvider extends ChangeNotifier {
  bool isdamaged = true;

  bool loadingmyorderdata = false;
  MyOrderModel? _myOrderModel;
  MyOrderModel? get order => _myOrderModel;

  int tabs = 0;
  void toggleTab(int index) {
    tabs = index;
    notifyListeners();
  }

  Future<void> getMyordersData(token, id) async {
    try {
      loadingmyorderdata = true;
      notifyListeners();
      final binbook = await fetchMyorders(token, id);
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

  Future<void> pickImage(int index, BuildContext context) async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      int availableSlots = 3 - imagesPerBin[index].length;

      if (availableSlots <= 0) {
        showLimitSnackbar(context);
        return;
      }

      // Add only allowed number of images
      final filesToAdd = pickedFiles.take(availableSlots);
      imagesPerBin[index].addAll(filesToAdd);
      notifyListeners();

      if (pickedFiles.length > availableSlots) {
        showLimitSnackbar(context); // Notify user only 3 allowed
      }
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

  void showLimitSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You can only select up to 3 images.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  List<TextEditingController> serialControllers = [];
  List<String> binSerialNumbers = [];

  void initializeControllers(int quantity) {
    serialControllers = List.generate(quantity, (_) => TextEditingController());
    binSerialNumbers = List.generate(quantity, (_) => "");
    notifyListeners();
  }

  void updateSerial(int index, String value) {
    if (index >= 0 && index < binSerialNumbers.length) {
      binSerialNumbers[index] = value;
      debugPrint('Updated Serial $index: $value');
    }
  }

  void submitSerials() {
    // Print all serials to console
    debugPrint("Final Serial List:");
    for (int i = 0; i < binSerialNumbers.length; i++) {
      debugPrint(binSerialNumbers.toString());
    }
  }
}
