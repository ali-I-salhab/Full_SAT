import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/logic/home/sections_cubit/sections_cubit.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/main_cubit/main_state.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_bloc.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_event.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_state.dart';
import 'package:osta/logic/workers_cubits/all_workers_bloc.dart';
import 'package:osta/logic/workers_cubits/all_workers_cubit/all_workers_cubit.dart';
import 'package:osta/logic/workers_cubits/all_workers_state.dart';
import 'package:osta/logic/workers_cubits/all_workers_event.dart';

// import 'package:osta/logic/workers_cubits/all_workers_state.dart';
// import 'package:osta/logic/workers_cubits/all_workers_event.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/components/offer_slider.dart';
import 'package:osta/presentation/components/personal_info_bar.dart';
import 'package:osta/presentation/components/subtitle_row.dart';
import 'package:osta/presentation/router/routes.dart';
import 'package:osta/presentation/screens/main_order_screen.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(
        //   title: 'hello',
        // ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: SizedBox(
            // height: 1070.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24.h,),
                PersonalInfoBar(),
                SizedBox(
                  height: 24.h,
                ),
                OfferSlider(),
                SizedBox(
                  height: 27.h,
                ),
                SubtitleRow(
                  subtitle: 'home.categories'.tr(context),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  flex: 0,
                  child: BlocListener<MainCubit, MainState>(
                    listener: (context, state) async {
                      if (state is GetCategoriesLoadingState) {
                        showAdaptiveDialog<Widget>(
                          context: context,
                          barrierDismissible: false,

                          builder: (context) => const LoadingDialog(),
                        );
                      }
                      else if (state is GetCategoriesSuccessState) {
                        context.getBack();
                        context.navigateTo(
                            routeName: Routes
                                .subCategoriesViewRoute,
                            arguments: state.categories);
                      }
                      else if (state is GetCategoriesErrorState) {
                        context.getBack();
                        showAdaptiveDialog<Widget>(
                          context: context,
                          builder: (context) =>
                              ErrorDialog(errorText: state.errorMsg),
                        );
                      }
                    },
                    child: BlocListener<AllStoresBloc, AllStoresState>(
                      listener: (context, state) {
                        // if (context.read<AllStoresBloc>().isFirstLoad ) {
                        //   print('stores is loading');
                        //   showAdaptiveDialog<Widget>(
                        //     context: context,
                        //     barrierDismissible: false,
                        //     builder: (context) => const LoadingDialog(),
                        //   );
                        // }
                     // else  if(state.status == StoreStatus.success){
                     //     context.navigateTo(
                     //         routeName:
                     //         Routes.mainStoreViewRoute);
                     //   }
                     //    else if (state.status == WorkerStatus.error) {
                     //      context.getBack();
                     //      showAdaptiveDialog<Widget>(
                     //        context: context,
                     //        builder: (context) =>
                     //            ErrorDialog(errorText: state.errorMessage),
                     //      );
                     //    }
                      },
                      child: BlocListener<AllWorkersBloc, AllWorkersState>(
                        listener: (context, state) {
                          // if (state.status == WorkerStatus.loading &&
                          //     state.workers.length == 0) {
                          //   showAdaptiveDialog<Widget>(
                          //     context: context,
                          //     barrierDismissible: false,
                          //     builder: (context) => const LoadingDialog(),
                          //   );
                          // }
                          // else if (state.status == WorkerStatus.success) {
                          //   context.getBack();
                            // context.navigateTo(
                            //     routeName: Routes
                            //         .allWorkersViewRoute,
                            //     arguments: state.workers);
                          // }
                          // else if (state.status == WorkerStatus.error) {
                          //   context.getBack();
                          //   showAdaptiveDialog<Widget>(
                          //     context: context,
                          //     builder: (context) =>
                          //         ErrorDialog(errorText: state.errorMessage),
                          //   );
                          // }
                        },

                        child: BlocBuilder<SectionsCubit, SectionsState>(
                          builder: (context, state) {
                            final sections = context
                                .read<SectionsCubit>()
                                .getServices(context);
                            return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                // padding: EdgeInsets.symmetric(horizontal: 32.w),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 174.w / 174.h,
                                  mainAxisExtent: 174.w,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.w,
                                ),
                                itemCount: sections.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () async {
                                        if (sections[index].serviceId == 1) {
                                          // context.navigateTo(
                                          //     routeName:
                                          //     Routes.cleaningCategoriesViewRoute);
                                          // Routes.maintenanceCategoriesViewRoute);
                                          await context.read<MainCubit>()
                                              .getCategories('maintenance');
                                        } else if (sections[index].serviceId ==
                                            2) {
                                          // context.navigateTo(
                                          //     routeName: Routes
                                          //         .allWorkersViewRoute,arguments:
                                          //   context.read<AllWorkersCubit>().workers
                                          // );
                                          // context.read<AllWorkersCubit>().currentPage=1;
                                          // await context.read<AllWorkersCubit>()
                                          //     .getAllWorkers();
                                          await context.read<AllWorkersBloc>()
                                            ..add(GetWorkersEvent(firstPage:1));
                                          context.navigateTo(
                                              routeName:
                                              Routes.allWorkersViewRoute,arguments: <WorkerModel>[]);
                                        } else if (sections[index].serviceId ==
                                            3) {
                                          context.navigateTo(
                                              routeName:
                                              Routes.transportMainViewRoute);
                                        } else if (sections[index].serviceId ==
                                            4) {
                                          context.read<AllStoresBloc>().isCatSelected = null ;
                                          await context.read<AllStoresBloc>()
                                            ..add(GetStoresEvent(firstPage: 1));
                                          context.navigateTo(routeName: Routes.mainStoreViewRoute);
                                        } else if (sections[index].serviceId ==
                                            5) {
                                          await context.read<MainCubit>()
                                              .getCategories('cleaning');
                                        } else if (sections[index].serviceId ==
                                            6) {
                                          context.navigateTo(
                                              routeName: Routes
                                                  .gasCategoriesViewRoute);
                                        } else if (sections[index].serviceId ==
                                            7) {
                                          context.navigateTo(
                                              routeName: Routes
                                                  .tenderCategoriesViewRoute);
                                        }
                                      },
                                      child: CategoryCard(
                                        title: sections[index].serviceName,
                                        image: sections[index].serviceLogo,
                                      ));
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SubtitleRow(
                  subtitle: 'home.most_requested_services'?.tr(context) ??
                      'Most requested services',
                ),
                SizedBox(
                  height: 16.h,
                ),
                OfferSlider(cardHeight: 110.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
