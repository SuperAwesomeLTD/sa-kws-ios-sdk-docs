Login as a user
===============

To login as a user you'll have to call:

.. code-block:: objective-c

  [[KWS sdk] loginUser: @"username"
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
