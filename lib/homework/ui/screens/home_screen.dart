import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/product_cubit.dart';
import '../../cubit/product_state.dart';
import '../../cubit/theme_cubit.dart';
import '../../data/models/product_model.dart';
import '../widgets/container_widget.dart';
import '../widgets/manage_product.dart';
import 'favorite_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title:  Center(child: Text('Online Shop',style: TextStyle(color: Colors.white),)),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const FavoriteScreen(),
              ),
            ),
            icon: const Icon(Icons.favorite,color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        shadowColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
                  ),
                ],
              ),
            ),
            SwitchListTile(
              title: const Text('Dark mode'),
              value: themeCubit.state,
              onChanged: (value) => themeCubit.toggleTheme(),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (BuildContext context, ProductState state) {
          if (state is InitialState) {
            return const Center(child: Text('Add products'));
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text('error: ${state.message}'));
          } else {
            final List<Product> products = (state as LoadedState).products;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) =>
                  ProductContainer(
                    isFavoriteScreen: false,
                    product: products[index],
                  ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 150,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => const ManageProduct(isEdit: false),
          ),
          child: Text("Add Product",style: TextStyle(color: Colors.white,fontSize: 20),)
        ),
      ),
    );
  }
}