// Autogenerated from Pigeon (v17.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class FLTBook;

@interface FLTBook : NSObject
+ (instancetype)makeWithTitle:(nullable NSString *)title
    urlImage:(nullable NSString *)urlImage;
@property(nonatomic, copy, nullable) NSString * title;
@property(nonatomic, copy, nullable) NSString * urlImage;
@end

/// The codec used by FLTBookApi.
NSObject<FlutterMessageCodec> *FLTBookApiGetCodec(void);

@protocol FLTBookApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<FLTBook *> *)searchKeyword:(NSString *)keyword error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpFLTBookApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTBookApi> *_Nullable api);

NS_ASSUME_NONNULL_END
