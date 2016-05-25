Setup the SDK
=============

In order to work properly, the SDK must be initialized with a number of parameters:

 * OAuth Token: the current secret token for the current registered user
 * KWS API URL: the API backend to connect to in order to perform all operations
 * Delegate: a class / object that acts as delegate for the KWSProtocol

The three parameters can be conveniently set by using the **setup** function:

.. code-block:: swift


    NSString *token = "__CURRENT_VALID_OAUTH_TOKEN__";
    NSString *url = "__KWS_API_BACKEND_URL__";
    [[KWS sdk] setupWithOAuthToken:token kwsApiUrl:url delegate:self];

Also, the class that acts as a delegate of **KWSProtocol** must implement the following methods:

.. code-block:: obj-c

    @interface MyViewController () <KWSProtocol>
    @end
    @implementation MyViewController

    // rest of the implementation ...

    // <KWSProtocol> implementation

    - (void) isAllowedToRegisterForRemoteNotifications {

    }

    - (void) isAlreadyRegisteredForRemoteNotifications {

    }

    - (void) didRegisterForRemoteNotifications {

    }

    - (void) didFailBecauseKWSDoesNotAllowRemoteNotifications {

    }

    - (void) didFailBecauseKWSCouldNotFindParentEmail {

    }

    - (void) didFailBecauseRemoteNotificationsAreDisabled {

    }

    - (void) didFailBecauseOfError {

    }

    @end


Once this is achieved, you've correctly setup the Kids Web Services iOS SDK.
