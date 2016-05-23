Example
=======

.. code-block:: swift

    import UIKit
    import KWSiOSSDK

    class ViewController: UIViewController, KWSProtocol {

        // <UIViewController> setup functions

        override func viewDidLoad() {
            // call to super
            super.viewDidLoad()

            // setup KWS
            KWS.sdk.setup(oauthToken: "_FULL_OAUTH_TOKEN_",
                          kwsApiUrl: "https://kwsapi.demo.superawesome.tv/v1/",
                          delegate: self)

            // start checking
            KWS.sdk.checkIfNotificationsAreAllowed()
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        // <KWSProtocol> implementation

        func isAllowedToRegisterForRemoteNotifications () {
            KWS.sdk.registerForRemoteNotifications()
        }

        func isAlreadyRegisteredForRemoteNotifications () {
            // usually do nothing here
        }

        func didFailBecauseKWSCouldNotFindParentEmail () {
            let parentEmail = "example@parent.com"
            KWS.sdk.submitParentEmail(email)
        }

        // parent has disabled remote notifications for this user on this app
        func didFailBecauseKWSDoesNotAllowRemoteNotificaitons () {
            //
        }

        // user has disabled remote notifications on his phone
        func didFailBecauseRemoteNotificationsAreDisabled () {
            print("User has disabled remote notifications")
        }

        // probably network error
        func didFailBecauseOfError () {
        }

        func didRegisterForRemoteNotifications () {
            print("Success!")
        }
    }
