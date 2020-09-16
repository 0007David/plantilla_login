// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:formvalidation/src/models/producto_model.dart';

class ProductsProvider {
  // final CollectionReference _productsCollectionRef =
  //     FirebaseFirestore.instance.collection('productos');

  // //FirebaseFirestore firestore = FirebaseFirestore.instance;

  // final StreamController<List<ProductoModel>> _productsController =
  //     StreamController<List<ProductoModel>>.broadcast();

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return _productsCollectionRef
  //       .add({'disponible': false, 'precio': 190.10, 'titulo': 'Cars'})
  //       .then((value) => print("Product Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  // Stream listenToProductsRealTime() {
  //   // Register the handler for when the posts data changes
  //   _productsCollectionRef.snapshots().listen((postsSnapshot) {
  //     if (postsSnapshot.docs.isNotEmpty) {
  //       var posts = postsSnapshot.docs
  //           .map((snapshot) =>
  //               ProductoModel.fromJson2(snapshot.data(), snapshot.id))
  //           .where((mappedItem) => mappedItem.titulo != null)
  //           .toList();

  //       // Add the posts onto the controller
  //       print('product' + posts.toString());
  //       _productsController.add(posts);
  //     }
  //   });

  //   return _productsController.stream;
  // }
}
