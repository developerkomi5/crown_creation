import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/features/shop/screens/order/widgets/orders_list.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: KAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrorw: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(KSizes.defaultSpace),

        // Orders
        child: KOrderListItems(),
      ),
    );
  }
}
