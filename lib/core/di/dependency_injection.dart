// import 'package:dio/dio.dart';
// import 'package:doctor_app/core/networking/crud_dio.dart';
// import 'package:doctor_app/core/networking/network_info.dart';
// import 'package:doctor_app/features/home/data/datasources/home_remote_data_source.dart';
// import 'package:doctor_app/features/home/data/repos/home_repo.dart';
// import 'package:doctor_app/features/home/logic/cubit/home_cubit.dart';
// import 'package:doctor_app/features/login/data/repos/login_repo.dart';
// import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
// import 'package:get_it/get_it.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../features/login/data/datasources/login_remote_data_source.dart';

// final getIt = GetIt.instance;

// Future<void> setupGetit() async {
//   //! feature - login

//   // cubit
//   getIt.registerFactory<LoginCubit>(
//     () => LoginCubit(getIt()),
//   );
//   //repo
//   getIt.registerLazySingleton<LoginRepo>(
//     () => LoginRepo(networkInfo: getIt(), loginRemoteDataSource: getIt()),
//   );
//   //data source
//   getIt.registerLazySingleton<LoginRemoteDataSource>(
//     () => LoginRemoteDataSourceImp(dio: getIt()),
//   );

//   //! feature - home

//   // cubit
//   getIt.registerFactory<HomeCubit>(
//     () => HomeCubit(getIt()),
//   );
//   //repo
//   getIt.registerLazySingleton<HomeRepo>(
//     () => HomeRepo(networkInfo: getIt(), homeRemoteDataSource: getIt()),
//   );
//   //data source
//   getIt.registerLazySingleton<HomeRemoteDataSource>(
//     () => HomeRemoteDataSourceImp(dio: getIt()),
//   );

//   //! Core

//   getIt.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImp(internetConnectionChecker: getIt()),
//   );

//   getIt.registerLazySingleton(() => CrudDio());

//   //! External

//   final sharedPreference = await SharedPreferences.getInstance();
//   getIt.registerLazySingleton(() => sharedPreference);
//   getIt.registerLazySingleton(() => Dio());
//   getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
// }
