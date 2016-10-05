Example
=======

.. code-block:: obj-c

    #import "MyViewController.h"
    #import "KWS.h"

    @interface MyViewController ()  <KWSProtocol>
    @end

    @implementation MyViewController

    - (void) viewDidLoad {
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.

        // setup data
        NSString *token1 = @"__CURRENT_VALID_OAUTH_TOKEN__";
        NSString *url = @"https://kwsapi.demo.superawesome.tv/v1/"";

        // setup SDK
        [[KWS sdk] setupWithOAuthToken:token
                             kwsApiUrl:url
                              delegate:self];

        // start checking for notifications
        [[KWS sdk] checkIfNotificationsAreAllowed];
    }

    - (void) didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    - (void) isAllowedToRegisterForRemoteNotifications {
        // if the SDK checkup determines the user is allowed to receive
        // remote notifications - then register the user!
        [[KWS sdk] registerForRemoteNotifications];
    }

    - (void) isAlreadyRegisteredForRemoteNotifications {

    }

    - (void) didRegisterForRemoteNotifications {

    }

    - (void) didFailBecauseKWSDoesNotAllowRemoteNotifications {

    }

    - (void) didFailBecauseKWSCouldNotFindParentEmail {
        NSString *email = @"example@parent.com";
        [[KWS sdk] submitParentEmail:email];
    }

    - (void) didFailBecauseRemoteNotificationsAreDisabled {

    }

    - (void) didFailBecauseOfError {

    }

    @end
