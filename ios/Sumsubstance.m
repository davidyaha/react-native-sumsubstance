#import "Sumsubstance.h"
// #import "SumSubstanceKYC.h"
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <SumSubstanceKYC/SumSubstanceKYC.h>


@implementation SumSubstance

+ (BOOL)requiresMainQueueSetup {
  return NO;
}
RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(verifyApplicant:(NSString *)applicantId
                  token:(NSString *)token
                  baseUrl:(NSString *)baseUrl
                  supportEmail:(NSString *)supportEmail
                  chatTitle:(NSString *)chatTitle
                  tokenExpirationHandler:(RCTResponseSenderBlock)tokenExpirationHandler
                  verificationResultHandler:(RCTResponseSenderBlock)verificationResultHandler
                  )
{
  SSEngine *engine = [SSFacade setupForApplicant:applicantId
                                       withToken:token
                                          locale:NSLocale.currentLocale.localeIdentifier
                                    supportEmail:supportEmail
                                         baseUrl:baseUrl
                                     colorConfig:nil
                                     imageConfig:nil];
  
  [engine connectWithExpirationHandler:^{
    
    tokenExpirationHandler(@[]);
    
  } verificationResultHandler:^(bool isApproved) {
    
    verificationResultHandler(@[@(isApproved)]);
  }];
  
  dispatch_async(dispatch_get_main_queue(), ^{
    
    UIViewController *vc =
    [SSFacade getChatControllerWithAttributedTitle:[NSAttributedString.alloc initWithString:chatTitle]];
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
    [rootVC presentViewController:vc animated:YES completion:nil];
  });
}

RCT_EXPORT_MODULE()
RCT_EXPORT_METHOD(setRefreshToken:(NSString *)token) {
  
  [SSEngine.instance setRefreshToken:token];
}

@end