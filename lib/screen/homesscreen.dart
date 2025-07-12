//======================================= Before Update UI py DeepSeek ai =========================

/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_bottomsheet.dart';

import '../model/categories.dart';
import '../provider/question_provider.dart';
import '../widget/dashboardCard.dart';



// ================== Home Page with Categories Grid ==================



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuestionProvider>(context, listen: false).initValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filteredCategories = getFilteredCategories();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final crossAxisCount = isSmallScreen ? 2 : 3;
    final childAspectRatio = isSmallScreen ? 1.0 : 0.9;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
          child: TextField(
            onChanged: (value) => setState(() => searchQuery = value),
            decoration: InputDecoration(
              hintText: "Search programming languages...",
              hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
              prefixIcon: Icon(Icons.search, color: colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: colorScheme.surfaceVariant,
            ),
            style: TextStyle(color: colorScheme.onSurface),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: isSmallScreen ? 10 : 16,
                mainAxisSpacing: isSmallScreen ? 10 : 16,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return DashboardCard(
                  title: category.name,
                  icon: _getIconForCategory(category.name),
                  color: _getColorForCategory(index),
                  emoji: _getEmojiForCategory(category.name),
                  onTap: () => _buildBottomSheet(
                      context, categories[index].name, categories[index].id),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // void  _buildBottomSheet(BuildContext context, String title, int id) {
  //   showModalBottomSheet(
  //       shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
  //   context: context,
  //   builder: (_) => QuizBottomSheet(title: title, id: id),
  //   );
  // }

  void _buildBottomSheet(BuildContext context, String title, int id) {
    showModalBottomSheet(
      context: context,  // context must come first
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (_) => QuizBottomSheet(title: title, id: id),
    );
  }

  // _buildBottomSheet(BuildContext context, String title, int id) {
  //   return showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(40),
  //       ),
  //       context: context,
  //       builder: (_) {
  //         return QuizBottomSheet(
  //           title: title,
  //           id: id,
  //         );
  //       });
  // }

  IconData _getIconForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart': return FontAwesomeIcons.code;
      case 'flutter': return FontAwesomeIcons.mobileScreen;
      case 'c++': return FontAwesomeIcons.c;
      case 'python': return FontAwesomeIcons.python;
      case 'c#': return FontAwesomeIcons.microsoft;
      case 'java': return FontAwesomeIcons.java;
      case 'php': return FontAwesomeIcons.php;
      case 'asp': return FontAwesomeIcons.windows;
      case 'html': return FontAwesomeIcons.html5;
      case 'css': return FontAwesomeIcons.css3;
      case 'javascript': return FontAwesomeIcons.js;
      case 'sql': return FontAwesomeIcons.database;
      case 'ruby': return FontAwesomeIcons.gem;
      case 'swift': return FontAwesomeIcons.apple;
      case 'kotlin': return FontAwesomeIcons.android;
      case 'go': return FontAwesomeIcons.golang;
      case 'rust': return FontAwesomeIcons.rust;
      case 'typescript': return FontAwesomeIcons.jsSquare;
      case 'r': return FontAwesomeIcons.rProject;
      case 'perl': return FontAwesomeIcons.rProject;
      case 'haskell': return FontAwesomeIcons.rProject;
      case 'arduino': return FontAwesomeIcons.microchip;
      default: return Icons.code;
    }
  }

  Color _getColorForCategory(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.lime,
      Colors.brown,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.lightGreen,
    ];
    return colors[index % colors.length];
  }

  String _getEmojiForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart': return '🎯';
      case 'flutter': return '📱';
      case 'c++': return '➕';
      case 'python': return '🐍';
      case 'c#': return '♯';
      case 'java': return '☕';
      case 'php': return '🐘';
      case 'asp': return '🪟';
      case 'html': return '🌐';
      case 'css': return '🎨';
      case 'javascript': return '🟨';
      case 'sql': return '🗃️';
      case 'ruby': return '💎';
      case 'swift': return '🍏';
      case 'kotlin': return '🤖';
      case 'go': return '🚀';
      case 'rust': return '🦀';
      case 'typescript': return '🟦';
      case 'r': return '📊';
      case 'perl': return '🐪';
      case 'haskell': return 'λ';
      case 'arduino': return '🔌';
      default: return '💻';
    }
  }

  List<Category> getFilteredCategories() {
    if (searchQuery.isEmpty) return categories;
    return categories
        .where((category) => category.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}


*/


//======================================== After Update UI by DeepSeek AI =========================
// ===================== Homepage =====================
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:roqsal_quizapp_2026/screen/quiz_bottomsheet.dart';
// import '../model/categories.dart';
// import '../provider/question_provider.dart';
// import '../widget/dashboardCard.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String searchQuery = "";
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<QuestionProvider>(context, listen: false).initValue();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;
//     final filteredCategories = getFilteredCategories();
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth < 600;
//     final crossAxisCount = isSmallScreen ? 2 : 3;
//     final childAspectRatio = isSmallScreen ? 1.0 : 0.9;
//
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             colorScheme.primaryContainer.withOpacity(0.1),
//             colorScheme.surfaceContainer.withOpacity(0.3),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
//             child: TextField(
//               onChanged: (value) => setState(() => searchQuery = value),
//               decoration: InputDecoration(
//                 hintText: "Search programming languages...",
//                 hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
//                 prefixIcon: Icon(Icons.search, color: colorScheme.primary),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                   borderSide: BorderSide(color: colorScheme.outline),
//                 ),
//                 filled: true,
//                 fillColor: colorScheme.surfaceVariant,
//                 contentPadding:  EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: isSmallScreen ? 14 : 16,
//                 ),
//               ),
//               style: TextStyle(color: colorScheme.onSurface),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: crossAxisCount,
//                   crossAxisSpacing: isSmallScreen ? 10 : 16,
//                   mainAxisSpacing: isSmallScreen ? 10 : 16,
//                   childAspectRatio: childAspectRatio,
//                 ),
//                 itemCount: filteredCategories.length,
//                 itemBuilder: (context, index) {
//                   final category = filteredCategories[index];
//                   return
//
//                     DashboardCard(
//                     title: category.name,
//                     icon: _getIconForCategory(category.name),
//                     color: _getColorForCategory(index, colorScheme),
//                     emoji: _getEmojiForCategory(category.name),
//                     onTap: () => _buildBottomSheet(
//                         context, categories[index].name, categories[index].id),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //  _buildBottomSheet(BuildContext context, String title, int id) {
//   // return  showModalBottomSheet(
//   //       context: context,
//   //       backgroundColor: Theme.of(context).colorScheme.surface,
//   //   shape: const RoundedRectangleBorder(
//   //   borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//   //   builder: (_) => QuizBottomSheet(title: title, id: id),
//   //   ));
//   // }
//   void _buildBottomSheet(BuildContext context, String title, int id) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Theme.of(context).colorScheme.surface,// context must come first
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//       ),
//       builder: (_) => QuizBottomSheet(title: title, id: id),
//     );
//   }
//
//   IconData _getIconForCategory(String categoryName) {
//     switch (categoryName.toLowerCase()) {
//       case 'dart': return FontAwesomeIcons.code;
//       case 'flutter': return FontAwesomeIcons.mobileScreen;
//       case 'c++': return FontAwesomeIcons.c;
//       case 'python': return FontAwesomeIcons.python;
//       case 'c#': return FontAwesomeIcons.microsoft;
//       case 'java': return FontAwesomeIcons.java;
//       case 'php': return FontAwesomeIcons.php;
//       case 'asp': return FontAwesomeIcons.windows;
//       case 'html': return FontAwesomeIcons.html5;
//       case 'css': return FontAwesomeIcons.css3;
//       case 'javascript': return FontAwesomeIcons.js;
//       case 'sql': return FontAwesomeIcons.database;
//       case 'ruby': return FontAwesomeIcons.gem;
//       case 'swift': return FontAwesomeIcons.apple;
//       case 'kotlin': return FontAwesomeIcons.android;
//       case 'go': return FontAwesomeIcons.golang;
//       case 'rust': return FontAwesomeIcons.rust;
//       case 'typescript': return FontAwesomeIcons.jsSquare;
//       case 'r': return FontAwesomeIcons.rProject;
//       case 'perl': return FontAwesomeIcons.rProject;
//       case 'haskell': return FontAwesomeIcons.rProject;
//       case 'arduino': return FontAwesomeIcons.microchip;
//       default: return Icons.code;
//     }
//   }
//
//   Color _getColorForCategory(int index, ColorScheme colorScheme) {
//     final colors = [
//       colorScheme.primary,
//       colorScheme.secondary,
//       colorScheme.tertiary,
//       colorScheme.errorContainer,
//       colorScheme.primaryContainer,
//       colorScheme.secondaryContainer,
//       colorScheme.tertiaryContainer,
//     ];
//     return colors[index % colors.length].withOpacity(0.8);
//   }
//
//   String _getEmojiForCategory(String categoryName) {
//     switch (categoryName.toLowerCase()) {
//       case 'dart': return '🎯';
//       case 'flutter': return '📱';
//       case 'c++': return '➕';
//       case 'python': return '🐍';
//       case 'c#': return '♯';
//       case 'java': return '☕';
//       case 'php': return '🐘';
//       case 'asp': return '🪟';
//       case 'html': return '🌐';
//       case 'css': return '🎨';
//       case 'javascript': return '🟨';
//       case 'sql': return '🗃️';
//       case 'ruby': return '💎';
//       case 'swift': return '🍏';
//       case 'kotlin': return '🤖';
//       case 'go': return '🚀';
//       case 'rust': return '🦀';
//       case 'typescript': return '🟦';
//       case 'r': return '📊';
//       case 'perl': return '🐪';
//       case 'haskell': return 'λ';
//       case 'arduino': return '🔌';
//       default: return '💻';
//     }
//   }
//
//   List<Category> getFilteredCategories() {
//     if (searchQuery.isEmpty) return categories;
//     return categories
//         .where((category) =>
//         category.name.toLowerCase().contains(searchQuery.toLowerCase()))
//         .toList();
//   }
// }

// ===================== Homepage =====================
// ===================== Homepage =====================
// ===================== Homepage =====================
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roqsal_quizapp_2026/screen/quiz_bottomsheet.dart';
import 'package:sizer/sizer.dart';
import '../model/categories.dart';
import '../provider/question_provider.dart';
import '../util/constants/styles.dart';
import '../widget/dashboardCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuestionProvider>(context, listen: false).initValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filteredCategories = getFilteredCategories();

    return Container(
      color: colorScheme.surface,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: TextField(
                onChanged: (value) => setState(() => searchQuery = value),
                decoration: InputDecoration(
                  hintText: "Search programming languages...",
                  hintStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12.sp,
                  ),
                  prefixIcon: Icon(Icons.search,
                    color: colorScheme.primary,
                    size: 20.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 1.5.h,
                  ),
                ),
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 12.sp,
                ),
              ),
            ),

            // Header
            Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
              child: Text(
                "Which topic do you want to choose?\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            // Grid View
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              //padding: AppStyles.secondaryPaddingStyle,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.w,

                childAspectRatio: 1.5,

              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return DashboardCard(
                  title: category.name,
                  icon: _getIconForCategory(category.name),
                  color: _getColorForCategory(index, colorScheme),
                  emoji: _getEmojiForCategory(category.name),
                  onTap: () => _buildBottomSheet(
                      context, category.name, category.id),
                );
              },
            ),


            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  void _buildBottomSheet(BuildContext context, String title, int id) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.sp)),
      ),
      builder: (_) => QuizBottomSheet(title: title, id: id),
    );
  }

  IconData _getIconForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart': return FontAwesomeIcons.code;
      case 'flutter': return FontAwesomeIcons.mobileScreen;
      case 'c++': return FontAwesomeIcons.c;
      case 'python': return FontAwesomeIcons.python;
      case 'c#': return FontAwesomeIcons.microsoft;
      case 'java': return FontAwesomeIcons.java;
      case 'php': return FontAwesomeIcons.php;
      case 'asp': return FontAwesomeIcons.windows;
      case 'html': return FontAwesomeIcons.html5;
      case 'css': return FontAwesomeIcons.css3;
      case 'javascript': return FontAwesomeIcons.js;
      case 'sql': return FontAwesomeIcons.database;
      case 'ruby': return FontAwesomeIcons.gem;
      case 'swift': return FontAwesomeIcons.apple;
      case 'kotlin': return FontAwesomeIcons.android;
      case 'go': return FontAwesomeIcons.golang;
      case 'rust': return FontAwesomeIcons.rust;
      case 'typescript': return FontAwesomeIcons.jsSquare;
      case 'r': return FontAwesomeIcons.rProject;
      case 'perl': return FontAwesomeIcons.rProject;
      case 'haskell': return FontAwesomeIcons.rProject;
      case 'arduino': return FontAwesomeIcons.microchip;
      default: return Icons.code;
    }
  }

  Color _getColorForCategory(int index, ColorScheme colorScheme) {
    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      colorScheme.errorContainer,
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
      colorScheme.tertiaryContainer,
    ];
    return colors[index % colors.length];
  }

  String _getEmojiForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'dart': return '🎯';
      case 'flutter': return '📱';
      case 'c++': return '➕';
      case 'python': return '🐍';
      case 'c#': return '♯';
      case 'java': return '☕';
      case 'php': return '🐘';
      case 'asp': return '🪟';
      case 'html': return '🌐';
      case 'css': return '🎨';
      case 'javascript': return '🟨';
      case 'sql': return '🗃️';
      case 'ruby': return '💎';
      case 'swift': return '🍏';
      case 'kotlin': return '🤖';
      case 'go': return '🚀';
      case 'rust': return '🦀';
      case 'typescript': return '🟦';
      case 'r': return '📊';
      case 'perl': return '🐪';
      case 'haskell': return 'λ';
      case 'arduino': return '🔌';
      default: return '💻';
    }
  }

  List<Category> getFilteredCategories() {
    if (searchQuery.isEmpty) return categories;
    return categories
        .where((category) =>
        category.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}