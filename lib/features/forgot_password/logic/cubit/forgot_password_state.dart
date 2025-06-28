part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState<T> with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = Loading;
  const factory ForgotPasswordState.success(
    ForgotPasswordResponse forgotResponse,
  ) = Success<T>;
  const factory ForgotPasswordState.error({required String error}) = Error;
}
