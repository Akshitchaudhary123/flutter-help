import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repostpage/repostController.dart'; // Import your controller

class Repost extends StatefulWidget {
  const Repost({super.key});

  @override
  State<Repost> createState() => _RepostState();
}

class _RepostState extends State<Repost> {
  var repostController = Get.put(RepostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.access_time, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            child: Container(
              height: 30.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 17.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Share your thoughts...',
                hintStyle: TextStyle(fontSize: 18.sp),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 360.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: Colors.black.withOpacity(.2),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                        radius: 20.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'JavaScript',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Hafiz Faisal Ali . 3rd+',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              '7h',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                      () => Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: RichText(
                      text: TextSpan(
                        text: repostController.isExpanded.value
                            ? 'As a beginner in programming, encountering languages like JavaScript, Python, Java, C, and C++ can be exciting. However,'
                            ' HTML is often overlooked despite its significance in web development. Understanding HTML is crucial as it forms the '
                            'foundation of web pages, allowing programmers to structure content effectively. Without HTML, web development would '
                            'lack the necessary structure and semantics, making it an essential skill for all aspiring developers. '
                            : 'As a beginner in programming, encountering languages like JavaScript, Python, Java, C, and C++ can be exciting. However,'
                            ' HTML is often overlooked despite its significance in web...',
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        children: [
                          if (!repostController.isExpanded.value)
                            TextSpan(
                              text: ' see more',
                              style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                                fontSize: 15.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  repostController.toggleExpanded();
                                },
                            ),
                          if (repostController.isExpanded.value)
                            TextSpan(
                              text: ' see less',
                              style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                                fontSize: 15.sp,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  repostController.toggleExpanded();
                                },
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Image.asset(
                  'assets/meme.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
