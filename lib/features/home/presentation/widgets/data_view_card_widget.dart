import 'package:flutter/material.dart';

class DataViewCardWidget extends StatelessWidget {
  final String iconPath; // Changed from IconData to String
  final Color iconBackground;
  final String title;
  final String status;
  final bool isActive;
  final String data1Value;
  final String data2Value;
  final Color backgroundColor; // Added for different card backgrounds
  final Color statusColor; // Added for dynamic status text color
  final VoidCallback? onTap;

  const DataViewCardWidget({
    super.key,
    required this.iconPath,
    required this.iconBackground,
    required this.title,
    required this.status,
    required this.isActive,
    required this.data1Value,
    required this.data2Value,
    this.backgroundColor = const Color(0xFFE1F0FF), // Default Light Blue
    this.statusColor = const Color(0xFF0099FF), // Default Blue
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8), // Reduced margin
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Reduced vertical padding
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF9CA3AF), width: 1), // Grey Border
        ),
        child: Row(
          children: [
            // Icon Image
            Image.asset(
              iconPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 40,
                height: 40,
                color: Colors.grey[300],
                child: const Icon(Icons.error, size: 20),
              ),
            ),
            const SizedBox(width: 12),
            
            // Title and data
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title with status text
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(2), // Square-ish rounded
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF001F3F), // Dark Blue
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '($status)',
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4), // Reduced gap
                  
                  // Data values
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'Data 1',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        ' : ',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      Text(
                        data1Value,
                        style: const TextStyle(
                          color: Color(0xFF001F3F),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2), // Reduced gap
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'Data 2',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        ' : ',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      Text(
                        data2Value,
                        style: const TextStyle(
                          color: Color(0xFF001F3F),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Chevron icon
            Icon(
              Icons.chevron_right,
              color: Colors.grey[600],
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
