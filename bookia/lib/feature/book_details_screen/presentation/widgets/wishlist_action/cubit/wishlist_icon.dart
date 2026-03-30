import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/dialoge.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/feature/book_details_screen/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistActionWidget extends StatelessWidget {
  const WishlistActionWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistActionCubit(),
      child: BlocConsumer<WishlistActionCubit, WishlistActionState>(
        listener: (context, state) {
          if (state is WishlistActionsSuccessState) {
            pop(context);
            showMyDialog(context, state.msg, type: DialogType.success);
          } else if (state is WishlistActionsErrorState) {
            pop(context);
            showMyDialog(context, 'Something went wrong');
          } else if (state is WishlistActionsState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removeFromWishlist(id);
              } else {
                context.read<WishlistActionCubit>().addToWishlist(id);
              }
            },
            icon: cubit.isProductInWishlist(id)
                ? CustomSvgPicture(
                    path: AppImage.save,
                    color: AppColor.primrycolor,
                  )
                : SvgPicture.asset(AppImage.save),
          );
        },
      ),
    );
  }
}
