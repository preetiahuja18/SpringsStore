// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<Map<String, dynamic>?> getProductData(String productId) async {
//     try {
//       DocumentSnapshot productSnapshot =
//           await _firestore.collection('products').doc(productId).get();

//       if (productSnapshot.exists) {
//         Map<String, dynamic> data = productSnapshot.data() as Map<String, dynamic>;
//         return data;
//       } else {
//         throw Exception('Product not found');
//       }
//     } catch (e) {
//       print('Error fetching product data: $e');
//       return null;
//     }
//   }
// }
