import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/xUtils.dart';
import 'package:flutter_demo/weights/group-card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastSeries extends StatelessWidget {
  final onItemPress;
  final data;
  LastSeries({Key? key, required this.onItemPress, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GroupCard(
      title: '最近更新',
      child: Container(
          height: 100.w,
          child: GestureDetector(
            onTap: () {
              onItemPress();
            },
            child: data == null
                ? Container()
                : Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          xUtils.useCDN(data['capture'], 84),
                          height: 100.w,
                          width: 75.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title'],
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      data['message'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black.withOpacity(0.618),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )),
                            Flexible(
                                flex: 0,
                                fit: FlexFit.loose,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timer,
                                            size: 16.sp,
                                            color:
                                                Theme.of(context).primaryColor),
                                        Text(
                                          '${xUtils.useTimeAgoSinceDate(data['updateTime'])}更新',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 12.sp),
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${data['chapter']['size']}集/${xUtils.useSeconds2HHmmss(data['chapter']['durations'])}',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    )
                                  ],
                                ))
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
