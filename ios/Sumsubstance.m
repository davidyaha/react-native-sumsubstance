#import "Sumsubstance.h"
#import "SumSubstanceKYC.h"

@implementation Sumsubstance

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setupForApplicant:(NSString *)applicantID
                                             withToken:(NSString *)token
                                            locale:(NSString *)locale
                                            supportEmail:(NSString *)supportEmail
                                            baseUrl:(NSString *)baseUrl
                                            colorConfig:(nullable __kindof KYCColorConfig *)colorConfig
                  imageConfig:(nullable __kindof KYCImageConfig *)imageConfig; ){
  
    SSEngine *engine = [SSFacade setupForApplicant:applicantID
                                     withToken:authToken
                                    locale:locale
                                    supportEmail:supportEmail
                                    baseUrl:baseUrl
                                   colorConfig:colorConfigOrNil
                                   imageConfig:imageConfigOrNil];
      [engine connectWithExpirationHandler: (RCTResponseSenderBlock)callback];
      callback(@[[NSDictionary dictionary], engine]);
      [SSFacade getChatControllerWithAttributedTitle:titleOrNil ]
}


RCT_EXPORT_METHOD(setRefreshToken:(NSString *)newToken: (RCTResponseSenderBlock)callback){
    engine.refreshToken = newToken;
    callback(@[[NSString token], newToken]);
}

@end
