// import 'package:favourites_sample/presentation/account_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../service/account_service.dart';
//
//
// class FavouriteWidget extends ConsumerWidget {
//   const FavouriteWidget({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     /// Provides the list of data
//     final favouriteList = ref.watch(favouriteListFutureProvider);
//     final accountValues = ref.watch(accountListFutureProvider);
//     final selectedMenu = ref.watch(accountCategoryProvider);
//
//     void updateCategory(String newValue) {
//       ref
//           .read(accountCategoryProvider.notifier)
//           .state = newValue;
//     }
//     final List<String> menuLists = ['Account', 'Favorites'];
//
//     return Column(
//         children: [
//           const SizedBox(height: 16.0),
//           Expanded(
//             child: ListView(
//               children: [
//                 const SizedBox(height: 16.0),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: PopupMenuButton<String>(
//                     offset: const Offset(-40, 60),
//                     initialValue: selectedMenu,
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         PopupMenuItem<String>(
//                           value: 'All Accounts',
//                           child: InkWell(
//                             onTap: () {}, // Make it non-selectable
//                             child: Container(
//                               padding: const EdgeInsets.all(16.0),
//                               child: const Text(
//                                 'All Accounts',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black, // Set desired color
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const PopupMenuDivider(),
//                         ...menuLists.map((category) {
//                           return PopupMenuItem<String>(
//                             value: category,
//                             child: Text(
//                               category,
//                               style: TextStyle(
//                                 color: category == selectedMenu
//                                     ? Colors.red
//                                     : null,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ];
//                     },
//                     onSelected: (String newValue) {
//                       updateCategory(newValue);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         selectedMenu,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 const Text('Favorites', style: TextStyle(fontSize: 20)),
//                 const SizedBox(height: 10),
//                 // Swap between Account and Favorites based on the selected menu
//                 if (selectedMenu == 'Favourites')
//                   DataTable(
//                     columns: const [
//                       DataColumn(label: Text('First Name')),
//                       DataColumn(label: Text('Last Name')),
//                       DataColumn(label: Text('Avatar')),
//                     ],
//                     rows: favouriteList.when(
//                       data: (favouriteList) {
//                         return favouriteList.map((account) {
//                           return DataRow(cells: [
//                             DataCell(Text(account.first_name.toString())),
//                             DataCell(Text(account.last_name.toString())),
//                             DataCell(Image.network(account.avatar)),
//                           ]);
//                         }).toList();
//                       },
//                       loading: () =>
//                       [
//                         const DataRow(cells: [
//                           DataCell(Text('Loading...')),
//                           DataCell(Text('')),
//                           DataCell(Text('')),
//                         ]),
//                       ],
//                       error: (error, stackTrace) =>
//                       [
//                         DataRow(cells: [
//                           DataCell(
//                             Text(
//                               'Error: $error',
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                           ),
//                           const DataCell(Text('')),
//                           const DataCell(Text('')),
//                         ]),
//                       ],
//                     ),
//                   )
//                 else
//                   if (selectedMenu == 'Account')
//                   //  AccountWidget(),
//                     DataTable(
//                       columns: const [
//                         DataColumn(label: Text('First Name')),
//                         DataColumn(label: Text('Last Name')),
//                         DataColumn(label: Text('Id')),
//                         DataColumn(label: Text('Email')),
//                         DataColumn(label: Text('Avatar')),
//                       ],
//                       rows: accountValues.when(
//                         data: (accountList) {
//                           return accountList.map((account) {
//                             return DataRow(cells: [
//                               DataCell(Text(account.first_name.toString())),
//                               DataCell(Text(account.last_name.toString())),
//                               DataCell(Text(account.id.toString())),
//                               DataCell(Text(account.email.toString())),
//                               DataCell(Image.network(account.avatar)),
//                             ]);
//                           }).toList();
//                         },
//                         loading: () =>
//                         [
//                           const DataRow(cells: [
//                             DataCell(Text('Loading...')),
//                             DataCell(Text('')),
//                             DataCell(Text('')),
//                             DataCell(Text('')),
//                             DataCell(Text('')),
//                           ]),
//                         ],
//                         error: (error, stackTrace) =>
//                         [
//                           DataRow(cells: [
//                             DataCell(
//                               Text(
//                                 'Error: $error',
//                                 style: const TextStyle(color: Colors.red),
//                               ),
//                             ),
//                             const DataCell(Text('')),
//                             const DataCell(Text('')),
//                             const DataCell(Text('')),
//                             const DataCell(Text('')),
//                           ]),
//                         ],
//                       ),
//                     ),
//               ],
//             ),
//           ),
//         ],
//       );
//
//   }
//   }
//
