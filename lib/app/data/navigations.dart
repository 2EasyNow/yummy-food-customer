import '../../assets/assets.gen.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/setting_page/setting_page.dart';
import '../ui_models/drawer_navigation_item.dart';

const navIcons = Assets.icons;

final List<NavigationItem> navigationItems = [
  NavigationItem(
    "Home",
    svgIconPath: navIcons.homeOutline.path,
    svgActiveIconPath: navIcons.homeFilled.path,
    widget: HomePage(),
  ),
  NavigationItem(
    "Projects",
    svgIconPath: navIcons.projectOutlined.path,
    svgActiveIconPath: navIcons.projectFilled.path,
    widget: SettingPage(),
  ),
  NavigationItem(
    "Inbox",
    svgIconPath: navIcons.chatOutline.path,
    svgActiveIconPath: navIcons.chatFilled.path,
    onTap: () {},
    widget: HomePage(),
  ),
  NavigationItem(
    "Profile",
    svgIconPath: navIcons.profileOutline.path,
    svgActiveIconPath: navIcons.profileFilled.path,
    widget: SettingPage(),
  ),
];


// Ask For Review
// () async {
//   final InAppReview inAppReview = InAppReview.instance;
//   // inAppReview.openStoreListing(); // eMoves the user to playstor
//   if (await inAppReview.isAvailable()) {
//     inAppReview.requestReview();
//   }
// }