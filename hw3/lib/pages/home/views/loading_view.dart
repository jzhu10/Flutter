import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Club Home"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Corresponding to SortSelector area
          const Padding(
            padding: EdgeInsets.only(top: 14, bottom: 4),
            child: Row(
              children: [
                SizedBox(width: 20),
                GreyContainer(width: 44, height: 20, radius: 8),
                SizedBox(width: 10),
                GreyContainer(width: 76, height: 32, radius: 8),
                SizedBox(width: 10),
                GreyContainer(width: 60, height: 32, radius: 8),
              ],
            ),
          ),

          // Corresponding to StyleBookList area
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: GreyContainer(width: 76, height: 36, radius: 8),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 20 : 10),
                  child:
                      const GreyContainer(width: 112.5, height: 0, radius: 8),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class GreyContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const GreyContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
