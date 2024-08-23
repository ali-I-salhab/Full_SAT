import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/address_model.dart';
import 'package:osta/data/models/user_info_params.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/logic/location/location_cubit.dart';
import 'package:osta/logic/location/location_cubit.dart';
import 'package:osta/logic/location/location_state.dart';
import 'package:osta/logic/on_boarding/on_boarding_slider.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/profile/profile_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_custom_text.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/app_logo_container.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/bottom_sheets/edit_profile_image_sheet.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/router/routes.dart';

class ProfileConfigScreen extends StatefulWidget {
  const ProfileConfigScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<ProfileConfigScreen> createState() => _ProfileConfigScreenState();
}

class _ProfileConfigScreenState extends State<ProfileConfigScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int? selectedAddress;
  int? selectedRegion;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          // listener: (context, state) async {
          //     if(
          //     state.editUserInfoState == RequestState.loading ||
          //     state.changUserImageState == RequestState.loading ||
          //     state.deleteUserImageState == RequestState.loading
          //     ){
          //       await      showAdaptiveDialog<Widget>(
          //         context: context,
          //         barrierDismissible: false,
          //
          //         builder: (context) => const LoadingDialog(),
          //       );   }
          //     else if(
          //     state.editUserInfoState == RequestState.loaded ||
          //         state.changUserImageState == RequestState.loaded ||
          //         state.deleteUserImageState == RequestState.loaded
          //     ){
          //  context.getBack();
          //  context.getBack();
          //     }
          //     else if (
          //     state.editUserInfoState == RequestState.error ||
          //         state.changUserImageState == RequestState.error ||
          //         state.deleteUserImageState == RequestState.error
          //     ) {
          //       context.getBack();
          //       showAdaptiveDialog<Widget>(
          //         context: context,
          //         builder: (context) =>  ErrorDialog(errorText: state.editUserInfoMessage),
          //       );
          //     }
          //
          // },
          listener: (context, state) async {
            if (state is EditUserInfoSuccessState) {
              context.getBack();
              context.getBack();
              context.getBack();
            } else if (state is EditUserInfoLoadingState) {
              showAdaptiveDialog<Widget>(
                context: context,
                barrierDismissible: false,
                builder: (context) => const LoadingDialog(),
              );
            } else if (state is EditUserInfoErrorState) {
              context.getBack();
              showAdaptiveDialog<Widget>(
                context: context,
                builder: (context) => ErrorDialog(errorText: state.errorMsg),
              );
            }

            // if(state is ChangeProfileImageSuccessState){
            //    context.getBack();
            //    context.getBack();
            //  }
            else if (state is ChangeProfileImageLoadingState) {
              showAdaptiveDialog<Widget>(
                context: context,
                barrierDismissible: false,
                builder: (context) => const LoadingDialog(),
              );
            } else if (state is ChangeProfileImageErrorState) {
              context.getBack();
              showAdaptiveDialog<Widget>(
                context: context,
                builder: (context) => ErrorDialog(errorText: state.errorMsg),
              );
            }
          },

          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  // AppLogoContainer(),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        // p.profileImage = await BlocProvider.of<HomeCubit>(context).pickImage();
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Stack(children: [
                        Container(
                          // margin: EdgeInsets.all(12),
                          padding: EdgeInsets.all(2.w),
                          // height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.secondaryColor, width: 1),
                              borderRadius: BorderRadius.circular(100.r)),
                          child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.2,
                              // height: MediaQuery.of(context).size.width * 0.2,
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child:
                                // widget.user.image != null
                                context.read<ProfileCubit>().pickedImage != null
                                    ? Image.file(
                                        context
                                            .read<ProfileCubit>()
                                            .pickedImage!,
                                        // Image.network(
                                        //          widget.user.image!,
                                        fit: BoxFit.cover,
                                        height: 110.h,
                                        width: 110.w,
                                      )
                                    : widget.user.image != null
                                        ? Image.network(
                                            widget.user.image!,
                                            fit: BoxFit.cover,
                                            height: 110.h,
                                            width: 110.w,
                                          )
                                        : Image.asset(
                                            'assets/images/profile.png',
                                            fit: BoxFit.cover,
                                            height: 110.h,
                                            width: 110.w,
                                          ),
                          )),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () async {
                                await showModalBottomSheet(
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return EditProfileImageSheet(
                                        profileImage: widget.user.image,
                                      );
                                    });
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                size: 24.w,
                              ),
                              color: AppColors.primaryColor,
                            ))
                      ]),
                    ),
                  ),

                  SizedBox(
                    height: 32.h,
                  ),
                  LabelText(
                    labelText: 'enter_your_name',
                    // labelText: 'profile.enter_your_name'.tr(context),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    controller: nameController..text = widget.user.name ?? '' ,
                    hintText: 'user name',

                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  LabelText(
                    labelText: 'enter_your_email',
                    // labelText: 'profile.enter_your_email'.tr(context),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextField(
                    inputType: TextInputType.emailAddress,
                    controller: emailController..text=widget.user.email ?? '',
                    hintText: 'test@example.com',
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  LabelText(
                    // labelText: 'select_your_address',
                    labelText: 'profile.select_your_address'.tr(context),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<LocationCubit, LocationState>(
                    // buildWhen:(prev,current)=>prev.mainAddresses != current.mainAddresses ,
                    builder: (context, state) {
                      // final regions = context
                      //     .read<LocationCubit>()
                      //     .maiAddresses.where((element) => element.addressId == selectedAddress).first.regions ?? [] ;
                      if (state.mainAddresses != [])
                        return Column(
                          children: [
                            AppDropDown(
                              value: selectedAddress,
                              items: [],
                              customItems:
                                  //   state.mainAddresses!
                                  context
                                      .read<LocationCubit>()
                                      .maiAddresses
                                      .map((item) {
                                return DropdownMenuItem(
                                  value: item.addressId,
                                  child: Text(item.addressName),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedAddress = value!;
                                  selectedRegion = null;
                                });
                              },
                            ),
                            SizedBox(height: 16.h,),
                         selectedAddress != null &&
                             context.read<LocationCubit>().maiAddresses.firstWhere((element) => element.addressId == selectedAddress).regions !=null
                    &&
                             context.read<LocationCubit>().maiAddresses.firstWhere((element) => element.addressId == selectedAddress).regions.isNotEmpty
                         ?  AppDropDown(
                              value: selectedRegion,
                              items: [],
                              customItems:
                                  //   state.mainAddresses!
                      // context.read<LocationCubit>()
                      //     .maiAddresses.elementAt(
                      context.read<LocationCubit>().maiAddresses.firstWhere((element) => element.addressId == selectedAddress).regions
                      .map((item) {
                                return DropdownMenuItem(
                                  value: item.regionId,
                                  child: Text(item.regionName),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedRegion = value!;
                                });
                              },
                            ): SizedBox(),
                          ],
                        );
                      else
                        return SizedBox();
                    },
                  ),

                  SizedBox(
                    height: 53.h,
                  ),

                  AppButton(
                      onTap: () async {
                        // context.navigateTo(
                        //     routeName: Routes.selectLocationViewRoute,
                        //     arguments: UserInfoParam(name: 'name', email: 'email'));
                        if (context.read<ProfileCubit>().pickedImage != null) {
                          await context
                              .read<ProfileCubit>()
                              .changeProfileImage(
                                  image:
                                      context.read<ProfileCubit>().pickedImage!)
                              .then((value) async => await context
                                  .read<ProfileCubit>()
                                  .editAccount(
                                      name: nameController.text != ''
                                          ? nameController.text
                                          : widget.user.name ?? '',
                                      email: emailController.text != ''
                                          ? emailController.text
                                          : widget.user.email ?? '',
                                      addressId: selectedAddress != null
                                          ? selectedAddress.toString()
                                          : widget.user.addressId ?? null,
                                      addressDesc: '',
                                      gps: []));
                        } else {
                          await context.read<ProfileCubit>().editAccount(
                              name: nameController.text != ''
                                  ? nameController.text
                                  : widget.user.name ?? '',
                              email: emailController.text != ''
                                  ? emailController.text
                                  : widget.user.email ?? '',
                              deviceToken: '',
                              addressId: selectedAddress != null
                                  ? selectedAddress.toString()
                                  : widget.user.addressId ?? null,
                              addressDesc: '',
                              gps: []);
                        }
                      },
                      buttonText: 'common.submit'.tr(context))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
