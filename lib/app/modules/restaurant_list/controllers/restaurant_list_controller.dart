import 'package:get/get.dart';
import '../../../domain/restaurant/use_cases/restaurant_use_case.dart';

class RestaurantListController extends GetxController {
  late final String title;
  late final String imagePath;
  late final String imageDownloadUrl;
  final restaurantUseCase = Get.find<RestaurantUseCase>();

  RestaurantListController() {
    final args = Get.arguments as Map<String, dynamic>;
    title = args['title'];
    imagePath = args['imageUrl'];
    imageDownloadUrl = args['imageDownloadUrl'];
  }
  
}
