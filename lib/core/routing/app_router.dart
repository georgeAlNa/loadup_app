import 'package:flutter/material.dart';
import 'package:loadup_app/features/signup/presentation/screens/signup_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/forgot_password/presentation/screens/forgot_password_screen.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/on_boarding/on_boarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.loginScreen:
        final String role = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LoginScreen(role: role));
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.signupScreen:
        final String role = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SignupScreen(role: role));
      //   case Routes.homeScreen:
      //     return MaterialPageRoute(
      //       builder:
      //           (_) => BlocProvider(
      //             create: (context) => getIt<HomeCubit>()..sspecializationData(),
      //             child: HomeScreen(),
      //           ),
      //     );
      default:
        return null;
      //   //  MaterialPageRoute(
      //   //   builder: (_) => Scaffold(
      //   //     body: Center(
      //   //       child: Text('No Routes'),
      //   //     ),
      //   //   ),
      //   // );
    }
  }
}
