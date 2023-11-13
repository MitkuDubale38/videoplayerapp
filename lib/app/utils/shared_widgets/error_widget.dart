import 'package:flutter/material.dart';
import 'package:videoplayerapp/app/utils/colors.dart';

// ignore: must_be_immutable
class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
   Future<void> Function() onRefresh; 
  CustomErrorWidget(
      {super.key, required this.errorMessage, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: onRefresh,
      child: Container(
        color: const Color.fromARGB(255, 204, 204, 204),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: GlobalColors.grayColor,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops!',
                style: TextStyle(
                  color: GlobalColors.grayColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColors.grayColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              // GestureDetector(
              //   onTap: onPressed,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: GlobalColors.appBarColor,
              //       borderRadius: BorderRadius.circular(10)
              //     ),
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //       child: Text(
              //         'Retry',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
