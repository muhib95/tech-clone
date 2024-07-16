import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:startech/utils/colors.dart';
import 'package:startech/wiget/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _useRtlText = false;
  int _currentIndex = 0;
  CarouselController _controller = CarouselController();

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(height: 50, color: Colors.white, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    List<String> sliders = [
      'https://www.startech.com.bd/image/cache/catalog/home/banner/ZTE%20Blade%20V40%20Smartphone-982x500.webp',
      'https://www.startech.com.bd/image/cache/catalog/home/banner/eid-mobile-fest.ai-banner-982x500.webp'
    ];

    List<Map> categories = [
      {'title': 'AC', 'icon': 'assets/images/category/ac.png'},
      {'title': 'Drone', 'icon': 'assets/images/category/drone-48x48.png'},
      {'title': 'Gimbal', 'icon': 'assets/images/category/gimbal-48x48.png'},
      {'title': 'Laptop', 'icon': 'assets/images/category/laptop-48x48.png'},
      {
        'title': 'Laptop Accessories',
        'icon': 'assets/images/category/laptop-acc-icon-48x48.png'
      },
      {
        'title': 'Mobile',
        'icon': 'assets/images/category/mobile-phone-48x48.png'
      },
      {
        'title': 'Mobile Accessories',
        'icon': 'assets/images/category/mobile-phone-accessories-48x48.png'
      },
      {
        'title': 'Power Station',
        'icon': 'assets/images/category/powerstation-48x48.png'
      },
      {'title': 'TV', 'icon': 'assets/images/category/tv-48x48.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: Icon(
          Icons.menu,
          color: AppColor.logoColor,
        ),
        title: Image.asset(
          'assets/images/logo.png',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColor.logoColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: AppColor.logoColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: sliders.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primaryColor,
                          image: DecorationImage(
                            image: NetworkImage(sliders[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: sliders.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.white,
                          dotHeight: 10,
                          dotWidth: 20,
                        ),
                        onDotClicked: (index) {
                          _controller.animateToPage(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.secondaryColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Column(
                    children: [
                      const Text(
                        'Compare Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.logoColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 10,
                              spreadRadius: .3,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              hintText: 'Search and Select Product',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.logoColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 10,
                              spreadRadius: .3,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              hintText: 'Search and Select Product',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Click');
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                            border: Border.all(
                                color: AppColor.btnBorderColor, width: 3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'View Comparison',
                                style: TextStyle(
                                    color: AppColor.btnBorderColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * .30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.startech.com.bd/image/catalog/ads/sunbscriobe-to-star-tech-youtube-channel.webp'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CustomCard(
                      title: 'Laptop Finder',
                      icon: Icons.laptop,
                    )),
                    Expanded(
                        child: CustomCard(
                      title: 'Raise a Complain',
                      icon: Icons.laptop,
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CustomCard(
                      title: 'Online Support',
                      icon: Icons.laptop,
                    )),
                    Expanded(
                        child: CustomCard(
                      title: 'Servicing Center',
                      icon: Icons.laptop,
                    )),
                  ],
                ),
              ]),
              const SizedBox(
                height: 15,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: AppColor.logoColor,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black,
              //         blurRadius: 5,
              //         spreadRadius: .3,
              //       )
              //     ],
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: MarqueeText(
              //       text: TextSpan(
              //         text:
              //             '15th July Monday, all our outlets are open. Additionally, our online activities are open and operational.',
              //       ),
              //       style: TextStyle(
              //         fontSize: 24,
              //         color: Colors.black,
              //       ),
              //       speed: 30,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Center(
                child: Text(
                  'Featued Category',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Get Your Desired Product from Featured Category!',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                controller: ScrollController(),
                itemCount: categories.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // mainAxisExtent: 100,
                  crossAxisCount: 4, // Number of columns in the grid
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.logoColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          spreadRadius: .3,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          categories[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        Flexible(
                          child: Image.asset(
                            categories[index]['icon'],
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                controller: ScrollController(),
                itemCount: 5,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // mainAxisExtent: 100,
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .6),
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.logoColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  spreadRadius: .3,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    'https://www.startech.com.bd/image/cache/catalog/mobile/oneplus/nord-n30-se/nord-n30-se-01-200x200.png'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    color: Colors.black.withOpacity(.2),
                                    thickness: 2,
                                  ),
                                ),
                                Text(
                                  'OnePlus Nord N30 SE 5G Smartphone (4/128GB)',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '15,999 ৳',
                                  style: TextStyle(
                                      color: AppColor.avaterbg,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(

                            width: constraints.maxWidth * .9,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Center(
                                child: Text(
                                  '499৳ Discount on Checkout',
                                  style: TextStyle(color: AppColor.logoColor),
                                )),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
