import 'package:flutter/material.dart';

void main() {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListviewApp(),
    );
  }
}

class ListviewApp extends StatefulWidget {
  const ListviewApp({super.key});

  State<ListviewApp> createState() => _ListviewAppState();
}

class _ListviewAppState extends State<ListviewApp> {
  List<List<String>> imageList = [
    [
      "https://st1.latestly.com/wp-content/uploads/2018/11/KL-Rahul-380x214.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOJOOJDp43u5FB_2Cn1-pVoMPps5fONql_0w&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVDtR_JZL_JSyPLZ9G2yC_wEZDBY6fBa8kNWNjTC0trrGDsrOA2mKP1m5fa5F5QHc1l-0&usqp=CAU"
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR7aZNpXaB9cV7NNQV4zZWHS4XrsYHexsmAZK6vGeXNspANjj-tYHeRcRdzvhgKl7BtCw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV0DusC306-V6s3xrnkb-UrckvZRYtzjLtr4YSS1nzh-rrniFybOml3kTIyOEry7Ckaig&usqp=CAU",
      "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/sachin-tendulkar-313512872-16x9.jpg?VersionId=X3O9KG.kEof.xgL2u_rOIvVUEkhffWFc&size=690:388",
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJe55lO0MQ6SAXDXBygeCA-BPb0S9A_y-epDssxmZWVjplFq5rQ2kD_M65gqewvZo9L74&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4Dg6yR_vJy0xn1njf0T6yYrEbxQurJUVb0w&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8cXNxn5p51ftZBEQZSBZCIIKl_o1msBA32zZ_eoYNXW4Wlzc1LbGC1CYq1_VBB4ejFsY&usqp=CAU",
    ],
  ];
  List type = ["t20", "odi", "test"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cricket Players"),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: imageList.length,
          separatorBuilder: (context, index) {
            return const Text("player");
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  type[index],
                ),
                Container(
                    height: 200,
                    width: 200,
                    child: ListView.builder(
                      itemCount: imageList[index].length,
                      itemBuilder: (context, index1) {
                        return Container(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            imageList[index][index1],
                          ),
                        );
                      },
                    ))
              ],
            );
          },
        ));
  }
}
