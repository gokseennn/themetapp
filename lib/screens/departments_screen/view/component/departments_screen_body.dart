import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neon_app_case/common/widget/common_header_image_text.dart';
import 'package:neon_app_case/screens/departments_screen/controller/departments_screen_controller.dart';

class DepartmentsScreenBody extends StatelessWidget {
  const DepartmentsScreenBody({super.key, required this.controller});
  final DepartmentsScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 375, // Başlık ve resim yüksekliği
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            title: const Text(
              "The Met Collection",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  const SizedBox(height: 75), // Başlık için boşluk
                  CommonHeaderImageText()
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextFormField(
                onTap: () => controller.isSearchFocused.value = true,
                onEditingComplete: () {
                  controller.onEditingComplate();
                },
                onTapOutside: (event) {
                  controller.isSearchFocused.value = false;
                },
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  suffixIcon: Obx(() => Container(
                        width: 56,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Image.asset(
                          controller.isSearchFocused.value
                              ? 'assets/icons/btn_search_selected@3x.png'
                              : 'assets/icons/btn_search_unselected@3x.png',
                          width: 24,
                          height: 24,
                        ),
                      )),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/img_collection_${(index + 2).toString().padLeft(2, '0')}@3x.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded || frame != null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                      Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            controller.departments.value[index].departmentName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: controller.departments.value.length,
            ),
          ),
        ],
      ),
    );
  }
}
