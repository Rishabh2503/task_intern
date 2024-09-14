import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio App',
          theme: ThemeData(
            primaryColor: const Color(0xFFDF5532),
            fontFamily: 'Roboto',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: child,
        );
      },
      child: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;
  String _searchQuery = '';
  // Portfolio selected by default

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              _buildTabs(),
              _buildSearchBar(),
              Expanded(child: _buildProjectList()),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildFilterButton(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        'Portfolio',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          height: 21.09 / 18,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/bag.svg',
              color: Theme.of(context).primaryColor),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset('assets/icons/bell.svg',
              color: Theme.of(context).primaryColor),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 16.0), // Add space to the right side of the last tab
        child: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          indicatorPadding: const EdgeInsets.only(
              left: 0, right: 0), // No space between indicator and screen edge
          labelPadding: const EdgeInsets.symmetric(
              horizontal: 0), // Adjust the spacing between tabs
          tabs: const [
            Tab(text: 'Project'),
            Tab(text: 'Saved'),
            Tab(text: 'Shared'),
            Tab(text: 'Achievment'), // Adjust spelling if necessary
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search a project',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            suffixIcon: Container(
              width: 28.w,
              height: 28.h,
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFDF5532),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.search, color: Colors.white, size: 20.sp),
            ),
          ),
        ),
      ),
    );
  }

  final projects = [
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project5.png'
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project1.png'
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project2.png'
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project3.png'
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project4.png'
    },
    {
      'title': 'Search1 Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project1.png'
    },
    {
      'title': 'Search2 Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project2.png'
    },
    {
      'title': 'Thanks for visit',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'image': 'assets/images/project3.png'
    },
  ];
  Widget _buildProjectList() {
    final filteredProjects = projects.where((project) {
      return project['title']!
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    if (filteredProjects.isEmpty) {
      return Center(
        child: Text(
          'No matching projects found',
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image.asset(
                  filteredProjects[index]['image']!,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredProjects[index]['title']!,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredProjects[index]['subtitle']!,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                filteredProjects[index]['author']!,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF39519), Color(0xFFFFCD67)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: CustomPaint(
        painter: BottomNavLinePainter(
          color: Theme.of(context).primaryColor,
          selectedIndex: _selectedIndex,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor:
              Theme.of(context).primaryColor, // Set this to your theme color
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/portfolio.svg',
                color: _selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                width: 24.w,
                height: 24.h,
              ),
              label: 'Portfolio',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Input',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        ),
        icon: const Icon(Icons.filter_list, color: Colors.white),
        label: Text(
          'Filter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class BottomNavLinePainter extends CustomPainter {
  final Color color;
  final int selectedIndex;

  BottomNavLinePainter({required this.color, required this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final double itemWidth = size.width / 4; // Assuming 4 nav items
    final double startX = selectedIndex * itemWidth;
    final double endX = startX + itemWidth;

    canvas.drawLine(
        Offset(startX, 0), Offset(endX, 0), paint); // Draw line on top
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
