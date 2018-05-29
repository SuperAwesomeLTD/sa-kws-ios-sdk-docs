Start a new KWS session
=======================

In order to be able to use the Kids Web Services SDK you'll first have to setup a session.

A session is defined by

	* an OAuth 2.0 Token
	* a back-end API URL to connect to

To set it up you will have to call:

.. code-block:: objective-c

	[[KWS sdk] startSessionWithToken: @"token" andAPIUrl: @"api"];

Obtaining a Token
-----------------

To obtain an OAuth 2.0 Token you will first have to authenticate as a user or create a new user.

To authenticate as a user you'll have to call:

.. code-block:: objective-c

  [[KWS sdk] authUser: @"username"
         withPassword: @"password"
                     : ^(BOOL success, NSString *token){

    // handle auth
  }];

The callback will pass the following values on completion:

======= ====== ======
Value   Type   Meaning
======= ====== ======
success Bool   wether the auth operation succeeded
token   String the OAuth 2.0 token to be used to start the session
======= ====== ======

If there are no valid users, you can create a new one by calling:

.. code-block:: objective-c

  [[KWS sdk] createUser: @"username"
           withPassword: @"passowrd"
         andDateOfBirth: @"yyyy-mm-dd"
             andCountry: @"GB"
                       : ^(BOOL success, NSString *token){

    // setup the session
  }];

The callback will pass the following values on completion:

======= ====== ======
Value   Type   Meaning
======= ====== ======
success Bool   wether the network operation succeeded
token   String the OAuth 2.0 token to be used to start the session
======= ====== ======

Thus, if any of the two operations are successful you can call the **setupWithAuthToken:kwsApiUrl:** in the callback, as follows:

.. code-block:: objective-c

  [[KWS sdk] authUser: @"username"
         withPassword: @"password"
                     : ^(BOOL success, NSString *token){

    if (success && token) {
      [[KWS sdk] setupWithAuthToken: token kwsApiUrl: @"api"];
    } else {
      // handle error case
    }
  }];

Obtaining an API URL
--------------------

The API URL on the other hand depends on the instance of KWS you want to connect to. You can get more information by emailing `<sdk_devsuspport> <mailto:<sdk_devsuspport>>`_.

.. note::

  At the moment the only available demo API is https://kwsapi.demo.superawesome.tv/v1/
