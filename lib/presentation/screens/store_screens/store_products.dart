import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_state.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_bloc.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_event.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_state.dart';
import 'package:osta/presentation/components/app_bar_actions/cart_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/store_components/product_card.dart';
import 'package:osta/presentation/components/store_components/store_category_container.dart';
import 'package:osta/presentation/components/subtitle_row.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';

class StoreProductsScreen extends StatefulWidget {
  const StoreProductsScreen({super.key,required this.storeId});
  final int storeId;

  @override
  State<StoreProductsScreen> createState() => _StoreProductsScreenState();
}

class _StoreProductsScreenState extends State<StoreProductsScreen> {
  final scrollController = ScrollController();
  void initState(){
    super.initState();
    scrollController.addListener(onScroll);
  }
  void dispose(){
    scrollController..removeListener(onScroll)..dispose();
    super.dispose();
  }

  void onScroll(){
    final maxScroll =  scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if(currentScroll >= (maxScroll*0.8)){
      // context.read<AllWorkersCubit>().getAllWorkers(pageNum: page+1);
      context.read<StoreProductsBloc>().add(GetStoreProductsEvent(storeId: widget.storeId));
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainStoreCubit, MainStoreState>(
  listener: (context, state) {
   if(state is AddedToCartState){
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('store.added_to_cart_successfully'.tr(context)),
           padding: EdgeInsets.all(16.w),
           margin: EdgeInsets.all(20.w),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(16.r))
           ),
           duration: Duration(seconds: 1),
           behavior: SnackBarBehavior.floating,
           backgroundColor: Colors.grey,
           elevation: 0,
         ));

  }
  },
  builder: (context, state) {
    return BlocConsumer<StoreProductsBloc, AllProductsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Store name',actions: [CartButton()]),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h,),
              CustomSearchbar(),
              SizedBox(height: 18.h,),
              SubtitleRow(subtitle: 'common.categories'.tr(context),onTap: (){},),
              SizedBox(height: 10.h,),
              Container(
                height: 40.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    // padding: EdgeInsets.only(right: 16.w),
                    itemBuilder: (context, index) {
                      return StoreCategoryItem();
                    }),
              ),
              SizedBox(height: 32.h,),

              state.status == ProductStatus.loading
                  ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                  :state.status == ProductStatus.error
                  ? Center(child: Text(state.errorMessage),)
                  : state.status == ProductStatus.success
                  ? state.products.isEmpty
                  ? Center( child: Text('There is No products yet'),)
                  : Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: state.hasReachedMax? state.products.length : state.products.length + 1,
                    itemBuilder: (context, index) {
                      return index >= state.products.length ?  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                          :ProductCard(product:state.products[index]) ;
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
