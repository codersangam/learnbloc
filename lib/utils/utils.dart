part of 'utils_imports.dart';

class Utils {
  // static Location location = new Location();

  // static Future<void> manipulateSplashData(BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   initDio(lang: "ar");
  //   // initCustomWidgets(language: "ar");
  //   GlobalState.instance.set("token", "");
  //   // await GeneralRepository(context).getHomeConstData();
  //   // await location.requestPermission();
  //   var strUser = prefs.get("user");
  //   if (strUser != null) {
  //     UserModel data = UserModel.fromJson(json.decode("$strUser"));
  //     GlobalState.instance.set("token", data.token);
  //     changeLanguage(data.lang, context);
  //     setCurrentUserData(data, context);
  //   } else {
  //     changeLanguage("ar", context);
  //     // AutoRouter.of(context).push(SelectUserRoute());
  //   }
  // }

  // static initDio({required String lang}) {
  //   DioUtils.init(
  //     baseUrl: ApiNames.baseUrl,
  //     style: CustomInputTextStyle(lang: lang),
  //     primary: MyColors.primary,
  //     authLink: SplashRoute.name,
  //     language: lang,
  //     dismissFunc: EasyLoading.dismiss,
  //     showLoadingFunc: LoadingDialog.showLoadingDialog,
  //     branch: ApiNames.branch,
  //     authClick: () {},
  //   );
  // }

  // static initCustomWidgets({required String language}) {
  //   WidgetUtils.init(
  //       style: CustomInputTextStyle(lang: language),
  //       primary: MyColors.primary,
  //       language: language,
  //       inputStyle: (
  //               {String? label,
  //                 String? hint,
  //                 Widget? prefixIcon,
  //                 Widget? suffixIcon,
  //                 Color? hintColor,
  //                 Color? fillColor,
  //                 BorderRadius? radius,
  //                 Color? focusBorderColor,
  //                 EdgeInsets? padding,
  //                 Color? enableColor}) =>
  //           CustomInputDecoration(
  //               lang: language,
  //               labelTxt: label,
  //               hint: hint,
  //               prefixIcon: prefixIcon,
  //               suffixIcon: suffixIcon,
  //               enableColor: enableColor,
  //               customFillColor: fillColor,
  //               padding: padding)

  //               );
  // }

  // static Future<bool> manipulateLoginData(
  //     BuildContext context, dynamic data, String token) async {
  //   if (data != null) {
  //     int status = data["status"];
  //     if (status == 1) {
  //       await Utils.setDeviceId("$token");
  //       UserModel user = UserModel.fromJson(data["data"]);
  //       int type = data["data"]["type"];
  //       user.type = type == 1 ? "user" : "company";
  //       user.token = data["token"];
  //       user.lang = context.read<LangCubit>().state.locale.languageCode;
  //       GlobalState.instance.set("token", user.token);
  //       await Utils.saveUserData(user);
  //       Utils.setCurrentUserData(user, context);
  //     } else if (status == 2) {
  //       // AutoRouter.of(context)
  //       //     .push(ActiveAccountRoute(userId: data["data"]["id"]));
  //     }
  //     return true;
  //   }
  //   return false;
  // }

  // static void setCurrentUserData(UserModel model, BuildContext context) async {
  //   // context.read<UserCubit>().onUpdateUserData(model);
  //   // ExtendedNavigator.of(context).push(Routes.home,arguments: HomeArguments(parentCount: parentCount));
  // }

  // static Future<void> saveUserData(UserModel model) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("user", json.encode(model.toJson()));
  // }

  // static void changeLanguage(String lang, BuildContext context) {
  //   DioUtils.lang = lang;
  //   WidgetUtils.lang = lang;
  //   context.read<LangCubit>().onUpdateLanguage(lang);
  // }

  // static UserModel getSavedUser({required BuildContext context}) {
  //   return context.read<UserCubit>().state.model;
  // }

  // static Future<String?> getDeviceId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("deviceId");
  // }

  // static Future<void> setDeviceId(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("deviceId", token);
  // }

  // static void clearSavedData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  // }

  // static String getCurrentUserId({required BuildContext context}) {
  //   var provider = context.watch<UserCubit>().state.model;
  //   return provider.id;
  // }

  // static void launchURL({required String url}) async {
  //   if (!url.toString().startsWith("https")) {
  //     url = "https://" + url;
  //   }
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     CustomToast.showToastNotification("من فضلك تآكد من الرابط");
  //   }
  // }

  // static void launchWhatsApp(phone) async {
  //   String message = 'مرحبا بك';
  //   if (phone.startsWith("00966")) {
  //     phone = phone.substring(5);
  //   }
  //   var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
  //   print(_whatsAppUrl);
  //   if (await canLaunch(_whatsAppUrl)) {
  //     await launch(_whatsAppUrl);
  //   } else {
  //     throw 'حدث خطأ ما';
  //   }
  // }

  // static void launchYoutube({required String url}) async {
  //   if (Platform.isIOS) {
  //     if (await canLaunch('$url')) {
  //       await launch('$url', forceSafariVC: false);
  //     } else {
  //       if (await canLaunch('$url')) {
  //         await launch('$url');
  //       } else {
  //         throw 'Could not launch $url';
  //       }
  //     }
  //   } else {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   }
  // }

  // static void callPhone({phone}) async {
  //   await launch("tel:$phone");
  // }

  // static void sendMail(mail) async {
  //   await launch("mailto:$mail");
  // }

  // static void shareApp(url) {
  //   LoadingDialog.showLoadingDialog();
  //   Share.share(url).whenComplete(() {
  //     EasyLoading.dismiss();
  //   });
  // }

  static Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  // static void copToClipboard(
  //     {required String text, required GlobalKey<ScaffoldState> scaffold}) {
  //   if (text.trim().isEmpty) {
  //     CustomToast.showToastNotification("لا يوجد بيانات للنسخ");
  //     return;
  //   } else {
  //     Clipboard.setData(ClipboardData(text: "$text")).then((value) {
  //       CustomToast.showToastNotification("تم النسخ بنجاح");
  //     });
  //   }
  // }

  // static Future<LocationData?> getCurrentLocation(BuildContext context) async {
  //   Location location = new Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _loc;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return null;
  //     }
  //   }

  // _permissionGranted = await location.hasPermission();
  // if (_permissionGranted == PermissionStatus.denied) {
  //   _permissionGranted = await location.requestPermission();
  //   if (_permissionGranted != PermissionStatus.granted) {
  //     return null;
  //   }
  // }

  // _loc = await location.getLocation();
  // return _loc;
}

  // static void navigateToMapWithDirection(
  //     {required String lat,
  //     required String lng,
  //     required BuildContext context}) async {
  //   if (lat == "0") return;
  //   try {
  //     final coords = Coords(double.parse(lat), double.parse(lng));
  //     final title = "Destination";
  //     final availableMaps = await MapLauncher.installedMaps;

  //     showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SafeArea(
  //           child: SingleChildScrollView(
  //             child: Container(
  //               child: Wrap(
  //                 children: <Widget>[
  //                   for (var map in availableMaps)
  //                     ListTile(
  //                       onTap: () => map.showMarker(
  //                         coords: coords,
  //                         title: title,
  //                       ),
  //                       title: Text(map.mapName),
  //                       leading: SvgPicture.asset(
  //                         map.icon,
  //                         height: 30.0,
  //                         width: 30.0,
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     CustomToast.showSimpleToast(msg: "$e");
  //   }
  // }

  // static Future<String> getAddress(LatLng latLng, BuildContext context) async {
  //   GeoCode geoCode = GeoCode();

  //   try {
  //     var address = await geoCode.reverseGeocoding(
  //         latitude: latLng.latitude, longitude: latLng.longitude);
  //     var data =
  //         "${address.countryName ?? ""}  ${address.city ?? ""}  ${address.region ?? ""}  ${address.streetAddress ?? ""}";
  //     print(data);
  //     return data;
  //   } catch (e) {
  //     return "";
  //   }
  // }

  // static String convertDigitsToLatin(String s) {
  //   var sb = StringBuffer();
  //   for (int i = 0; i < s.length; i++) {
  //     switch (s[i]) {
  //       //Arabic digits
  //       case '\u0660':
  //         sb.write('0');
  //         break;
  //       case '\u0661':
  //         sb.write('1');
  //         break;
  //       case '\u0662':
  //         sb.write('2');
  //         break;
  //       case '\u0663':
  //         sb.write('3');
  //         break;
  //       case '\u0664':
  //         sb.write('4');
  //         break;
  //       case '\u0665':
  //         sb.write('5');
  //         break;
  //       case '\u0666':
  //         sb.write('6');
  //         break;
  //       case '\u0667':
  //         sb.write('7');
  //         break;
  //       case '\u0668':
  //         sb.write('8');
  //         break;
  //       case '\u0669':
  //         sb.write('9');
  //         break;
  //       default:
  //         sb.write(s[i]);
  //         break;
  //     }
  //   }
  //   return sb.toString();
  // }
