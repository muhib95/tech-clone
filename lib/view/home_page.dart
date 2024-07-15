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
              Container(
                decoration: BoxDecoration(
                  color: AppColor.logoColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: .3,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MarqueeText(
                    text: TextSpan(
                      text: '15th July Monday, all our outlets are open. Additionally, our online activities are open and operational.',
                    ),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    speed: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
