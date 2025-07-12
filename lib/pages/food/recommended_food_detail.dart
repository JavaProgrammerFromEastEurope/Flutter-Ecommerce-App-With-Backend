import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';
import 'package:flutter_ecommerce_2_first/utils/dimensions.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_icon.dart';
import 'package:flutter_ecommerce_2_first/widgets/big_text.dart';
import 'package:flutter_ecommerce_2_first/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child:
                        BigText(size: Dimensions.font26, text: "Chinese Side")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/img/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                      text:
                          "Sint minim nostrud mollit adipisicing ad nisi et excepteur commodo. Occaecat qui Lorem duis proident tempor ex amet Lorem deserunt dolor voluptate excepteur. Voluptate ad nostrud ipsum ex veniam ullamco est amet amet dolor. Irure elit elit sit ea reprehenderit nostrud. Do consequat esse mollit adipisicing consequat qui elit velit. Culpa mollit nulla minim fugiat eiusmod anim. Magna et mollit nulla do. Dolor id et duis dolor laboris fugiat ex id ad. Minim eiusmod qui laborum sit in labore culpa commodo exercitation ullamco do. Proident fugiat elit minim deserunt proident aliqua in fugiat Lorem duis laborum. In magna ad culpa adipisicing veniam laboris ut culpa mollit laboris esse. Culpa excepteur sint exercitation consequat anim tempor incididunt esse magna cillum. Amet quis exercitation amet mollit ipsum sunt. Lorem ut consectetur non aliquip. Nostrud pariatur reprehenderit ut incididunt sit ullamco pariatur Lorem. Incididunt amet officia amet irure excepteur ullamco pariatur id culpa laborum ex ipsum velit aliqua. Reprehenderit tempor cupidatat occaecat ex nisi dolor cupidatat. Lorem et enim veniam incididunt enim nostrud sint sint consectetur officia. Ex aliqua velit nulla proident minim Lorem esse commodo. Cupidatat do irure incididunt ut fugiat. Aliquip commodo eiusmod elit esse laboris consequat amet elit proident enim et est. Voluptate qui non eiusmod pariatur commodo cupidatat voluptate excepteur enim dolore sit. Velit dolore reprehenderit minim velit aute eu laborum eu commodo proident qui est id cupidatat. Dolor velit officia dolor et laborum. Sint officia do nulla voluptate consectetur nostrud non ullamco duis nisi duis minim minim. Adipisicing magna cillum pariatur sunt cupidatat. Ipsum exercitation magna fugiat amet. Veniam ullamco dolor eu pariatur ad quis consectetur deserunt sunt in. Voluptate tempor irure enim commodo adipisicing ex occaecat deserunt. Anim magna commodo eiusmod officia fugiat fugiat nisi amet eiusmod quis. Sunt nostrud duis aliquip cupidatat. Dolor labore nostrud laboris ut amet esse cillum anim labore dolor in aute consequat enim. Lorem voluptate voluptate duis ut et reprehenderit. Mollit commodo sunt dolore exercitation nostrud duis aliqua ipsum irure anim ullamco anim ex.Nulla qui aliquip reprehenderit consectetur velit do. Irure laboris dolore cillum deserunt elit consectetur nulla laboris nulla est adipisicing amet mollit officia. Est aute laboris consectetur ad labore eu esse ullamco amet magna. Velit commodo laborum dolor proident et incididunt minim minim excepteur eiusmod id sunt Lorem.Nulla culpa duis dolor anim. Esse eiusmod quis irure adipisicing ex officia quis exercitation consequat minim. Id amet in ullamco culpa qui labore ea eu nulla irure. Eu ea dolore fugiat occaecat quis ea aliqua eu ad. Dolore in in id aliquip esse nostrud deserunt incididunt minim commodo duis culpa.Deserunt aliqua nisi fugiat minim labore ea aliqua do. Amet cillum commodo sint ipsum. Voluptate laborum aliquip ipsum excepteur labore. Quis laborum aute irure officia veniam aliquip labore voluptate laboris. Lorem adipisicing labore ullamco cillum nulla ea. Nostrud enim culpa in sunt nostrud consectetur excepteur aliquip nulla. Incididunt ullamco anim non consequat ea aliquip consequat.Pariatur eu est sit voluptate dolor consectetur laboris exercitation consequat ex exercitation nulla in. Ullamco eu laborum veniam aliqua ad officia elit occaecat aliquip ad. Esse dolore elit veniam culpa consequat non nulla. In excepteur fugiat amet sunt nisi deserunt sit consectetur tempor ea ullamco aute officia."),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88 " + " X " + " 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font16,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
