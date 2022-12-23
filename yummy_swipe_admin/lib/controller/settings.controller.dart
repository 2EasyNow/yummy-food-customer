import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final settingsRef = FirebaseFirestore.instance.collection('AppSettings').doc('settings');
  final settings = {}.obs;
  bool isDataFetched = false;
  final minDeliveryCost = 0.0.obs;
  final costByKm = 0.0.obs;
  final searchRadius = 0.0.obs;
  final platformFee = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    settingsRef.get().then((value) {
      settings.value = value.data()!;
      minDeliveryCost.value = settings['deliveryCost']['min'];
      costByKm.value = settings['deliveryCost']['perKM'];
      searchRadius.value = settings['searchInKM'];
      platformFee.value = settings['platformFee'];
      isDataFetched = true;
      update();
    });
  }

  updateSettings() {
    // check if values are valid and greater then 0
    if (minDeliveryCost.value > 0 && costByKm.value > 0 && searchRadius.value > 0 && platformFee.value > 0) {
      settingsRef.update({
        'deliveryCost': {
          'min': minDeliveryCost.value,
          'perKM': costByKm.value,
        },
        'searchInKM': searchRadius.value,
        'platformFee': platformFee.value,
      }).then((value) {
        Get.snackbar('Success', 'Settings updated successfully');
      }).catchError((error) {
        Get.snackbar('Error', 'Something went wrong');
      });
    } else {
      Get.snackbar('Error', 'Please enter valid values');
    }
  }
}
