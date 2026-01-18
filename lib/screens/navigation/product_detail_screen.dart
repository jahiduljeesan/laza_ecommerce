import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/providers/api_provider.dart';
import 'package:laza_ecommerce/screens/navigation/cart_screen.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/bottom_button.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/subtitle_text.dart';
import 'package:laza_ecommerce/widgets/auth_widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Provider.of<ApiProvider>(
        context,
        listen: false,
      ).loadProductById(widget.productId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    final product = provider.product;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ====== SCROLLABLE CONTENT ======
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // IMAGE + HEADER ICONS
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.45,
                        width: double.infinity,
                        decoration: BoxDecoration(color: LazaColors.offWhite),
                        child: provider.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CachedNetworkImage(
                          imageUrl: product?.imagePath ?? '',
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  provider.clearProduct();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: LazaColors.lightWhite,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/arrow_back.png',
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => CartScreen()),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: LazaColors.lightWhite,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/ic_bag.png',
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // TITLE & PRICE
                  Skeletonizer(
                    enabled: provider.isLoading,
                    enableSwitchAnimation: true,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product?.title ?? 'No title found',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                '\$${product?.price ?? 0}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Skeletonizer(
                    enabled: provider.isLoading,
                    enableSwitchAnimation: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ExpandableText(
                            product?.description ?? 'No description available.',
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                            linkColor: Colors.blue,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              height: 1.4,
                            ),
                            animation: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Skeletonizer(
                  enabled: provider.isLoading,
                  enableSwitchAnimation: true,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'with VAT, SD',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Text(
                          '\$${product?.price ?? 0}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomButton(
                  label: 'Add to Cart',
                  onTap: () {
                    // Your add-to-cart logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
