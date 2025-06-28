import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loadup_app/features/signup/data/models/signup_response.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());
  //   final LoginRepo _loginRepo;
  // LoginCubit(this._loginRepo) : super(LoginState.initial());

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  // void login() async {
  //   emit(LoginState.loading());
  //   final response = await _loginRepo.login(
  //     LoginRequestBody(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     ),
  //   );
  //   response.fold(
  //     (fail) => emit(LoginState.error(error: fail.toString())),
  //     (loginResponse) => emit(
  //       LoginState.success(loginResponse.message ?? 'Login is success'),
  //     ),
  //   );
  // }
}
