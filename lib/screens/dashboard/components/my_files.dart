import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/my_files.dart';
import '../../../constants.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate responsive columns based on available width
              final availableWidth = constraints.maxWidth;
              final minCardWidth = 180.0; // Reduced minimum width per card
              final maxColumns = 4;
              final calculatedColumns =
                  (availableWidth / minCardWidth).floor().clamp(1, maxColumns);

              return FileInfoCardGridView(
                crossAxisCount: calculatedColumns,
                childAspectRatio: availableWidth < 600
                    ? 1.0
                    : (availableWidth < 800 ? 1.1 : 1.2),
              );
            },
          ),
          desktop: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate responsive columns based on available width
              final availableWidth = constraints.maxWidth;
              final minCardWidth = 200.0; // Minimum width per card for desktop
              final maxColumns = 4;
              final calculatedColumns =
                  (availableWidth / minCardWidth).floor().clamp(2, maxColumns);

              return FileInfoCardGridView(
                crossAxisCount: calculatedColumns,
                childAspectRatio: availableWidth < 800
                    ? 1.0
                    : (availableWidth < 1200 ? 1.1 : 1.3),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
