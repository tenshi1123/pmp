import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassManagementScreen extends StatefulWidget {
  const ClassManagementScreen({super.key});

  @override
  State<ClassManagementScreen> createState() => _ClassManagementScreenState();
}

class _ClassManagementScreenState extends State<ClassManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(
        title: const Text(
          "Lớp học đang phụ trách",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // TabBar
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    padding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.r),
                            topRight: Radius.circular(14.r)),
                        color: Colors.white),
                    tabs: const [
                      Tab(text: "Lớp học trung tâm"),
                      Tab(text: "Lớp học zoom"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Nội dung tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Danh sách lớp học trung tâm
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: const [
                    ClassCard(
                        className: "Lớp A001",
                        description: "Khóa tiếng Anh cơ bản"),
                    SizedBox(height: 12),
                    ClassCard(
                        className: "Lớp A002",
                        description: "Khóa tiếng Anh nâng cao"),
                  ],
                ),

                // Danh sách lớp học Zoom (tạm thời trống)
                const Center(child: Text("Không có lớp học Zoom")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị thông tin lớp học
class ClassCard extends StatelessWidget {
  final String className;
  final String description;

  const ClassCard(
      {super.key, required this.className, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon lớp học
          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 24,
            child: Icon(Icons.computer, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),

          // Thông tin lớp học
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                className,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClassManagementScreen(),
  ));
}
