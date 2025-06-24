import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'core/di/dependency_injection.dart';
import 'core/helpers/app_shared_preferences.dart';
import 'core/routing/app_router.dart';
import 'loadup_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setupGetit(); 
  await AppSharedPreferences().init();
  await ScreenUtil.ensureScreenSize();
  runApp(LoadupApp(appRouter: AppRouter()));
}
