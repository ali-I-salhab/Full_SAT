import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/router/routes.dart';


class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key,required this.categories}) : super(key: key);
  final List<void> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 174.w/174.h,
          mainAxisExtent: 170.w,
          crossAxisCount:2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.all(2),
        itemBuilder: (context,index){
          return InkWell(
              onTap: (){
                context.navigateTo(routeName: Routes.orderDetailsViewRoute);
                // context.navigateTo(routeName: Routes.allWorkersViewRoute);
              },
              child: CategoryCard(title: 'category name',image: 'assets/images/group.png',));

        }
    );
  }
}
