import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
			shadowColor: Colors.grey[200].withOpacity(0.6),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(10.0)
			),
      margin: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Shimmer.fromColors(
              child: Container(
                width: 100.0,
                height: 65.0,
                color: Colors.white,
              ), 
              baseColor: Colors.grey[200], 
              highlightColor: Colors.white
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  Shimmer.fromColors(
                    child: Container(
                      height: 16.0,
                      color: Colors.white,
                    ), 
                    baseColor: Colors.grey[200], 
                    highlightColor: Colors.white
                  ),
                  const SizedBox(height: 5.0),
                  Shimmer.fromColors(
                    child: Container(
                      height: 14.0,
                      color: Colors.white,
                    ), 
                    baseColor: Colors.grey[200], 
                    highlightColor: Colors.white
                  ),
                  const SizedBox(height: 5.0),
                  Shimmer.fromColors(
                    child: Container(
                      height: 14.0,
                      color: Colors.white,
                    ), 
                    baseColor: Colors.grey[200], 
                    highlightColor: Colors.white
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}