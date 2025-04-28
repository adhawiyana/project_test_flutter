import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_test_flutter/route/route_name.dart';
import 'package:project_test_flutter/route/route_page.dart';
import 'package:project_test_flutter/utils/controller_bind.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const AppView();
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  String pageName = '';

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.grey.shade300,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  updatePageRoute(value) {
    try {
      var name = value!.route!.settings.name.toString();
      setState(() => pageName = name);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: 'Diskominfo',
        navigatorKey: Get.key,
        getPages: RoutePage.pages,
        initialRoute: RouteName.INITIAL,
        locale: const Locale('id', 'ID'),
        initialBinding: ControllerBind(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          splashColor: Colors.white,
          highlightColor: Colors.white,
          brightness: Brightness.light,
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: Color(0XFFF0F0F0),
          appBarTheme: AppBarTheme(backgroundColor: Color(0XFFF0F0F0)),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(overlayColor: Colors.grey.shade700),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
        ),
        routingCallback: (value) {
          if (value != null) {
            updatePageRoute(value);
          }
        },
        builder:
            (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Stack(children: [child!]),
          ),
        ),
      ),
    );
  }
}
