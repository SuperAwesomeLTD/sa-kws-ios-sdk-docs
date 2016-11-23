Creating a new user
===================

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
