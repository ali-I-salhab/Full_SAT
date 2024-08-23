import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/main_service_model.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_bloc.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_event.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_state.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_state.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_bloc.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_event.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/store_components/store_card.dart';
import 'package:osta/presentation/components/store_components/store_category_container.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';
import 'package:osta/presentation/router/routes.dart';

class MainStoresScreen extends StatefulWidget {
  const MainStoresScreen({super.key});

  @override
  State<MainStoresScreen> createState() => _MainStoresScreenState();
}

class _MainStoresScreenState extends State<MainStoresScreen> {
  final scrollController = ScrollController();

  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= (maxScroll * 0.8)) {
      // context.read<AllWorkersCubit>().getAllWorkers(pageNum: page+1);
   if(context
       .read<AllStoresBloc>()
       .isCatSelected ==null){
      context.read<AllStoresBloc>().add(GetStoresEvent());
    }else{
     context.read<AllStoresBloc>().add(GetStoresByCatEvent(selectedCat: context
         .read<AllStoresBloc>()
         .isCatSelected));

   }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStoreCubit, MainStoreState>(
      builder: (context, state) {
        final List<MainService> storeCats =
            context.read<MainStoreCubit>().getStoreCategories(context);
        return BlocBuilder<AllStoresBloc, AllStoresState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: CustomAppBar(title: 'common.store'.tr(context)),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomSearchbar(),
                      SizedBox(
                        height: 18.h,
                      ),
                      // LabelText(labelText: 'Categories'),
                      StatefulBuilder(
                        builder: (context,setState) {
                          return Container(
                            height: 40.h,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: storeCats.length,
                                // padding: EdgeInsets.only(right: 16.w),
                                itemBuilder: (context, index) {

                                    return InkWell(
                                        onTap: () {
                                          // final selectedCat = context.read<AllStoresBloc>().isCatSelected == storeCats[index].serviceName ;
                                          setState(() {
                                            context
                                                    .read<AllStoresBloc>()
                                                    .isCatSelected =
                                                storeCats[index].serviceName;
                                          });
                                          print(storeCats[index].serviceName);
                                          context.read<AllStoresBloc>().add(GetStoresByCatEvent(selectedCat: storeCats[index].serviceName,firstPage: 1));
                                          print(storeCats[index].serviceName);

                                        },
                                        child: StoreCategoryItem(
                                          cat: storeCats[index],
                                          isSelected: context
                                                  .read<AllStoresBloc>()
                                                  .isCatSelected ==
                                              storeCats[index].serviceName,
                                        ));
                                  })
                          );
                        }
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Text(
                        'store.result'.tr(context) + ' : '+state.stores.length.toString(),
                        style: AppTextStyles.labelTextStyle,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      state.status == StoreStatus.loading
                          ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                          :state.status == StoreStatus.error
                          ? Center(child: Text(state.errorMessage),)
                          : state.status == StoreStatus.success
                          ? state.stores.isEmpty
                          ? Center( child: Text('There is No stores added yet'),)
                          : Expanded(
                        child: ListView.builder(
                            controller: scrollController,
                            itemCount: state.hasReachedMax
                                ? state.stores.length
                                : state.stores.length + 1,
                            itemBuilder: (context, index) {
                              return index >= state.stores.length
                                  ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              )
                                  : InkWell(
                                  onTap: () async{
                                await context
                                        .read<StoreProductsBloc>()
                                        ..add(GetStoreProductsEvent(
                                        storeId: state
                                            .stores[index]
                                            .storeId,firstPage:1));
                                    context.navigateTo(
                                        routeName: Routes
                                            .storeProductsViewRoute,
                                        arguments: state
                                            .stores[index].storeId);
                                  },
                                  child: StoreInfoCard(
                                      store: state.stores[index]));
                            }),
                      )
                          :SizedBox()


                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
