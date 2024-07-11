import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/product_cubit.dart';
import '../../cubit/product_state.dart';
import '../../data/models/product_model.dart';
import '../widgets/container_widget.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Favorite',style: TextStyle(color: Colors.white),),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(child: Text('Add products'));
          } else {
            final List<Product> favProducts = (state as LoadedState)
                .products
                .where((element) => element.isFavorite)
                .toList();
            return favProducts.isNotEmpty
                ? ListView.builder(
              itemCount: favProducts.length,
              itemBuilder: (BuildContext context, int index) =>
                  ProductContainer(
                    isFavoriteScreen: true,
                    product: favProducts[index],
                  ),
            )
                : const Center(
              child: Text('No favorite products'),
            );
          }
        },
      ),
    );
  }
}