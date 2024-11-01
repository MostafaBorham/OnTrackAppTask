import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_track_app/controllers/auth/auth_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/core/utils/validation.dart';
import 'package:on_track_app/ui/components/toasts.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/widgets/app_logo.dart';
import 'package:on_track_app/ui/widgets/auth_input_field.dart';
import 'package:on_track_app/ui/widgets/change_auth_page_line.dart';
import 'package:on_track_app/ui/widgets/circular_loader.dart';
import 'package:on_track_app/ui/widgets/sign_btn.dart';

class SignUpMobileLayout extends StatefulWidget {
  const SignUpMobileLayout({super.key});

  @override
  SignUpMobileLayoutState createState() => SignUpMobileLayoutState();
}

class SignUpMobileLayoutState extends State<SignUpMobileLayout> {
  bool securePassword = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w()),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is GetSignupNameState) {
                  _nameController.text = state.name;
                }
                if (state is GetSignupEmailState) {
                  _emailController.text = state.email;
                }
                if (state is GetSignupPasswordState) {
                  _passwordController.text = state.password;
                }
                if (state is FailSignUpState) {
                  showErrorToast(context: context, message: state.failMessage);
                }
                if (state is SuccessSignUpState) {
                  showSuccessToast(
                      context: context,
                      message:
                          '${AppStrings.welcome} ${FirebaseAuth.instance.currentUser!.displayName!}');
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.productsScreen);
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppLogo(
                      logoH: 100.s(),
                      logoW: 100.s(),
                    ),
                    const SizedBox(height: 50),
                    AuthInputField(
                      controller: _nameController,
                      inputType: TextInputType.name,
                      hint: AppStrings.yourNameKey,
                      label: AppStrings.nameKey,
                      maxLength: 30,
                      validator: AppValidation.validateUserName,
                      prefix: const Icon(Icons.perm_identity),
                    ),
                    const SizedBox(height: 8),
                    AuthInputField(
                      controller: _emailController,
                      inputType: TextInputType.emailAddress,
                      hint: AppStrings.yourEmailKey,
                      label: AppStrings.emailKey,
                      maxLength: 30,
                      validator: AppValidation.validateEmail,
                      prefix: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 8),
                    AuthInputField(
                      controller: _passwordController,
                      inputType: TextInputType.text,
                      hint: AppStrings.yourPasswordKey,
                      label: AppStrings.passwordKey,
                      maxLength: 11,
                      validator: AppValidation.validatePassword,
                      obsecureText: securePassword,
                      prefix: const Icon(Icons.security),
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              securePassword = !securePassword;
                            });
                          },
                          icon: Icon(securePassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: state is WaitingSignUpState
                          ? CircularLoader(
                              color: Theme.of(context).colorScheme.surface,
                            )
                          : SignBtn(
                              color: Theme.of(context).colorScheme.surface,
                              title: AppStrings.signup,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthBloc.get(context).add(SignUpEvent(
                                      userName: _nameController.text,
                                      userEmail: _emailController.text,
                                      userPassword: _passwordController.text));
                                }
                              },
                            ),
                    ),
                    ChangeAuthPageLine(
                      question: AppStrings.haveAccountKey,
                      authType: AppStrings.signinKey,
                      changeAuthEvent: state is WaitingSignUpState
                          ? null
                          : () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.signinScreen);
                            },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
