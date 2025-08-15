import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  bool isManualScan = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = screenWidth > screenHeight;
    final isLargeTablet = screenWidth > 1024;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(80),
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
      //               child: Container(
      //                 color: Colors.grey[300],
      //                 child: const Icon(Icons.person, color: Colors.grey),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isLargeTablet ? 32.0 : 24.0),
          child: Column(
            children: [
              // Header with Success Banner - Responsive layout
              _buildHeader(isLandscape),

              // Production Order Header
              _buildProductionOrderHeader(),

              // Production Process Section - Responsive header
              _buildProductionProcessSection(isLandscape),

              // Main content - Responsive layout (side by side vs stacked)
              _buildMainContent(isLandscape, isLargeTablet),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isLandscape) {
    if (isLandscape) {
      // Landscape: Side by side layout
      return Container(
        margin: const EdgeInsets.only(bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left part: Navigation and Title
            const Expanded(
              flex: 2,
              child: Row(
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
                  Expanded(
                    child: Text(
                      "Scan & Generate Code",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Right part: Success Banner
            Expanded(
              flex: 1,
              child: _buildSuccessBanner(),
            ),
          ],
        ),
      );
    } else {
      // Portrait: Stacked layout
      return Container(
        margin: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation and Title
            const Row(
              children: [
                // Container(
                //   height: 44,
                //   width: 44,
                //   decoration: BoxDecoration(
                //     color: Colors.blue.shade50,
                //     borderRadius: BorderRadius.circular(12),
                //   ),
                //   // child: IconButton(
                //   //   icon: const Icon(Icons.arrow_back_ios,
                //   //       color: Colors.black, size: 20),
                //   //   onPressed: () {},
                //   //   padding: const EdgeInsets.only(left: 4),
                //   // ),
                // ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Scan & Generate Code",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Success Banner
            _buildSuccessBanner(),
          ],
        ),
      );
    }
  }

  Widget _buildSuccessBanner() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),

          // Scrollable text with visual ellipsis (fade effect)
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.white,
                        Colors.white,
                        Colors.white.withOpacity(0.0),
                      ],
                      stops: const [0.0, 0.9, 1.0], // Fade out the last 10%
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: const Text(
                        "1 box barcode generated successfully",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.red, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildProductionOrderHeader() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Production Order",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
                "See All",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1677FF)
                )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductionProcessSection(bool isLandscape) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with search - responsive
          if (isLandscape) ...[
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Production Process",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 200,
                  height: 44,
                  child: _buildSearchField(),
                ),
              ],
            ),
          ] else ...[
            const Text(
              "Production Process",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: _buildSearchField(),
            ),
          ],

          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Box Size
              const _InfoItem(
                  label: "Box Size:",
                  value: "04 Pieces",
                  valueColor: Colors.black
              ),

              const Spacer(), // Push right side content to the right

              Wrap(
                spacing: isLandscape ? 24.0 : 16.0,
                runSpacing: 8.0,
                children: const [
                  _InfoItem(
                      label: "Capacity:",
                      value: "06",
                      valueColor: Color(0xFF1677FF)
                  ),
                  _InfoItem(
                      label: "Filled:",
                      value: "04",
                      valueColor: Color(0xFF722ED1)
                  ),
                  _InfoItem(
                      label: "Unfilled:",
                      value: "05",
                      valueColor: Colors.black
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(fontSize: 16),
        prefixIcon: const Icon(CupertinoIcons.search, size: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildMainContent(bool isLandscape, bool isLargeTablet) {
    if (isLandscape) {
      // Landscape: Side by side layout
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Scanned Items Section
          Expanded(
            flex: isLargeTablet ? 5 : 1,
            child: _buildScannedItemsSection(),
          ),
          SizedBox(width: isLargeTablet ? 32.0 : 24.0),
          // Barcode Preview Section
          Expanded(
            flex: isLargeTablet ? 4 : 1,
            child: _buildBarcodePreviewSection(),
          ),
        ],
      );
    } else {
      // Portrait: Stacked layout
      return Column(
        children: [
          // Scanned Items Section
          _buildScannedItemsSection(),
          const SizedBox(height: 24),
          // Barcode Preview Section
          _buildBarcodePreviewSection(),
        ],
      );
    }
  }

  Widget _buildScannedItemsSection() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                  child: Text(
                    "Scanned Items",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
              ),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 24),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 8),
          _buildScanCard("Pallet", "370/600", 0.61, CupertinoIcons.chart_bar, "12345678"),
          _buildScanCard("Pack", "61/100", 0.61, CupertinoIcons.cube, "12345678"),
          _buildScanCard("Box", "25/30", 0.83, CupertinoIcons.cube_box, "12345678"),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1677FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                elevation: 2,
              ),
              child: const Text(
                  "Generate QR Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBarcodePreviewSection() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                  child: Text(
                    "Barcode Preview",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
              ),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 24),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 8),
          // Scan Mode Tabs
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF5F5F5),
              border: Border.all(color: Colors.grey.shade200),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                _scanTab("Manual Scan", isManualScan),
                _scanTab("Auto Scan", !isManualScan),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Scan Box
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            dashPattern: const [12, 8],
            color: Colors.blue.shade300,
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 140,
                width: double.infinity,
                color: Colors.blue.shade50,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.barcode_viewfinder, color: Color(0xFF1677FF), size: 48),
                    SizedBox(height: 12),
                    Text(
                      "Scan your barcode here",
                      style: TextStyle(
                        color: Color(0xFF1677FF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1677FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
              ),
              child: const Text(
                  "Start Scan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ),
          ),
          const SizedBox(height: 24),
          _barcodeCard("Bottle 01", "12345678", "10×40", "Lubricants"),
          _barcodeErrorCard("Bottle 01", "-"),
          _barcodeCard("Bottle 01", "12345678", "10×40", "Lubricants"),
        ],
      ),
    );
  }

  Widget _buildScanCard(String label, String boxText, double progress,
      IconData icon, String code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row - responsive
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 300) {
                // Very narrow: stack vertically
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(icon, color: Colors.blue, size: 32),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            label,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          "Code: $code",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                    ),
                  ],
                );
              } else {
                // Wide enough: side by side
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(icon, color: Colors.blue, size: 32),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              label,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          "Code: $code",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Boxes: $boxText",
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              color: const Color(0xFF1677FF),
              backgroundColor: Colors.grey.shade200,
              minHeight: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _scanTab(String text, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isManualScan = text == "Manual Scan";
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF1677FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected ? [
              BoxShadow(
                color: const Color(0xFF1677FF).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ] : null,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF1677FF),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _barcodeCard(String title, String code, String qty, String type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.inventory_2_outlined,
                  size: 24,
                  color: Color(0xFF1677FF),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1677FF),
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Bottom row - responsive
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 300) {
                // Narrow: stack vertically
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Code: $code",
                        style: const TextStyle(fontSize: 16)
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Item: $qty",
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                              type,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF1677FF),
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                // Wide: single row
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Code: $code",
                        style: const TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                        "Item: $qty",
                        style: const TextStyle(fontSize: 16)
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        // color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                          type,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            // color: Color(0xFF1677FF),
                          )
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _barcodeErrorCard(String title, String code) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with error icon and message
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.error_rounded,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "This barcode is not correct",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Code and item row with dashes
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Code: -",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Item: -",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper widget for info items
class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}