
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
    Size screenSize = MediaQuery.of(context).size;


    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int crossAxisCount = 2;
        if (constraints.maxWidth > 1024) {
          crossAxisCount = 4;
        } else if ( constraints.maxWidth > 768) {
          crossAxisCount = 3;
        }

          return GridView.builder(
            padding: const EdgeInsets.all(10),

            itemCount: courses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.58,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final course = courses[index];
              return Card(

                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenSize.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top:Radius.circular(16) )
                      ),
                      child: Image.network(
                        course["image"]!,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.groups, size: 14),
                              const SizedBox(width: 4),
                              Text(course["classes"]!),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 14),
                              const SizedBox(width: 4),
                              Text(course["days"]!),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text("বিস্তারিত দেখুন"),
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