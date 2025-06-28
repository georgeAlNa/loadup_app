import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadup_app/core/constant/app_strings.dart';

import '../../../../core/constant/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/button_widget.dart';
import '../widgets/signup_footer.dart';
import '../widgets/signup_form.dart';
import '../widgets/signup_header.dart';

class SignupScreen extends StatefulWidget {
  final String role;
  const SignupScreen({super.key, required this.role});

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedJob = AppStrings.driver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  verticalSpace(80),
                  const SignupHeader(),
                  verticalSpace(20),
                  SignupForm(
                    fullNameController: fullNameController,
                    phoneController: phoneController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    cityController: cityController,
                    selectedJob: selectedJob,
                    onJobChanged: (job) => setState(() => selectedJob = job),
                  ),
                  verticalSpace(20),
                  ButtonWidget(
                    title: AppStrings.signUp,
                    onTap: () {
                      if (!formKey.currentState!.validate()) {}
                    },
                    textStyle: AppTextStyles.font14WhiteBold,
                  ),
                  verticalSpace(20),
                  SignupFooter(role: widget.role),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
