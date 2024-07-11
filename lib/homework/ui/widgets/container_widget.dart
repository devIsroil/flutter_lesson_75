import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../cubit/product_cubit.dart';
import '../../data/models/product_model.dart';
import 'manage_product.dart';


class ProductContainer extends StatelessWidget {
  final bool isFavoriteScreen;
  final Product product;

  const ProductContainer({
    super.key,
    required this.product,
    required this.isFavoriteScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
       color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            product.imageUrl,
            width: 140,
            height: 100,
            fit: BoxFit.cover,
          ),
          const Gap(10),
          Expanded(child: Text(product.title)),
          const Gap(10),
          Row(
            children: [
              IconButton(
                onPressed: () =>
                    context.read<ProductCubit>().toggleFavorite(id: product.id),
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => ManageProduct(
                      isEdit: true,
                      product: product,
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () =>
                    context.read<ProductCubit>().removeProduct(id: product.id),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}