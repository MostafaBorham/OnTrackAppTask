import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:on_track_app/controllers/auth/auth_bloc.dart';
import 'package:on_track_app/core/localization/strings.dart';
import 'package:on_track_app/core/routing/app_routes.dart';
import 'package:on_track_app/ui/resources/app_colors.dart';
import 'package:on_track_app/ui/resources/app_responsive.dart';
import 'package:on_track_app/ui/resources/app_styles.dart';
import 'package:on_track_app/ui/widgets/circular_loader.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is FailSignOutState) {
          Fluttertoast.showToast(
                  msg: state.failMessage,
                  backgroundColor: Theme.of(context).colorScheme.error)
              .then(
            (value) => Navigator.pop(context),
          );
        } else if (state is SuccessSignOutState) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.signinScreen, (route) => false);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                state is WaitingSignOutState
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.s()),
                        child: CircularLoader(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          AuthBloc.get(context).add(SignOutEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            elevation: 0,
                            side: BorderSide(
                                width: 1,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryFixed)),
                        child: AutoSizeText(
                          AppStrings.yes,
                          style: AppStyles.getSemiBoldStyle(
                              fontSize: 10.s(),
                              color:
                                  Theme.of(context).colorScheme.onPrimaryFixed),
                        ),
                      ),
                SizedBox(
                  width: 10.w(),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      elevation: 0,
                      side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.onPrimaryFixed)),
                  child: AutoSizeText(
                    AppStrings.cancel,
                    style: AppStyles.getSemiBoldStyle(
                        fontSize: 10.s(),
                        color: Theme.of(context).colorScheme.onPrimaryFixed),
                  ),
                ),
              ],
            )
          ],
          content: AutoSizeText(
            AppStrings.areYouSure,
            style: AppStyles.getMediumStyle(
                fontSize: 15.s(),
                color: Theme.of(context).colorScheme.onPrimaryFixed),
          ),
          title: AutoSizeText(
            AppStrings.logout,
            style: AppStyles.getBoldStyle(
                fontSize: 20.s(),
                color: Theme.of(context).colorScheme.onPrimaryFixed),
          ),
        );
      },
    );
  }
}
