Start a new KWS session
=======================

In order to be able to use the Kids Web Services SDK you'll first have to setup a session.

Setup session
-------------

A session is defined by

	* a client ID
	* a client Secret
	* a back-end API URL to connect to

To set it up you will have to call:

.. code-block:: objective-c

  #define CLIENT_ID     @"id"
  #define CLIENT_SECRET @"client_secret"
  #define API           @"kws_api"

  [[KWS sdk] startSessionWithClientId: CLIENT_ID
                      andClientSecret: CLIENT_SECRET
                            andAPIUrl: API];

You can obtain the Client Id, Client Secret and API host from the **Integration** section of your Kids Web Services Control Panel.

They should be different for each app you have.

.. image:: img/kws-integration.png

Once you've setup your SDK session, it's time to authenticate as a user. All of of the functionality of the SDK assumes you're
logged in as a user.

Authenticating as user
----------------------

To authenticate as a user you'll have to call:

.. code-block:: objective-c

  [[KWS sdk] authenticateUser: @"username"
                  andPassword: @"password"
                  andResponse: ^(KWSAuthUserStatus status)
  {
    // handle the auth response status
    switch (status) {
      case KWSAuthUser_Success:
        // authenticated OK
        break;
      case KWSAuthUser_InvalidCredentials:
        // one of the credentials was not valid
        break;
      case KWSAuthUser_NetworkError:
        // there was a network error
        break;
    }
  }];

The callback will pass the following values on completion:

====== ================= ======
Value  Type              Meaning
====== ================= ======
status KWSAuthUserStatus End status of the operation
====== ================= ======

The **status** parameter may have the following values:

============================== ======
Value                          Meaning
============================== ======
KWSAuthUser_Success            User was authenticated successfully
KWSAuthUser_InvalidCredentials The username or password were incorrect
KWSAuthUser_NetworkError       Other network error
============================== ======

Creating a new user
-------------------

If there are no valid users, you can create a new one by calling:

.. code-block:: objective-c

  [[KWS sdk] createUser:@"username"
           withPassword:@"password"
         andDateOfBirth:@"2011-03-02"
             andCountry:@"US"
         andParentEmail:@"parent@test.com"
            andResponse:^(KWSCreateUserStatus status)
  {
    switch (status) {
      case KWSCreateUser_Success: {
        // create new user OK
        break;
      }
      case KWSCreateUser_NetworkError: {
        // network error while creating user
        break;
      }
      case KWSCreateUser_DuplicateUsername: {
        // duplicate username
        break;
      }
    }
  }];

The callback will pass the following values on completion:

======= =================== ======
Value   Type                Meaning
======= =================== ======
status  KWSCreateUserStatus End status of the operation
======= =================== ======

The **status** parameter may have the following values:

================================ ======
Value                            Meaning
================================ ======
KWSCreateUser_Success            User was authenticated successfully
KWSCreateUser_InvalidUsername    Chosen username contains invalid characters
KWSCreateUser_InvalidPassword    Password is less than 8 characters
KWSCreateUser_InvalidDateOfBirth Date should have YYYY-MM-DD format
KWSCreateUser_InvalidCountry     Country should have CC format
KWSCreateUser_InvalidParentEmail Parent email is invalid
KWSCreateUser_DuplicateUsername  The username is already in use
KWSCreateUser_NetworkError       Other network error
KWSCreateUser_InvalidOperation   Other invalid operation
================================ ======

From here on you'll be able to check leaderboards, assign points, enable remote notifications, set app data, etc.

Persisting the session
----------------------

Once a user is either created or authenticated, KWS will keep the user for 24 hours in user prefferrences or system defaults.

You can access the basic logged user details by calling:

.. code-block:: objective-c

  KWSLoggedUser *currentUser = [[KWS sdk] getLoggedUser];

The **KWSUser** object has the following fields:

====================== ===================== =======
Field                  Type                  Meaning
====================== ===================== =======
id                     Integer               Unique Id of the user
username               String                Username for this app only
dateOfBirth            String                Date of birth of user
country                String                Two letter country designation
parentEmail            String                Users' parent email
accessToken            String                OAuth access token
token                  String                OAuth final token
expiresIn              Integer               Milliseconds till expiration
loginDate              Long                  Last login date
metadata               KWSMetadata           Metadata object
====================== ===================== =======

The **KWSMetadata** object has the following fields:

======== ======= =======
Field    Type    Meaning
======== ======= =======
userId   Integer Unique Id of the user
appId    Integer App Id the user is logged on
clientId String  Client Id of the app
scope    String  Current scope
iat      Integer
exp      Integer Date of expiration (in milliseconds)
iss      Integer
======== ======= =======
