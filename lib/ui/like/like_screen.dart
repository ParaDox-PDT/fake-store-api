// void showBottomSheetDialog() {
//   showModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     context: context,
//     isScrollControlled: true,
//     showDragHandle: true,
//     builder: (BuildContext context) {
//       return Container(
//         padding: const EdgeInsets.all(24),
//         height: 547.h,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.9),
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(40),
//             topRight: Radius.circular(40),
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   ...List.generate(
//                     likes.length,
//                         (index) {
//                       ProductModel? product;
//                       for (var element in products) {
//                         if(element.id.toString()==likes[index]){
//                           product=element;
//                         }
//                       }
//                       return Container(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 24.h,),
//                             Row(
//                               children: [
//                                 CachedNetworkImage(imageUrl: product!.image,width: 81.w,height: 81.w,fit: BoxFit.contain,),
//                                 SizedBox(
//                                   width: 14.w,
//                                 ),
//                                 Container(
//                                   width: 200.w,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         product.title,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineMedium,
//                                       ),
//                                       SizedBox(
//                                         height: 6.h,
//                                       ),
//                                       Text(
//                                         product.description,
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                         style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                       ),
//                                       SizedBox(
//                                         height: 14.h,
//                                       ),
//                                       ZoomTapAnimation(
//                                         onTap: () {
//                                           likes.removeWhere((element) => element==product!.id.toString());
//                                           StorageRepository.putList("likes", likes);
//                                           Navigator.pop(context);
//                                         },
//                                         child: SizedBox(
//                                           width: 66.w,
//                                           child: Column(
//                                             children: [
//                                               Text(
//                                                 "REMOVE",
//                                                 style: Theme.of(context).textTheme.labelLarge,
//                                               ),
//                                               const Divider(thickness: 2, color: Colors.black),
//                                             ],
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(height: 22.h,),
//                             Divider(thickness: 2,color: Colors.black,)
//                           ],
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }