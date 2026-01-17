import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza_ecommerce/providers/api_provider.dart';
import 'package:laza_ecommerce/values/laza_colors.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key,required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();

}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
      Provider.of<ApiProvider>(context,listen: false).loadProductById(widget.productId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    final product = provider.product;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Skeletonizer(
        enabled: provider.isLoading,
        enableSwitchAnimation: true,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: LazaColors.offWhite
              ),
              child: provider.isLoading? const Center(child: CircularProgressIndicator(),)
              : Padding(
                padding: const EdgeInsets.all(20),
                child: CachedNetworkImage(
                  imageUrl: product?.imagePath ?? "no image detected",
                ),
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
                        child: Image.asset('assets/icons/arrow_back.png',color: Colors.grey.shade600,),
                      ),
                    ),
        
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: LazaColors.lightWhite,
                        ),
                        child: Image.asset('assets/icons/ic_heart.png',color: Colors.grey.shade600,),
                      ),
                    ),
                  ],
                ),
              ),
            )


            //Other details container
          ],
        ),
      ),
    );
  }
}
