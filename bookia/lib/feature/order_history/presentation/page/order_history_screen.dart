import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/function/navigation.dart';
import 'package:bookia/core/widgets/custom_svg_picture.dart';
import 'package:bookia/feature/order_history/data/models/order_history_response/order.dart';
import 'package:bookia/feature/order_history/presentation/cubit/order_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  Widget orderItem(Order order) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order No${order.orderCode ?? ''}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                order.orderDate ?? '',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.grey.shade300),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Amount",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "\$${order.total ?? '0'}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryCubit()..getOrderHistory(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CustomSvgPicture(path: AppImage.back),
            ),
          ),
          title: const Text('My Orders'),
        ),
        body: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
          builder: (context, state) {
            if (state is OrderHistoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is OrderHistoryErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is OrderHistorySuccessState) {
              if (state.orders.isEmpty) {
                return const Center(child: Text("No orders yet"));
              }
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return orderItem(state.orders[index]);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}