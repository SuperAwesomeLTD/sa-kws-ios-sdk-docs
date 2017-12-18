Request permissions
===================

If for any reason your app needs access to specific user information, like first name, last name, email address or physical address you'll first have
to ask permission for it. Kids Web Services will handle sending an explanatory email to the user's parent. From then on the parent will be able to
access the Parent Portal to manage these permissions.

Thus, to request permission for the user you're authenticated as you'll need to call:

.. code-block:: objective-c

  // create an array of permissions
  NSArray *permissions = @[
    @(KWSChildren_PermissionType_AccessEmail),
    @(KWSChildren_PermissionType_AccessFirstName)
  ];

  // request the permissions all at a time
  [[KWSChildren sdk] requestPermission: permissions
                          withResponse: ^(KWSChildrenRequestPermissionStatus status)
  {
    switch (status) {
      case KWSChildren_RequestPermission_Success: {
        break;
      }
      case KWSChildren_RequestPermission_NoParentEmail: {
        break;
      }
      case KWSChildren_RequestPermission_NetworkError: {
        break;
      }
    }
  }];

The callback will pass the following values on completion:

====== ================================== ======
Value  Type                               Meaning
====== ================================== ======
status KWSChildrenRequestPermissionStatus End status of the operation
====== ================================== ======

The **status** parameter may have the following values:

=========================================== ======
Value                                       Meaning
=========================================== ======
KWSChildren_RequestPermission_Success       User asked for permission successfully
KWSChildren_RequestPermission_NoParentEmail User does not have an attached parent email
KWSChildren_RequestPermission_NetworkError  Other network error
=========================================== ======

And the available permissions are:

+-------------------+
| **Permission**    |
+-------------------+
| AccessEmail       |
+-------------------+
| AccessAddress     |
+-------------------+
| AccessFirstName   |
+-------------------+
| AccessLastName    |
+-------------------+
| AccessPhoneNumber |
+-------------------+
| SendNewsletter    |
+-------------------+

.. note::

  Normally just by requesting a permission you won't automatically get access to request or modify the associated bit of information. You'll have to await the parent's decision. You can always check the status in the **KWSUser** object's **KWSPermission** member.

.. note::

  If the callback **requested** parameter is **false** then it means the user doesn't yet have an associated parent email. This is common for new users. Check out the next section to find out how to request and submit the parent email.
