Setup the SDK
=============

In order to work properly, the SDK must be initialized with a number of parameters:

 * OAuth Token: the current secret token for the current registered user
 * KWS API URL: the API backend to connect to in order to perform all operations
 * Delegate: a class / object that acts as delegate for the KWSProtocol

The three parameters can be conveniently set by using the **setup** function:

.. code-block:: swift

    KWS.sdk.setup(oauthToken: "__CURRENT_VALID_OAUTH_TOKEN__",
                  kwsApiUrl: "__KWS_API_BACKEND__",
                  delegate: self)

Also, the class that acts as a delegate of **KWSProtocol** must implement the following methods:

.. code-block:: swift

    class MyViewController: UIViewController, KWSProtocol {

        // rest of the implementation ...

        // <KWSProtocol> implementation

        func isAllowedToRegisterForRemoteNotifications () {

        }

        func isAlreadyRegisteredForRemoteNotifications () {

        }

        func didRegisterForRemoteNotifications () {

        }

        func didFailBecauseKWSDoesNotAllowRemoteNotificaitons () {

        }

        func didFailBecauseKWSCouldNotFindParentEmail () {

        }

        func didFailBecauseRemoteNotificationsAreDisabled () {

        }

        func didFailBecauseOfError () {

        }
    }

Once this is achieved, you've correctly setup the Kids Web Services iOS SDK.
