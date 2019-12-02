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
                                            imageConfig:(nullable __kindof KYCImageConfig *)imageConfig; callback:(RCTResponseSenderBlock)callback)
{
    
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

RCT_EXPORT_METHOD(getChatControllerWithAttributedTitle:(nullable NSAttributedString *)title;  callback:(RCTResponseSenderBlock)callback)
{
    
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

RCT_EXPORT_METHOD(setRefreshToken:(NSString *)newToken; callback:(RCTResponseSenderBlock)callback)
{
    
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

@end
