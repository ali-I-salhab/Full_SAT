
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/logic/auth/auth_cubit.dart';
import 'package:osta/logic/auth/auth_state.dart';
import 'package:osta/logic/location/location_cubit.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/profile/profile_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/profile_info_row.dart';
import 'package:osta/presentation/components/profile_main_info_card.dart';
import 'package:osta/presentation/router/routes.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key,required this.user});
final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'common.profile'.tr(context),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {

          },
          // buildWhen: (previous, current) =>
          //     previous.getUserInfoState != current.getUserInfoState,
          builder: (context, state) {
            // switch (state.getUserInfoState) {
            //   case RequestState.loading:
            //     return Center(
            //       child: CircularProgressIndicator(
            //         color: AppColors.primaryColor,
            //       ),
            //     );
            //   case (RequestState.loaded):
                return Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    ProfileMainInfoCard(
                      isProfilePage: true,
                      profileImage: user.image,
                      // userName: state.userInfo?.name,
                      user: user
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    ProfileInfoRow(
                        icon: Icons.account_circle_outlined,
                        info: user.name ?? 'username'),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProfileInfoRow(
                        icon: Icons.phone_outlined,
                        info: user.phone ?? ''),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProfileInfoRow(
                        icon: Icons.email_outlined,
                        info: user.email ?? 'useremail@example.com'),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProfileInfoRow(
                        icon: Iconsax.location_copy,
                        info:
                            user.addressDescription ?? 'edit your info to add location'),
                    SizedBox(
                      height: 53.h,
                    ),
                    AppButton(
                        onTap: () async {
                          context.navigateTo(routeName: Routes.profileConfigViewRoute,arguments: user);
                          await  context.read<LocationCubit>().getAddresses();
                        },
                        buttonText:'Edit Your Information'
                            // 'profile.delete_account'.tr(context)
            )
                  ],
                );
              // case (RequestState.error):
              //   return Center(
              //     child: Text(state.getUserInfoMessage),
              //   );
            // }
          },
        ),
      ),
    );
  }
}
