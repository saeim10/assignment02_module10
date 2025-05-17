
import 'package:flutter/material.dart';







class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key});

  final List<Map<String, String>> courses = const [
    {
      "image": "https://flagcdn.com/w80/us.png",
      "title": "App Development with Flutter\n",
      "classes": "৩ টি সিট বাকি",
      "days": "৩০ দিন বাকি",
    },
    {
      "image": "https://flagcdn.com/w80/gb.png",
      "title": "Full Stack Web Development with JavaScript (MERN)",
      "classes": "৮৬ টি সিট বাকি",
      "days": "৪৫ দিন বাকি",
    },
    {
      "image": "https://flagcdn.com/w80/ca.png",
      "title": "Full Stack Web Development with Python, Django & React",
      "classes": "১২ টি সিট বাকি",
      "days": "৬০ দিন বাকি",
    },
    {
      "image": "https://flagcdn.com/w80/jp.png",
      "title": "Full Stack Web Development with ASP.Net Core",
      "classes": "৮ টি সিট বাকি",
      "days": "৩০ দিন বাকি",
    },
    {
      "image": "https://flagcdn.com/w80/bd.png",
      "title": "Full Stack Web Development with PHP, Laravel and Vue Js",
      "classes": "১০ টি সিট বাকি",
      "days": "৩০ দিন বাকি",
    },
    {
      "image": "https://flagcdn.com/w80/us.png",
      "title": "SQA: Manual & Automated Testing\n",
      "classes": "২৫ টি সিট বাকি",
      "days": "৩০ দিন বাকি",
    },
    // Add more as needed
  ];

 @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int crossAxisCount = 2;

        if (constraints.maxWidth >= 1024) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth >= 768) {
          crossAxisCount = 3;
        }

        double itemWidth = constraints.maxWidth / crossAxisCount;
        double itemHeight1 = screenSize.height / 1.1;
        double itemHeight2 = screenSize.height / 2.5;
        double itemHeight3 = screenSize.height / 1.9;
        double displaySize = screenSize.width > 1024 ? itemHeight1 : (screenSize.width > 768 ? itemHeight3 : itemHeight2);
        double aspectRatio = itemWidth / displaySize;

        double _fontSize = screenSize.width > 1024 ? 20.sp : (screenSize.width > 768 ? 18.sp : 15.sp);

        double iconSize = screenSize.width > 1024 ? 6.sh : (screenSize.width > 768 ? 24 : 14);


        return GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(2, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16)),
                    child: Image.network(
                      course["image"]!,
                      width: double.infinity,
                      height: displaySize * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          course["title"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _fontSize,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.groups, size: iconSize),
                            SizedBox(width: 4),
                            Text(
                              course["classes"]!,
                              style: TextStyle(fontSize: _fontSize - 2),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: iconSize),
                            SizedBox(width: 4),
                            Text(
                              course["days"]!,
                              style: TextStyle(fontSize: _fontSize - 2),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "বিস্তারিত দেখুন",
                              style: TextStyle(fontSize: _fontSize - 2),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
