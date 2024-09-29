import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AsmaaAllahView extends StatefulWidget {
  const AsmaaAllahView({super.key});

  @override
  State<AsmaaAllahView> createState() => _AsmaaAllahViewState();
}

class _AsmaaAllahViewState extends State<AsmaaAllahView> {
  late Future<List<dynamic>> data;
  List<Color> colors = const [
    Color(0xFFFFDAB9), // Peach Puff
      Color(0xFF9932CC), // Dark Orchid
    Color(0xFF8FBC8F), // Dark Sea Green
    Color(0xFF20B2AA), // Light Sea Green
    Color(0xFFEEE8AA), // Pale Goldenrod
    Color(0xFFFFE4E1), // Misty Rose
    Color(0xFFFFC0CB), // Pink
    Color(0xFF7FFFD4), // Aquamarine
    Color(0xFFFA8072), // Salmon
    Color(0xFFF0FFF0), // Honeydew '
    Color(0xFFADFF2F), // Green Yellow
    Color(0xFF8FBC8F), // Dark Sea Green
    Color(0xFF98FB98), // Pale Green
    Color(0xFFFFFFFF), // White
    Color(0xFFD3D3D3), // Light Gray
    Color(0xFFFA8072), // Salmon
    Color(0xFFFFA500), // Orange
    Color(0xFFFFFF00), // Yellow
    Color(0xFFFF6347), // Tomato
    Color(0xFFFFF9C4), // Light Yellow
    Color(0xFF00FF00), // Lime
    Color(0xFF008000), // Green
    Color(0xFFFF8C00), // Dark Orange
    Color(0xFFFFD700), // Gold
    Color(0xFF3CB371), // Medium Sea Green
    Color(0xFF0000CD), // Medium Blue
    Color(0xFF4169E1), // Royal Blue
    Color(0xFF87CEEB), // Sky Blue
    Color(0xFF87CEFA), // Light Sky Blue
    Color(0xFF1E90FF), // Dodger Blue
    Color(0xFFEE82EE), // Violet
    Color(0xFF800080), // Purple
    Color(0xFF90EE90), // Light Green
    Color(0xFF00FFFF), // Cyan
    Color(0xFFE0FFFF), // Light Cyan
    Color(0xFF006400), // Dark Green
    Color.fromARGB(255, 9, 133, 182), // Black
    Color(0xFFFF0000), // Red
    Color(0xFF228B22), // Forest Green
    Color(0xFF2E8B57), // Sea Green
    Color(0xFFC0C0C0), // Silver
    Color(0xFF808080), // Gray
    Color(0xFFA9A9A9), // Dark Gray
    Color(0xFF8B0000), // Dark Red
    Color(0xFFDC143C), // Crimson
    Color(0xFF008080), // Teal
    Color(0xFFFAF0E6), // Linen
    Color(0xFFF0F8FF), // Alice Blue
    Color(0xFF7FFF00), // Chartreuse
    Color(0xFF008B8B), // Dark Cyan
    Color(0xFF0000FF), // Blue
    Color(0xFFFFA07A), // Light Salmon
    Color(0xFFFAFAD2), // Light Goldenrod Yellow
    Color(0xFFADD8E6), // Light Blue
    Color(0xFFE0FFFF), // Light Cyan
    Color(0xFF00008B), // Dark Blue
    Color(0xFF4B0082), // Indigo
    Color(0xFFE6E6FA), // Lavender
    Color(0xFFFF00FF), // Magenta
    Color(0xFFFF69B4), // Hot Pink
    Color(0xFFFF1493), // Deep Pink
    Color(0xFFDA70D6), // Orchid
    Color(0xFFDB7093), // Pale Violet Red
    Color(0xFFFFB6C1), // Light Pink
    Color(0xFFD8BFD8), // Thistle
    Color(0xFFB0E0E6), // Powder Blue
    Color(0xFF4682B4), // Steel Blue
    Color(0xFF5F9EA0), // Cadet Blue
    Color(0xFF6495ED), // Cornflower Blue
    Color(0xFFD2691E), // Chocolate
    Color(0xFF8B4513), // Saddle Brown
    Color(0xFFF4A460), // Sandy Brown
    Color(0xFFDEB887), // Burlywood
    Color(0xFF87CEFA), // Light Sky Blue
    Color(0xFFB22222), // Firebrick
    Color(0xFFFF4500), // Orange Red
    Color(0xFFDAA520), // Goldenrod
    Color(0xFF32CD32), // Lime Green
    Color(0xFF6A5ACD), // Slate Blue
    Color(0xFF7B68EE), // Medium Slate Blue
    Color(0xFFA0522D), // Sienna
    Color(0xFF8B008B), // Dark Magenta
  
    Color(0xFFD2B48C), // Tan
    Color(0xFFE6E6FA), // Lavender
    Color(0xFFF5FFFA), // Mint Cream
    Color(0xFFFFF0F5), // Lavender Blush
    Color(0xFFFFD700), // Gold
    Color(0xFFFFE4B5), // Moccasin
    Color(0xFFF5DEB3), // Wheat
    Color(0xFFF08080), // Light Coral
    Color(0xFFB0E0E6), // Powder Blue
    Color(0xFF000080), // Navy
  
    Color(0xFF7B68EE), // Medium Slate Blue
    Color(0xFFA0522D), // Sienna
    Color(0xFF8B008B), // Dark Magenta
    Color(0xFF9932CC), // Dark Orchid
    Color(0xFF8FBC8F), // Dark Sea Green
    Color(0xFFF0FFFF), // Azure 
     Color(0xFF191970), // Midnight Blue
  ];

  Future<List<dynamic>> loadJsonData() async {
    String jsonString = await rootBundle
        .loadString('lib/features/asma allah/data/asma_allah.json');
    return json.decode(jsonString);
  }

  @override
  void initState() {
    data = loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(header: 'أسماء الله الحسنى', desc: ''),
          Expanded(
            child: FutureBuilder(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Card(
                            color: colors[index],
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                snapshot.data![index]['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
