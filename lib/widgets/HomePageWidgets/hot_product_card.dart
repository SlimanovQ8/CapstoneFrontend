// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class ProductCard extends StatefulWidget {
//   ProductCard(this.product);
//
//   @override
//   ProductCardState createState() {
//     return new ProductCardState();
//   }
// }
//
// class ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           overflow: Overflow.clip,
//           children: <Widget>[
//             Hero(
//               tag: "product_${widget.product.toString()}",
//               child: CachedNetworkImage(
//                 imageUrl: widget.product.imageUrl,
//                 fit: BoxFit.cover,
//                 height: double.infinity,
//                 width: double.infinity,
//               ),
//             ),
//             Container(
//               color: Color(0x47000000),
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       widget.product.name,
//                       style: TextStyle(color: Colors.white, fontSize: 12.0),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           "\$" + widget.product.cost.toString().split(".")[0],
//                           style: TextStyle(color: Colors.white, fontSize: 10.0),
//                         ),
//                         // Icon(
//                         //   Icons.favorite,
//                         //   color:
//                         //       MyApp.wishList.products.contains(widget.product)
//                         //           ? Colors.redAccent
//                         //           : Colors.white,
//                         //   size: 16.0,
//                         // ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
