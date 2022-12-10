import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/app_user_use_case.dart';

class HomeController extends GetxController {
  final allAddresses = <Address>[];
  final allRestaurants = [];
  final userUseCase = Get.find<AppUserUseCase>();

  @override
  void onInit() async {
    super.onInit();
    allAddresses.addAll(await userUseCase.getAddresses());
    userUseCase.onUserAddressChange.listen((event) {
      if (event != null) {
        // fecth all restaurants near the address 
      }
    });
    update();
  }

  void addAddress(Address address) {
    allAddresses.add(address);
    update();
  }

  void deleteAddress(String id) async {
    await userUseCase.deleteAddress(id);
    allAddresses.removeWhere((element) => element.id == id);
    update();
    showSuccessSnackbar('Delete Address', 'Address deleted successfully');
  }

  void onDeliveryAddressChange(String? value) async {
    if (value == null) return;
    await userUseCase.updateDeliveryAddress(value);
    Get.back();
  }
}
