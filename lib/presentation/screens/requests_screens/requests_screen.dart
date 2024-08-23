import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/logic/requests/requests_cubit.dart';
import 'package:osta/logic/requests/requests_cubit.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/requests_components/completed_requests.dart';
import 'package:osta/presentation/components/requests_components/in_progress_requests.dart';
import 'package:osta/presentation/components/requests_components/rejected_requests.dart';
import 'package:osta/presentation/components/requests_components/request_card.dart';
import 'package:osta/presentation/components/requests_components/requests_tab_view.dart';
import 'package:osta/presentation/router/routes.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsCubit, RequestsState>(
      listener: (context, state) {
        // if(state is GetAllOrdersLoadingState){
        //   showAdaptiveDialog<Widget>(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (context) => const LoadingDialog(),
        //   );
        // }
        // else if(state is GetAllOrdersSuccessState){
        //   context.getBack();
        // }
        // else if(state is GetAllOrdersErrorState){
        //   context.getBack();
        //   showAdaptiveDialog<Widget>(
        //     context: context,
        //     builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
        //   );
        // }
      },
      // buildWhen: (prev,current)=> prev is GetAllOrdersLoadingState && current is GetAllOrdersSuccessState,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(title: 'setting.my_requests'.tr(context)),
            body: DefaultTabController(
              length: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    RequestTabViewBar(),
                    SizedBox(height: 24.h,),
if(state is GetAllOrdersLoadingState)
               Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
else if (state is GetAllOrdersErrorState)
         Column(
           children: [
             Center(child: Text(state.errorMsg,),),
             IconButton(onPressed: ()async{
               await context.read<RequestsCubit>().getAllOrders();
             }, icon: Icon(Icons.refresh))
           ],
         )
        else if (state is GetAllOrdersSuccessState)
         Expanded(
        child: TabBarView(children: [
        InProgressRequests(requests: state.allOrders??[]),
        CompletedRequests(requests: state.allOrders??[]),
        RejectedRequests(requests: state.allOrders ?? [],)

        ]),
        )
                  // Builder(
                  //   builder: (context) {
                  //     switch (state){
                  //       case GetAllOrdersLoadingState:
                  //         return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
                  //     case GetAllOrdersErrorState:
                  //        state as GetAllOrdersErrorState;
                  //     return Center(child: Text(state.errorMsg,),);
                  //     case GetAllOrdersSuccessState:
                  //       var st = state as GetAllOrdersSuccessState;
                  //     return Expanded(
                  //         child: TabBarView(children: [
                  //           InProgressRequests(requests: st.allOrders??[]),
                  //           CompletedRequests(requests: st.allOrders??[]),
                  //           RejectedRequests(requests: st.allOrders ?? [],)
                  //
                  //         ]),
                  //       );
                  //
                  //       default: return SizedBox();
                  //   }
                  //   }
                  // )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
