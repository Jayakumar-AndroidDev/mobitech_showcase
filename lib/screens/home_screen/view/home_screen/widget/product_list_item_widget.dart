import 'package:flutter/material.dart';
import 'package:mobitech_task/core/app_color/app_color.dart';
import 'package:mobitech_task/core/app_util/app_util.dart';
import 'package:mobitech_task/screens/home_screen/model/product_model.dart';
import 'package:mobitech_task/screens/home_screen/view/home_screen/widget/expand_text_widget.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final ProductModel? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 0 : 15, left: 15, right: 15),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 1, color: AppColor.shadowColor)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            item?.imageLink ?? '-',
            width: double.maxFinite,
            height: AppUtil.getWidth(context) * 0.50,
            fit: BoxFit.contain ,
          ),
          AppUtil.heightSpace(10),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.name ?? "-",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                AppUtil.heightSpace(10),
                Text(item?.brand ?? "-", textAlign: TextAlign.start),
                AppUtil.heightSpace(10),
                Text(
                  "\u{20B9}${item?.price ?? "-"}",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AppUtil.heightSpace(5),
                Row(
                  children: [
                    for (var i = 0; i < 4; i++) ...[ratingIcon()],
                  ],
                ),
                AppUtil.heightSpace(10),
                ExpandTextWidget(text: item?.description ?? '-'),
                AppUtil.heightSpace(10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingIcon() => Icon(Icons.star);
}
