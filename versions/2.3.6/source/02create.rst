Creating a user programmatically
================================

If there are no valid users, you can create a new one by calling:

.. code-block:: objective-c

  [[KWSChildren sdk] createUser: @"username"
                   withPassword: @"password"
                 andDateOfBirth: @"2011-03-02"
                     andCountry: @"US"
                 andParentEmail: @"parent@test.com"
                    andResponse: ^(KWSChildrenCreateUserStatus status)
  {
    switch (status) {
      case KWSChildren_CreateUser_Success: {
        // create new user OK
        break;
      }
      case KWSChildren_CreateUser_NetworkError: {
        // network error while creating user
        break;
      }
      case KWSChildren_CreateUser_DuplicateUsername: {
        // duplicate username
        break;
      }
    }
  }];

The callback will pass the following values on completion:

======= =========================== ======
Value   Type                        Meaning
======= =========================== ======
status  KWSChildrenCreateUserStatus End status of the operation
======= =========================== ======

The **status** parameter may have the following values:

========================================= ======
Value                                     Meaning
========================================= ======
KWSChildren_CreateUser_Success            User was authenticated successfully
KWSChildren_CreateUser_InvalidUsername    Chosen username contains invalid characters
KWSChildren_CreateUser_InvalidPassword    Password is less than 8 characters
KWSChildren_CreateUser_InvalidDateOfBirth Date should have YYYY-MM-DD format
KWSChildren_CreateUser_InvalidCountry     Country should have CC format
KWSChildren_CreateUser_InvalidParentEmail Parent email is invalid
KWSChildren_CreateUser_DuplicateUsername  The username is already in use
KWSChildren_CreateUser_NetworkError       Other network error
KWSChildren_CreateUser_InvalidOperation   Other invalid operation
========================================= ======

From here on you'll be able to check leaderboards, assign points, enable remote notifications, set app data, etc.
