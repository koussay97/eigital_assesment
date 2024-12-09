import 'package:eigital_assessment/core/brand_guideline/asset_accessor.dart';
import 'package:uuid/uuid.dart';

//////////// mock data class
class UserClass {
  final bool selected;
  final String id;
  final String email;
  final String phoneNumber;
  final String? image;
  final String name;
  final DateTime? lastVisit;

  final List<OnlineReviewModel>? reviews;
  final DateTime? customerSince;
  final DateTime? birthday;
  final DateTime? anniversary;

  /// spending
  final double averageSpent;
  final double lifetimeSpent;
  final double averageTip;
  final int totalOrders;

  /// loyalty
  final int loyaltyPointsEarned;
  final int loyaltyPointsAvailable;
  final int loyaltyPointsRedeemed;
  final double loyaltyAmount;
  final String loyaltyNo;

  /// visits
  final int totalVisits;

  /// sum of all visits
  final int canceledVisits;
  final int upcomingVisits;
  final int noShowVisits;

  UserClass(
      {required this.email,
      required this.selected,
      required this.id,
      this.reviews,
      required this.name,
      required this.phoneNumber,
      required this.lastVisit,
      required this.averageSpent,
      required this.averageTip,
      required this.canceledVisits,
      required this.lifetimeSpent,
      required this.loyaltyAmount,
      required this.loyaltyPointsAvailable,
      required this.loyaltyPointsEarned,
      required this.loyaltyPointsRedeemed,
      required this.noShowVisits,
      required this.upcomingVisits,
      required this.totalOrders,
      required this.loyaltyNo,
      this.anniversary,
      this.birthday,
      this.customerSince,
      this.image})
      : totalVisits = canceledVisits + noShowVisits + upcomingVisits;

  static UserClass empty() {
    Uuid uuid = const Uuid();
    return UserClass(
      reviews: [],
      selected: false,
      id: uuid.v6(),
      loyaltyNo: 'RF|',
      anniversary: DateTime(2003, 12, 3),
      birthday: DateTime(1997, 12, 3),
      customerSince: DateTime(2012, 12, 3),
      name: '',
      phoneNumber: '',
      email: '',
      averageSpent: 55.6,
      averageTip: 15.4,
      canceledVisits: 5,
      lastVisit: DateTime.now(),
      lifetimeSpent: 40000,
      loyaltyAmount: 342.5,
      loyaltyPointsAvailable: 45,
      loyaltyPointsEarned: 500,
      loyaltyPointsRedeemed: 200,
      noShowVisits: 34,
      totalOrders: 58,
      upcomingVisits: 34,
      image: null,
    );
  }

  UserClass copyWith({
    String? email,
    String? id,
    String? phoneNumber,
    String? image,
    String? name,
    DateTime? lastVisit,
    DateTime? customerSince,
    DateTime? birthday,
    DateTime? anniversary,
    double? averageSpent,
    double? lifetimeSpent,
    double? averageTip,
    int? totalOrders,
    int? loyaltyPointsEarned,
    int? loyaltyPointsAvailable,
    int? loyaltyPointsRedeemed,
    double? loyaltyAmount,
    String? loyaltyNo,
    int? canceledVisits,
    int? upcomingVisits,
    int? noShowVisits,
    bool? selected,
    List<OnlineReviewModel>? reviews,
  }) {
    return UserClass(
      reviews: reviews ?? this.reviews,
      selected: selected ?? this.selected,
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      name: name ?? this.name,
      lastVisit: lastVisit ?? this.lastVisit,
      customerSince: customerSince,
      birthday: birthday,
      anniversary: anniversary,
      averageSpent: averageSpent ?? this.averageSpent,
      lifetimeSpent: lifetimeSpent ?? this.lifetimeSpent,
      averageTip: averageTip ?? this.averageTip,
      totalOrders: totalOrders ?? this.totalOrders,
      loyaltyPointsEarned: loyaltyPointsEarned ?? this.loyaltyPointsEarned,
      loyaltyPointsAvailable:
          loyaltyPointsAvailable ?? this.loyaltyPointsAvailable,
      loyaltyPointsRedeemed:
          loyaltyPointsRedeemed ?? this.loyaltyPointsRedeemed,
      loyaltyAmount: loyaltyAmount ?? this.loyaltyAmount,
      loyaltyNo: loyaltyNo ?? this.loyaltyNo,
      canceledVisits: canceledVisits ?? this.canceledVisits,
      upcomingVisits: upcomingVisits ?? this.upcomingVisits,
      noShowVisits: noShowVisits ?? this.noShowVisits,
    );
  }
}

List<OnlineReviewModel> reviewList = [
  OnlineReviewModel.empty().copyWith(
    reviewImage: AssetAccessor.socialGoogleSvgIcon,
    reviewMessage:
    'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
    reviewRating: 5,
  ),
  OnlineReviewModel.empty().copyWith(
    reviewImage: AssetAccessor.socialBrustImage,
    reviewMessage:
    'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
    reviewRating: 4,
  ),
  OnlineReviewModel.empty().copyWith(
    reviewImage: AssetAccessor.socialFourSquareImage,
    reviewMessage:
    'I highly recommend trying their Japan Chicken. it was bursting with flavor.',
    reviewRating: 3,
  ),
  OnlineReviewModel.empty().copyWith(
    reviewImage: AssetAccessor.socialZagatImage,
    reviewMessage:
    'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
    reviewRating: 2,
  ),
];

/// static user data :::
List<UserClass> users = [
  UserClass.empty().copyWith(
    reviews: reviewList,
      lastVisit: DateTime(2000, 4, 2),
      averageSpent: 200.4,
      canceledVisits: 13,
      lifetimeSpent: 44005,
      averageTip: 13.7,
      loyaltyPointsRedeemed: 3242,
      totalOrders: 1300,
      noShowVisits: 55,
      upcomingVisits: 11,
      loyaltyPointsAvailable: 1800,
      loyaltyAmount: 2049.46,
      loyaltyPointsEarned: 4546221,
      anniversary: DateTime(1966, 2, 12),
      birthday: DateTime(1940, 2, 12),
      customerSince: DateTime(1980, 10, 1),
      email: 'lia.thomas516@reddit.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Lia Thomas',
      image: AssetAccessor.imageLea),
  UserClass.empty().copyWith(
      lastVisit: DateTime(2018, 4, 2),
      averageSpent: 140.4,
      canceledVisits: 55,
      lifetimeSpent: 320,
      averageTip: 55.7,
      loyaltyPointsRedeemed: 453,
      totalOrders: 65,
      noShowVisits: 5,
      upcomingVisits: 11,
      loyaltyPointsAvailable: 10,
      loyaltyAmount: 45.6,
      loyaltyPointsEarned: 100,
      anniversary: DateTime(2014, 2, 12),
      birthday: DateTime(2001, 3, 11),
      customerSince: DateTime(2016, 3, 13),
      email: 'cleorahills@gmail.com',
      phoneNumber: '+1 212-450-7890',
      name: 'Bergnaum',
      image: AssetAccessor.imageBergnaum),
  UserClass.empty().copyWith(
    reviews: reviewList,
      lastVisit: null,
      averageSpent: 0,
      canceledVisits: 0,
      lifetimeSpent: 0,
      averageTip: 0,
      loyaltyPointsRedeemed: 0,
      totalOrders: 0,
      noShowVisits: 0,
      upcomingVisits: 0,
      loyaltyPointsAvailable: 0,
      loyaltyAmount: 0,
      loyaltyPointsEarned: 0,
      anniversary: null,
      birthday: null,
      customerSince: null,
      email: 'wunder@gmail.com',
      phoneNumber: '+1 212-236-7890',
      name: 'Wunderlich',
      image: AssetAccessor.imageWunder),
  UserClass.empty().copyWith(
      lastVisit: null,
      averageSpent: 0,
      canceledVisits: 0,
      lifetimeSpent: 0,
      averageTip: 0,
      loyaltyPointsRedeemed: 0,
      totalOrders: 0,
      noShowVisits: 0,
      upcomingVisits: 0,
      loyaltyPointsAvailable: 0,
      loyaltyAmount: 0,
      loyaltyPointsEarned: 0,
      anniversary: null,
      birthday: null,
      customerSince: null,
      email: 'alaskanm@dog.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Arjun Gerhold'),
  UserClass.empty().copyWith(
    reviews: reviewList,
      email: 'simeon@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Simeon Wilderman'),
  UserClass.empty().copyWith(
      email: 'edenka@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Eden Kautzer',
      image: AssetAccessor.imageEden),
  UserClass.empty().copyWith(
    email: 'gyostt@Test.com',
    phoneNumber: '+1 212-456-7890',
    name: 'Gino Yost',
  ),
  UserClass.empty().copyWith(
    reviews: reviewList,
      lastVisit: null,
      averageSpent: 0,
      canceledVisits: 0,
      lifetimeSpent: 0,
      averageTip: 0,
      loyaltyPointsRedeemed: 0,
      totalOrders: 0,
      noShowVisits: 0,
      upcomingVisits: 0,
      loyaltyPointsAvailable: 0,
      loyaltyAmount: 0,
      loyaltyPointsEarned: 0,
      anniversary: null,
      birthday: null,
      customerSince: null,
      email: 'aydeveu@synd.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Ayden Veum',
      image: AssetAccessor.imageAyden),
  UserClass.empty().copyWith(
      email: 'edenka@user.com',
      phoneNumber: '+1 212-456-7890',
      name: 'Eden Kautzer',
      image: AssetAccessor.imageEden),
];

class OnlineReviewModel {
  final String reviewMessage;
  final String reviewImage;
  final int reviewRating;

  OnlineReviewModel(
      {required this.reviewMessage,
      required this.reviewImage,
      required this.reviewRating});

  static OnlineReviewModel empty() {
    return OnlineReviewModel(
      reviewImage: '',
      reviewMessage: '',
      reviewRating: 0,
    );
  }

  OnlineReviewModel copyWith({
    String? reviewMessage,
    String? reviewImage,
    int? reviewRating,
  }) {
    return OnlineReviewModel(
      reviewRating: reviewRating ?? this.reviewRating,
      reviewMessage: reviewMessage ?? this.reviewMessage,
      reviewImage: reviewImage ?? this.reviewImage,
    );
  }
}
