Login as a user
===============

To login as a user you'll have to call:

.. code-block:: objective-c

  [[KWSChildren sdk] loginUser: @"username"
                  withPassword: @"password"
                   andResponse: ^(KWSChildrenLoginUserStatus status)
  {
    // handle the auth response status
    switch (status) {
      case KWSChildren_LoginUser_Success:
        // authenticated OK
        break;
      case KWSChildren_LoginUser_InvalidCredentials:
        // one of the credentials was not valid
        break;
      case KWSChildren_LoginUser_NetworkError:
        // there was a network error
        break;
    }
  }];

The callback will pass the following values on completion:

====== ========================== ======
Value  Type                       Meaning
====== ========================== ======
status KWSChildrenLoginUserStatus End status of the operation
====== ========================== ======

The **status** parameter may have the following values:

======================================== ======
Value                                    Meaning
======================================== ======
KWSChildren_LoginUser_Success            User was authenticated successfully
KWSChildren_LoginUser_InvalidCredentials The username or password were incorrect
KWSChildren_LoginUser_NetworkError       Other network error
======================================== ======
