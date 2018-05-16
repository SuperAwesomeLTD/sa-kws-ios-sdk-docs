Overview
========

The Kids Web Services SDK is designed to be as simple as possible while also enabling you to perform as many actions as possible.
It's built on top of the KWS API and tries to manage the complexity of interacting with it, as well as provide additional device specific features.

.. note::

	When using the SDK you will have to first authenticate as a user with the KWS back-end to be able to access the complete SDK functionality.

The Kids Web Services SDK will then handle the following topics on your behalf:

+------------------------------------------------------+
| User authentication                                  |
+------------------------------------------------------+
| Handle permissions to obtain data from users         |
+------------------------------------------------------+
| Manage an apps' leaderboard                          |
+------------------------------------------------------+
| Assign points or virtual currencies                  |
+------------------------------------------------------+
| Handle remote notifications in a COPPA-compliant way |
+------------------------------------------------------+
| Assign custom app data                               |
+------------------------------------------------------+
| Invite users' friends                                |
+------------------------------------------------------+

Kids Web Services also takes into account **Parental Permissions** for everything that happens.
Thus, while most operations will naturally not depend on parental consent, such as assigning points, custom data, inviting other friends, other operations
such as looking up specific user details, updating user details or enabling remote notifications will depend on the parent enabling that permission in the
Kids Web Services Parent Portal.

While your app should rely on Kids Web Services to handle all the legal and data complexity, it should also gracefully handle cases when a user's parent has
denied permission for certain bits of information to be stored or shared.

The SDK is built around a common singleton class called **KWS**. The singleton accessor method is simply called **sdk**.

Thus any method call will have the following pattern:

.. code-block:: objective-c

  [[KWSChildren sdk] method];

Since most operations performed by the SDK involve doing network requests on KWS API, most method calls won't have a return type but will instead require a callback,
defined as an Objective-C block with a variable number of parameters.

.. code-block:: objective-c

  [[KWSChildren sdk] method: ^(BOOL result) {
    // perform operation on result
  }];

Callback parameters are most of the time self explanatory. For example if the method calls wants to check if a user is registered for remote
notifications, it'll have a boolean parameter called **success**. If it retrieves user data it will contain a reference to a user object, etc.

Some methods also can have one or two parameters. In this case they will have the following signature:

.. code-block:: objective-c

  [[KWSChildren sdk] method: (NSInteger) param1
                  withParam: (NSString*) param2
                andResponse: ^(BOOL result) {
    // perform operation on result
  }];

.. note::

  All method calls in the Kids Web Services SDK have the callback method listed as last, making them ideal for Swift and it's functional notation.
