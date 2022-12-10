import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/app_user_use_case.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../common/widgets/snackbars.dart';

class AddNewAddressController extends GetxController {
  final _userUseCase = Get.find<AppUserUseCase>();
  LatLng? userInitialLocation;
  LatLng? _cameraCurrentLocation;

  bool? isLocationPermissionRejected;
  final noteController = TextEditingController();

  final panelController = PanelController();
  final label = AddressLabel.home.obs;

  String address = '';
  String city = '';

  bool isSearchingForAddress = false;

  LatLng? selectedLocation;

  final searchAddressDebouncer = Debouncer(delay: Duration(milliseconds: 500));

  set cameraCurrentLocation(value) {
    _cameraCurrentLocation = value;
    // Get the Address from the latLng
    isSearchingForAddress = true;
    update();
    // and update the address in the panel
    _userUseCase.getAddressFromCoordinates(_cameraCurrentLocation!).then((data) {
      selectedLocation = value;
      address = data['address']!;
      city = data['city']!;
      isSearchingForAddress = false;
      update();
    });
    // Update the UI

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  getCurrentLocation() {
    Location.instance.requestPermission().then((value) {
      if (value == PermissionStatus.granted) {
        isLocationPermissionRejected = false;
        Location.instance.getLocation().then((value) {
          userInitialLocation = LatLng(value.latitude!, value.longitude!);
          cameraCurrentLocation = userInitialLocation;
          update();
        });
      } else {
        showErrorSnackbar("Location Permission", "Failed to grant location permission.");
        isLocationPermissionRejected = true;
        update();
      }
    });
  }

  onCameraMove(CameraPosition position) {
    searchAddressDebouncer.call(
      () {
        cameraCurrentLocation = position.target;
      },
    );
  }

  onAddAddress() async {
    if (selectedLocation == null)  {
      showErrorSnackbar("Location", "Please select a location.");
      return;
    }
    if (address.isEmpty) {
      showErrorSnackbar("Address", "Please select a valid address.");
      return;
    }
    final addedAddress = await _userUseCase.addAddress(
      location: selectedLocation!,
      address: address,
      city: city,
      note: noteController.text,
      label: label.value,
    );
    Get.back(
      result: addedAddress,
    );
    showSuccessSnackbar('Add Address', 'Address added successfully.');
  }
}
