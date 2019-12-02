package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.sumsub;

public class SumsubstanceModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public SumsubstanceModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Sumsubstance";
    }
    
    @ReactMethod
    public void startKYCModule() {
        String kycAPIPath = "msdk.sumsub.com"; //prod
        //String kycAPIPath = "test-msdk.sumsub.com"; //dev
        
        KYCColorConfig config = new KYCColorConfig();
        //config.setChatButtonBackgroundColor(Color.parseColor("#aaaaaa"));
        //config.setChatButtonTextColor(Color.BLACK);
    
        KYCClientData clientData = new KYCClientData(
            kycAPIPath,
            getPackageName(),
            "2.0",
            TestManager.getInstance().getLocale(),
            TestManager.getInstance().getApplicant(),
            "support@sumsub.com",
            config,
            new KYCStringConfig(),
            new KYCIconConfig()
        );
    
        KYCManager.init(
            this, 
            clientData, 
            TestManager.getInstance().getKYCTokenUpdater(), 
            Collections.singletonList(new Liveness3DModule()) //if you need Liveness module or empty list instead
        );
        Intent intent = new Intent(this, KYCChatActivity.class);
        startActivityForResult(intent, KYC_REQUEST_CODE);
    }
    
    @ReactMethod
    public KYCTokenUpdater getKYCTokenUpdater() {
        return new KYCTokenUpdater() {
    
            @Override
            public void getInitialToken(ParamCallback<String> callback) {
                callback.onResult(getToken());
            }
    
            @Override
            public void updateExpiredToken(final String expiredToken, final ParamCallback<String> callback) {
                TestNetworkManager.getInstance().addToRequestQueue(new TestAuthRequest(getLogin(), getPasssword(), new TestRequestListener<String>() {
    
                    @Override
                    public void onResult(String result) {
                        setToken(result);
                        callback.onResult(result);
                    }
    
                    @Override
                    public void onError(Exception e) {
                        new Handler().postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                updateExpiredToken(expiredToken, callback);
                                }
                        }, 4000);
                    }
                }));
            }
        };
    }
    @ReactMethod
    @Override
public void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);

    if (data != null && requestCode == KYC_REQUEST_CODE) {
        KYCReviewResult kycReviewResult = (KYCReviewResult) data.getSerializableExtra(KYCChatActivity.KYC_VERIFICATION_KEY);
        if (kycReviewResult != null) {
            // do smth
        }
    }
}
}
