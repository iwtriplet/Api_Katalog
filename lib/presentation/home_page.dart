import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/add_product/add_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/products/products_bloc.dart';
import 'package:flutter_ecatalog/data/datasources/local_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/product_request_model.dart';
import 'package:flutter_ecatalog/presentation/add_product_page.dart';
import 'package:flutter_ecatalog/presentation/login_page.dart';
import 'package:flutter_ecatalog/themes/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? titleController;
  TextEditingController? priceController;
  TextEditingController? descriptionController;

  final scrollController = ScrollController();
  @override
  void initState() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
    context.read<ProductsBloc>().add(GetProductsEvent());
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<ProductsBloc>().add(NextProductsEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
    priceController!.dispose();
    descriptionController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: context.theme.appColors.primary,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () async {
              await LocalDataSource().removeToken();
              context.read<ProductsBloc>().add(ClearProductsEvent());
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const LoginPage();
              }));
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            debugPrint('totaldata : ${state.data.length}');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                controller: scrollController,
                // reverse: true,
                itemBuilder: (context, index) {
                  if (state.isNext && index == state.data.length) {
                    return const Card(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  return Card(
                    child: ListTile(
                      title: Text(
                          state.data.reversed.toList()[index].title ?? '-'),
                      subtitle: Text('${state.data[index].price}\$'),
                    ),
                  );
                },
                itemCount:
                    state.isNext ? state.data.length + 1 : state.data.length,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.appColors.primary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return const AddProductPage();
          }));
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: const Text('Add Product'),
          //         content: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             TextField(
          //               controller: titleController,
          //               decoration: const InputDecoration(labelText: 'Title'),
          //             ),
          //             TextField(
          //               controller: priceController,
          //               decoration: const InputDecoration(labelText: 'Price'),
          //             ),
          //             TextField(
          //               controller: descriptionController,
          //               decoration:
          //                   const InputDecoration(labelText: 'Description'),
          //               maxLines: 3,
          //             ),
          //           ],
          //         ),
          //         actions: [
          //           ElevatedButton(
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               child: const Text('Cancel')),
          //           const SizedBox(
          //             width: 8,
          //           ),
          BlocConsumer<AddProductBloc, AddProductState>(
            listener: (context, state) {
              if (state is AddProductLoaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add Product Success')),
                );
                // context.read<ProductsBloc>().add(GetProductsEvent());
                context
                    .read<ProductsBloc>()
                    .add(AddSingleProductsEvent(data: state.model));
                titleController!.clear();
                priceController!.clear();
                descriptionController!.clear();
                Navigator.pop(context);
              }
              if (state is AddProductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add Product ${state.message}')),
                );
              }
            },
            builder: (context, state) {
              if (state is AddProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ElevatedButton(
                  onPressed: () {
                    final model = ProductRequestModel(
                      title: titleController!.text,
                      price: int.parse(priceController!.text),
                      description: descriptionController!.text,
                    );

                    context
                        .read<AddProductBloc>()
                        .add(DoAddProductEvent(model: model));
                  },
                  child: const Text('Add'));
            },
          );
          //         ],
          //       );
          //     });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
