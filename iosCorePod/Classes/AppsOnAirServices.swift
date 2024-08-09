

import UIKit
import AVFoundation

public class AppsOnAirCoreServices : NSObject, NetworkServiceDelegate {
    
    private var appId: String = ""
    public var isNetworkConnected: Bool? = nil
    private var window: UIWindow?
    private var errorMessage:String = "AppsOnAir Appid is Not initialized for more details: \n https://documentation.appsonair.com"
    var networkService: NetworkService = ReachabilityNetworkService()
    
    @objc public func initialize(){
            networkService.delegate = self
            networkService.startMonitoring()
    }
    
    @objc public func getAppId()-> String{
        self.appId = Bundle.main.infoDictionary?["appId"] as? String ?? "";
        if self.appId == "" {
            #if DEBUG
            print(MyError.runtimeError(errorMessage))
            exit(-1)
            #else
            print(MyError.runtimeError(errorMessage))
            return ""
            #endif
        }else{
            return self.appId
        }
    }
   
    @objc public func isConnectedNetwork()-> Bool{
        return (isNetworkConnected ?? false)
    }
    
    func networkStatusDidChange(status: Bool) {
        if(isNetworkConnected != status){
            networkStatusChangeHandler?(status)
            isNetworkConnected = status
        }
    }
    // Closure type for network status change handler
    public typealias NetworkStatusChangeHandler = (Bool) -> Void
    private var networkStatusChangeHandler: NetworkStatusChangeHandler?
      
    // Method to set the network status change handler
    @objc public func networkStatusListenerHandler(_ handler: @escaping NetworkStatusChangeHandler) {
        networkStatusChangeHandler = handler
      }
    
    //Throw Error
    enum MyError: Error {
        case runtimeError(String)
    }
}
