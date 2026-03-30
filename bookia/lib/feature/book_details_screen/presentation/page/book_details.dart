import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/cart_action/cubit/cart_icon.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/wishlist_action/cubit/wishlist_icon.dart';
import 'package:bookia/feature/home/data/models/best_seller_books_respons/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsArg {
  final Product product;
  final String source;
  DetailsArg({required this.product, required this.source});
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final Product model;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: GestureDetector(
            onTap: () => pop(context),
            child: CustomSvgPicture(path: AppImage.back),
          ),
          actions: [WishlistActionWidget(id: model.id ?? 0)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: model.id ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        model.image ?? '',
                        width: 180,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(11),
                  Text(
                    model.name ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(11),
                  Text(
                    model.category ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyles.body.copyWith(
                      color: AppColor.primrycolor,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    model.description ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyles.body.copyWith(color: AppColor.blackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${model.price} \$', style: TextStyles.title),
              CartActionWidget(id: model.id ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
