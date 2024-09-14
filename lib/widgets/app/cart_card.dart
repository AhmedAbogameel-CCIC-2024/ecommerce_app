import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';
import '../app_text.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://student.valuxapps.com/storage/uploads/products/1638737571de5EF.21.jpg',
          height: 64,
          width: 64,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: 'title',
                fontWeight: FontWeight.w700,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: AppText(
                      title: '${124} EGP',
                      color: AppColors.orange,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 16,
                    child: Icon(
                      Icons.remove,
                      color: AppColors.white,
                    ),
                  ),
                  AppText(
                    title: '1',
                    fontWeight: FontWeight.w700,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    fontSize: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 16,
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
