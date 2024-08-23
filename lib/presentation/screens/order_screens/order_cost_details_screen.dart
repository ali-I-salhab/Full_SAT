import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/parameter_models/order_cost_info_parameter.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/main_cubit/main_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/cobon_activation_component.dart';
import 'package:osta/presentation/components/order_components/main_details_card.dart';
import 'package:osta/presentation/components/order_components/order_cost_detail_card.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/payment_button.dart';
import 'package:osta/presentation/router/routes.dart';

class OrderCostDetailsScreen extends StatelessWidget {
  const OrderCostDetailsScreen({super.key, this.orderCostInfoParam});

  final OrderCostInfoParam? orderCostInfoParam;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.order_details'.tr(context)),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) async {
            if (state is CreateClientOrderLoadingState) {
              showAdaptiveDialog<Widget>(
                context: context,
                barrierDismissible: false,
                builder: (context) => const LoadingDialog(),
              );
            } else if (state is CreateClientOrderSuccessState) {
              context.getBack();
              context.navigateTo(
                  routeName: Routes.orderDetailsViewRoute,
                  arguments: state.orderDetails);
            } else if (state is CreateClientOrderErrorState) {
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
                // mainAxisSize: MainAxisSize.min,
                children: [
                  // MainDetailsCard(),
                  ServiceTypeCard(
                      serviceType: orderCostInfoParam?.orderTitle ?? ''),
              SizedBox(height: 32.h,),
                  OrderCostDetailsCard(invoice: orderCostInfoParam?.orderInvoice ?? InvoiceModel(transportCost: 0.0,tax: 0.0, total: 0.0,cost: 0.0)),
                  SizedBox(
                    height: 32.h
                  ),
                  CobonActivationComponent(),
                  SizedBox(height: 53.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Center(
                      child: Text(
                        'order_details.if_there_are_spare_parts_the_purchase_cost_will_be_added'
                            .tr(context),
                        softWrap: true,
                        style:
                            AppTextStyles.subtitleStyle.copyWith(fontSize: 18),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        PaymentButton(onTap: () {}, buttonText: 'buttonText'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                        onTap: () async {
                          print(context.read<MainCubit>().userInputs);
                          await context
                              .read<MainCubit>()
                              .createClientOrder(
                                  data: context.read<MainCubit>().userInputs,
                                  id: orderCostInfoParam!.formId,
                                  updated: orderCostInfoParam!.updatedAt,
                                  invoice: orderCostInfoParam!.orderInvoice)
                              ;
                        },
                        buttonText: 'order_details.order_now'.tr(context)),
                  ),
                  SizedBox(
                    height: context.height * 0.07,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
