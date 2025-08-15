import 'package:flutter/material.dart';

class ProductionOrderDetailScreen extends StatefulWidget {
  const ProductionOrderDetailScreen({super.key});

  @override
  State<ProductionOrderDetailScreen> createState() => _ProductionOrderDetailScreenState();
}

class _ProductionOrderDetailScreenState extends State<ProductionOrderDetailScreen> {
  int currentPage = 1;
  final int totalPages = 10;

  // Sample data for the table
  final List<Map<String, String>> tableData = [
    {
      'docNo': '12345',
      'date': '02/06/2025',
      'itemCode': '#09876',
      'productionLn': '001',
      'itemName': 'Lorem Ipsum',
      'whName': 'Warehouse 01',
      'warehouseNo': '12345',
      'planQuantity': '1,800',
      'actualQuantity': '1,000',
    },
    {
      'docNo': '37507',
      'date': '#09876',
      'itemCode': '#09876',
      'productionLn': '001',
      'itemName': 'Lorem Ipsum',
      'whName': 'Warehouse 02',
      'warehouseNo': '76542',
      'planQuantity': '1,800',
      'actualQuantity': '1,500',
    },
    // Add more sample data
    ...List.generate(8, (index) => {
      'docNo': '37507',
      'date': '#09876',
      'itemCode': '#09876',
      'productionLn': '001',
      'itemName': 'Lorem Ipsum',
      'whName': 'Warehouse 02',
      'warehouseNo': '76542',
      'planQuantity': '1,800',
      'actualQuantity': '1,500',
    }),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;
    final isLargeTablet = screenWidth > 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80), // Increased height
      //   child: ClipRRect(
      //     borderRadius: const BorderRadius.only(
      //       bottomLeft: Radius.circular(24),
      //       bottomRight: Radius.circular(24),
      //     ),
      //     child: AppBar(
      //       backgroundColor: const Color(0xFF2F80ED),
      //       toolbarHeight: 80,
      //       leading: Padding(
      //         padding: const EdgeInsets.all(12.0),
      //         child: IconButton(
      //           icon: const Icon(Icons.dashboard_outlined,
      //               color: Colors.white, size: 32),
      //           onPressed: () {},
      //         ),
      //       ),
      //       title: const Text(
      //         'Logo',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //           color: Colors.white,
      //         ),
      //       ),
      //       centerTitle: true,
      //       actions: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //           child: IconButton(
      //             icon: const Icon(Icons.notifications_outlined,
      //                 color: Colors.white, size: 28),
      //             onPressed: () {},
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 20.0),
      //           child: CircleAvatar(
      //             backgroundColor: Colors.white,
      //             radius: 20,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://via.placeholder.com/40',
      //                 fit: BoxFit.cover,
      //                 errorBuilder: (context, error, stackTrace) {
      //                   return Container(
      //                     color: Colors.grey[300],
      //                     child: const Icon(Icons.person, color: Colors.grey),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isLargeTablet ? 32.0 : 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section - Responsive layout
            Container(
              margin: const EdgeInsets.only(bottom: 28.0),
              child: isLandscape
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeaderTitle(),
                  _buildAddButton(),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderTitle(),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildAddButton(),
                  ),
                ],
              ),
            ),

            // Data Table Card - Enhanced design
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              color: Colors.white,
              child: Column(
                children: [
                  // Table content with horizontal scroll for portrait mode
                  Container(
                    width: double.infinity,
                    child: isLandscape
                        ? _buildTableContent(context, false)
                        : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _buildTableContent(context, true),
                    ),
                  ),

                  // Pagination - Always visible
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade200, width: 1),
                      ),
                    ),
                    child: _buildPagination(context, isLandscape),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return const Row(
      children: [
        // Container(
        //   height: 44,
        //   width: 44,
        //   decoration: BoxDecoration(
        //     color: Colors.blue.shade50,
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios,
        //         color: Colors.black, size: 20),
        //     onPressed: () {},
        //     padding: const EdgeInsets.only(left: 4),
        //   ),
        // ),
        SizedBox(width: 16),
        Text(
          'Production Order Detail',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007BFF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 4,
        ),
        child: const Text(
          'Add Production Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTableContent(BuildContext context, bool forceWidth) {
    final tableWidth = forceWidth ? 1200.0 : double.infinity;

    return Container(
      width: forceWidth ? tableWidth : null,
      child: Column(
        children: [
          // Table Header
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE2E8F0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: _buildTableRow([
              'Doc No',
              'Date',
              'Item Code',
              'Production Ln',
              'Item Name',
              'WH Name',
              'Warehouse No',
              'Plan Quantity',
              'Actual Quantity',
            ], isHeader: true),
          ),

          // Table Data
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tableData.length,
            itemBuilder: (context, index) {
              final data = tableData[index];
              final isEven = index % 2 == 0;

              return Container(
                decoration: BoxDecoration(
                  color: isEven ? Colors.white : const Color(0xFFF8FAFC),
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade200),
                    right: BorderSide(color: Colors.grey.shade200),
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                child: _buildTableRow([
                  data['docNo']!,
                  data['date']!,
                  data['itemCode']!,
                  data['productionLn']!,
                  data['itemName']!,
                  data['whName']!,
                  data['warehouseNo']!,
                  data['planQuantity']!,
                  data['actualQuantity']!,
                ]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return Row(
      children: cells.map((cell) {
        return Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              cell,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
                fontSize: isHeader ? 16 : 15,
                color: isHeader ? Colors.black87 : Colors.grey.shade700,
              ),
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPagination(BuildContext context, bool isLandscape) {
    if (isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPaginationButton('Previous', Icons.arrow_back_ios, true),
          _buildPageNumbers(),
          _buildPaginationButton('Next', Icons.arrow_forward_ios, false),
        ],
      );
    } else {
      // Stack pagination vertically for portrait mode
      return Column(
        children: [
          _buildPageNumbers(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPaginationButton('Previous', Icons.arrow_back_ios, true),
              _buildPaginationButton('Next', Icons.arrow_forward_ios, false),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildPaginationButton(String text, IconData icon, bool isLeft) {
    return SizedBox(
      height: 44,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (isLeft && currentPage > 1) {
              currentPage--;
            } else if (!isLeft && currentPage < totalPages) {
              currentPage++;
            }
          });
        },
        style: OutlinedButton.styleFrom(
          iconColor: const Color(0xFF007BFF),
          backgroundColor: const Color(0xFFE6F3FF),
          foregroundColor: const Color(0xFF007BFF),
          side: const BorderSide(color: Color(0xFF007BFF), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLeft) ...[
              Icon(icon, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!isLeft) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPageNumbers() {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        _buildPageNumber(1),
        _buildPageNumber(2),
        _buildPageNumber(3),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: const Text(
            '...',
            style: TextStyle(
              color: Color(0xFF718096),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildPageNumber(9),
        _buildPageNumber(10),
      ],
    );
  }

  Widget _buildPageNumber(int pageNumber) {
    final isActive = pageNumber == currentPage;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentPage = pageNumber;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF007BFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive ? null : Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF718096),
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}