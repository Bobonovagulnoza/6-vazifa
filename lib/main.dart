import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => CategoriesPage(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => HomePage(),
    ),
  ],
);

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Integrate the GoRouter with MaterialApp
      debugShowCheckedModeBanner: false,
    );
  }
}


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C0F0D),
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: SizedBox(
              width: 21,
              height: 14,
              child: SvgPicture.asset(
                "assets/vector.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Color(0xFFFD5D69),
          ),
        ),
        actions: const [
          AppBarActionItem(
            image: "assets/notification.svg",
            width: 12,
            height: 17,
          ),
          SizedBox(width: 5),
          AppBarActionItem(
            image: "assets/search.svg",
            width: 14,
            height: 18,
          ),
          SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF1C0F0D),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MainCategoryItem(image: "assets/seafood.png", text: "Seafood"),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/lunch.png", text: "Lunch"),
              CategoryItem(image: "assets/breakfast.png", text: "Breakfast"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dinner.png", text: "Dinner"),
              CategoryItem(image: "assets/vegan.png", text: "Vegan"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(image: "assets/dessert.png", text: "Dessert"),
              CategoryItem(
                image: "assets/drinks.png",
                text: "Drinks",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 281,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFFD5D69),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset("assets/home.svg"),
                onPressed: () {},
              ),
              SvgPicture.asset("assets/community.svg"),
              SvgPicture.asset("assets/categories.svg"),
              SvgPicture.asset("assets/profile.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC6C9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 159,
            height: 145,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}

class MainCategoryItem extends StatelessWidget {
  const MainCategoryItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 6),
        Center(
          child: SizedBox(
            width: 356,
            height: 149,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------------------------


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C0F0D),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1C0F0D),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi! Gulnoza",
              style: TextStyle(
                color: Color(0xFFFD5D69),
                fontSize: 26,
              ),
            ),
            Text(
              "What are you cooking today",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              color: Color(0xffFFC6C9),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/pitsa.png",
                width: 18,
                height: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 28,
            width: 28,
            decoration: const BoxDecoration(
              color: Color(0xffFFC6C9),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/search.svg",
                width: 18,
                height: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              "Trending Recipe",
              style: TextStyle(
                color: Color(0xffFD5D69),
                fontSize: 15,
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: -60,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xff2C1A18),
                    border: Border.all(color: Colors.red),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Salami and cheese pizza",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/clock.svg",
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "30min",
                                style: TextStyle(
                                  color: Color(0xffEC888D),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "This is a quick overview of the ingredients...",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "5",
                                style: TextStyle(
                                  color: Color(0xffEC888D),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset(
                                "assets/star.svg",
                                width: 12,
                                height: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: const Image(
                        image: AssetImage("assets/tiramisu.png"),
                        width: double.infinity,
                        height: 143,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xffEC888D),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/heart.svg",
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          Container(
            width: double.infinity,
            height: 255,
            decoration: BoxDecoration(
              color: const Color(0xffFD5D69),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18, top: 10),
                  child: Text(
                    "Your Recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            child: Image(
                              image: AssetImage("assets/chicken_burger.png"),
                              width: 169,
                              height: 162,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xffFD5D69),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/search.svg",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -25,
                            left: 0,
                            child: Container(
                              width: 169,
                              height: 49,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Chicken Burger',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1C0F0D),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Text(
                                          "5",
                                          style: TextStyle(
                                              color: Color(0xffEC888D),
                                              fontSize: 12),
                                        ),
                                        const SizedBox(width: 3),
                                        SvgPicture.asset(
                                          "assets/search.svg",
                                          width: 10,
                                          height: 10,
                                        ),
                                        const SizedBox(width: 30),
                                        SvgPicture.asset(
                                          "assets/search.svg",
                                          width: 10,
                                          height: 10,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '15min',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffEC888D),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            child: Image(
                              image: AssetImage("assets/tiramisu.png"),
                              width: 169,
                              height: 162,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xffFD5D69),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/search.svg",
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -25,
                            left: 0,
                            child: Container(
                              width: 169,
                              height: 49,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Tiramisu',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1C0F0D),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        const Text(
                                          "5",
                                          style: TextStyle(
                                              color: Color(0xffEC888D),
                                              fontSize: 12),
                                        ),
                                        const SizedBox(width: 3),
                                        SvgPicture.asset(
                                          "assets/search.svg",
                                          width: 10,
                                          height: 10,
                                        ),
                                        const SizedBox(width: 30),
                                        SvgPicture.asset(
                                          "assets/searc.hsvg",
                                          width: 10,
                                          height: 10,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '15min',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffEC888D),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  "Top Chef",
                  style: TextStyle(
                    color: Color(0xfffd5d69),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/joseph.png"),
                        width: 82,
                        height: 74,
                      ),
                      Text(
                        "Joseph",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/joseph.png"),
                        width: 82,
                        height: 74,
                      ),
                      Text(
                        "Andrew",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/joseph.png"),
                        width: 82,
                        height: 74,
                      ),
                      Text(
                        "Emily",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("assets/joseph.png"),
                        width: 82,
                        height: 74,
                      ),
                      Text(
                        "Jessica",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Recently Added",
                        style: TextStyle(
                          color: Color(0xfffd5d69),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset("assets/a2.png"),
                      Image.asset("assets/a1.png"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
// -----------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// final GoRouter router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => Page1(),
//     ),
//     GoRoute(
//       path: '/page2',
//       builder: (context, state) => Page2(),
//     ),
//   ],
// );
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//     );
//   }
// }
//
// class Page1 extends StatelessWidget {
//   const Page1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Salom, Navigation!"),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () => context.go('/page2'),
//         child: Text("+"),
//       ),
//       // floatingActionButton: ElevatedButton(onPressed: (), child: child),
//     );
//   }
// }
//
// class Page2 extends StatelessWidget {
//   const Page2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Ikkinchi sahifa!"),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () => context.go('/'),
//         child: Text("+"),
//       ),
//       // floatingActionButton: ElevatedButton(onPressed: (), child: child),
//     );
//   }
// }
