import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/logic/requests/requests_cubit.dart';
import 'package:osta/logic/workers_cubits/all_workers_bloc.dart';
import 'package:osta/logic/workers_cubits/all_workers_cubit/all_workers_cubit.dart';
import 'package:osta/logic/workers_cubits/all_workers_state.dart';

import 'package:osta/logic/workers_cubits/all_workers_event.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';
import 'package:osta/presentation/components/worker_components/worker_info_card.dart';

class ALlWorkersScreen extends StatefulWidget {
  ALlWorkersScreen({super.key,required this.workers});
  final List<WorkerModel> workers;

  @override
  State<ALlWorkersScreen> createState() => _ALlWorkersScreenState();
}

class _ALlWorkersScreenState extends State<ALlWorkersScreen> {

  final scrollController = ScrollController();
  void initState(){
    super.initState();
    scrollController.addListener(onScroll);
  }
  void dispose(){
    scrollController..removeListener(onScroll)..dispose();
    super.dispose();
  }
  int page = 1;

  void onScroll(){
    final maxScroll =  scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if(currentScroll >= (maxScroll*0.8)){
      // context.read<AllWorkersCubit>().getAllWorkers(pageNum: page+1);
      context.read<AllWorkersBloc>().add(GetWorkersEvent());
    }
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AllWorkersBloc, AllWorkersState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'common.worker'.tr(context),),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            controller: scrollController,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24.h),
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Icon(Iconsax.setting_4_copy, size: 24.w,)),
                    SizedBox(width: 20.w,),
                    Expanded(
                      child: CustomSearchbar(),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
               state.status == WorkerStatus.loading
?                Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
               :state.status == WorkerStatus.error
              ? Column(
                children: [
                  Center(child: Text(state.errorMessage),),

                ],
              )
              : state.status == WorkerStatus.success
                ? state.workers.isEmpty
               ? Center(child: Text('There is No Workers yet'),)
                   : ListView.builder(
                 // controller: scrollController,
                   shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   itemCount: state.hasReachedMax? state.workers.length : state.workers.length + 1,
                   itemBuilder: (context, index) {
                     return index >= state.workers.length ?  Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                         : WorkerInfoCard
                       (worker: state.workers[index]);
                   })
                   :SizedBox()



                //
                // PagedListView(pagingController: _pagingController,
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   builderDelegate: PagedChildBuilderDelegate<WorkerModel>(
                //       itemBuilder: (context, worker, index) => WorkerInfoCard
                //                 (worker: worker))
                // ),
              ],
            ),
          ),
        ),
      );
  },
);
  }
  //
  //
  // @override
  // void dispose() {
  //   scrollController
  //     ..removeListener(_onScroll)
  //     ..dispose();
  //   super.dispose();
  // }
  //
  // void _onScroll() {
  //   if (_isBottom)
  //     context.read<AllWorkersCubit>().getWorkers();
  //     // context.read<AllWorkersBloc>().add(GetWorkersEvent());
  // }
  //
  // bool get _isBottom {
  //   if (!scrollController.hasClients) return false;
  //   final maxScroll = scrollController.position.maxScrollExtent;
  //   final currentScroll = scrollController.offset;
  //   return currentScroll >= (maxScroll * 0.9);
  // }
}
