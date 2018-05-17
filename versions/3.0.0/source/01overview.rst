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

The SDK is built around a common class called **ComplianceSDK** that will provide visibility to different functionalities, introducing a single point of connection between app and SDK.

In order to gain visibility to the KWS components, it the will require:

#. **environment** - using the Kids Web Services Control Panel defined configurations
#. **service protocol** - a defined protocol with pre-set number of functionalities available

.. note::

  The **environment** and **service protocols** will be getting more focus in the upcoming pages! 

Assuming an already setup environment as **myEnvironment** and an interface service as **MyServiceProtocol**, your method calls will follow this pattern:

.. code-block:: swift

  var myEnvironment : MyEnvironment() //your environment
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let myService = sdk.getService(withType: MyServiceProtocol.self)

  myService?.methodCall()


Since most operations performed by the SDK involve doing network requests on KWS API, most method calls won't have a return type but will instead require a callback,
defined as a Swift completion handler with a variable number of parameters.

The most frequent type of method call and callback is where a **result** or an **error** will be present.

.. code-block:: swift

  myService?.methodCall() { (result, error) in

    if result != nil {
      //Success! We have a result that we can use.
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

However, there are cases where it is only expected a success/failure type of response. 

By design, the way this is done is having a **single** callback parameter, as an error type:

.. code-block:: swift

  myService?.methodCall() { (error) in

    if error == nil {
      //Success! All went well
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

Let's now have a look on how to properly initialise the SDK.
