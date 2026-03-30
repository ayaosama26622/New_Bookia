import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/core/widgets/custom_text_from_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/feature/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:bookia/feature/place_order/presentation/cubit/place_order_state.dart';
import 'package:bookia/feature/place_order/presentation/widgets/gov_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatefulWidget {
  final String total;

  const PlaceOrderScreen({super.key, required this.total});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _governorateController = TextEditingController();
  int? _selectedGovernorateId;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _governorateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceOrderCubit()..getGovernorates(),
      child: BlocListener<PlaceOrderCubit, PlaceOrderState>(
        listener: (context, state) {
          if (state is PlaceOrderSuccessState) {
            pushTo(context, Routes.congrats);
          }
          if (state is PlaceOrderErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: GestureDetector(
              onTap: () => pop(context),
              child: CustomSvgPicture(path: AppImage.back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Place Your Order', style: TextStyles.headline),
                    const Gap(10),
                    Text(
                      'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                      style: TextStyles.body.copyWith(color: Colors.grey),
                    ),
                    const Gap(28),
                    CustomTextFromField(
                      controller: _fullNameController,
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFromField(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFromField(
                      controller: _addressController,
                      hintText: 'Address',
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTextFromField(
                      controller: _phoneController,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                      builder: (context, state) {
                        return CustomTextFromField(
                          controller: _governorateController,
                          hintText: 'Governorate',
                          readOnly: true,
                          onTap: () {
                            if (state is GovernoratesSuccessState) {
                              var cubit = context.read<PlaceOrderCubit>();
                              showGovernorateBottomSheet(
                                context,
                                cubit.governorates,
                                (selectedGov) {
                                  setState(() {
                                    _selectedGovernorateId = selectedGov.id;
                                    _governorateController.text =
                                        selectedGov.governorateNameEn ?? '';
                                  });
                                },
                              );
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a governorate';
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.arrow_drop_down),
                        );
                      },
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text('Total:', style: TextStyles.subtitle),
                        const Spacer(),
                        Text('\$ ${widget.total}', style: TextStyles.subtitle),
                      ],
                    ),
                    const Gap(12),
                    MainButton(
                      onPressed: state is PlaceOrderLoadingState
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                if (_selectedGovernorateId == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select a governorate'),
                                    ),
                                  );
                                  return;
                                }
                                context.read<PlaceOrderCubit>().placeOrder(
                                      governorateId: _selectedGovernorateId!,
                                      name: _fullNameController.text,
                                      phone: _phoneController.text,
                                      address: _addressController.text,
                                      email: _emailController.text,
                                    );
                              }
                            },
                      text: state is PlaceOrderLoadingState
                          ? 'Loading...'
                          : 'Submit Order',
                      bgColor: AppColor.primrycolor,
                      minHeight: 50,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}