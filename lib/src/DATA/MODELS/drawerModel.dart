class DrawerModel {
  String? iD;
  String? menuID;
  String? menuName;
  String? subMenuID;
  String? subMenuName;
  String? userType;
  String? isActive;
  String? menuIcon;
  String? subMenuIcon;
  String? navigateURL;
  String? menuURL1;
  String? menuURL;
  String? displayOrder;
  String? menuOrder;
  String? userType1;
  List<SubMenu>? subMenu;

  DrawerModel(
      {this.iD,
      this.menuID,
      this.menuName,
      this.subMenuID,
      this.subMenuName,
      this.userType,
      this.isActive,
      this.menuIcon,
      this.subMenuIcon,
      this.navigateURL,
      this.menuURL1,
      this.menuURL,
      this.displayOrder,
      this.menuOrder,
      this.userType1,
      this.subMenu});

  DrawerModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    menuID = json['MenuID'];
    menuName = json['MenuName'];
    subMenuID = json['SubMenuID'];
    subMenuName = json['SubMenuName'];
    userType = json['UserType'];
    isActive = json['IsActive'];
    menuIcon = json['MenuIcon'];
    subMenuIcon = json['SubMenuIcon'];
    navigateURL = json['NavigateURL'];
    menuURL1 = json['MenuURL1'];
    menuURL = json['MenuURL'];
    displayOrder = json['DisplayOrder'];
    menuOrder = json['MenuOrder'];
    userType1 = json['UserType1'];
    if (json['SubMenu'] != null) {
      // final data = (json['SubMenu'] as List).map((e) => SubMenu.fromJson(e)).toList();
      // subMenu = new List<SubMenu>();
      // subMenu = List<SubMenu>.filled(500, json['SubMenu'], growable: true);
      subMenu = <SubMenu>[];
      json['SubMenu'].forEach((v) {
        subMenu!.add(new SubMenu.fromJson(v));
        print(subMenu!);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['MenuID'] = this.menuID;
    data['MenuName'] = this.menuName;
    data['SubMenuID'] = this.subMenuID;
    data['SubMenuName'] = this.subMenuName;
    data['UserType'] = this.userType;
    data['IsActive'] = this.isActive;
    data['MenuIcon'] = this.menuIcon;
    data['SubMenuIcon'] = this.subMenuIcon;
    data['NavigateURL'] = this.navigateURL;
    data['MenuURL1'] = this.menuURL1;
    data['MenuURL'] = this.menuURL;
    data['DisplayOrder'] = this.displayOrder;
    data['MenuOrder'] = this.menuOrder;
    data['UserType1'] = this.userType1;
    if (this.subMenu != null) {
      data['SubMenu'] = this.subMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubMenu {
  String? iD;
  String? menuID;
  String? menuName;
  String? subMenuID;
  String? subMenuName;
  String? userType;
  String? isActive;
  String? menuIcon;
  String? subMenuIcon;
  String? navigateURL;
  String? menuURL1;
  String? menuURL;
  String? displayOrder;
  String? menuOrder;
  String? userType1;

  SubMenu(
      {this.iD,
      this.menuID,
      this.menuName,
      this.subMenuID,
      this.subMenuName,
      this.userType,
      this.isActive,
      this.menuIcon,
      this.subMenuIcon,
      this.navigateURL,
      this.menuURL1,
      this.menuURL,
      this.displayOrder,
      this.menuOrder,
      this.userType1});

  SubMenu.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    menuID = json['MenuID'];
    menuName = json['MenuName'];
    subMenuID = json['SubMenuID'];
    subMenuName = json['SubMenuName'];
    userType = json['UserType'];
    isActive = json['IsActive'];
    menuIcon = json['MenuIcon'];
    subMenuIcon = json['SubMenuIcon'];
    navigateURL = json['NavigateURL'];
    menuURL1 = json['MenuURL1'];
    menuURL = json['MenuURL'];
    displayOrder = json['DisplayOrder'];
    menuOrder = json['MenuOrder'];
    userType1 = json['UserType1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['MenuID'] = this.menuID;
    data['MenuName'] = this.menuName;
    data['SubMenuID'] = this.subMenuID;
    data['SubMenuName'] = this.subMenuName;
    data['UserType'] = this.userType;
    data['IsActive'] = this.isActive;
    data['MenuIcon'] = this.menuIcon;
    data['SubMenuIcon'] = this.subMenuIcon;
    data['NavigateURL'] = this.navigateURL;
    data['MenuURL1'] = this.menuURL1;
    data['MenuURL'] = this.menuURL;
    data['DisplayOrder'] = this.displayOrder;
    data['MenuOrder'] = this.menuOrder;
    data['UserType1'] = this.userType1;
    return data;
  }
}
