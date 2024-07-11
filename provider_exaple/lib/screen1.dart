// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_exaple/main.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});
//   @override
//   State createState() => _ScreenState();
// }

// class _ScreenState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(Provider.of<Company>(context).name),
//             const SizedBox(
//               height: 30,
//             ),
//             Text("${Provider.of<Company>(context).count}"),
//             ElevatedButton(
//                 onPressed: () {
//                   Provider.of<Company>(context, listen: false)
//                       .updatecompany("microsoft", 4000);
//                 },
//                 child: const Text("change"))
//           ],
//         ),
//       ),
//     );
//   }
// }
