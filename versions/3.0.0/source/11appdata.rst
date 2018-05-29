App data
========

For each user registered on an app in the Kids Web Services Control Panel you can add and get custom String-Integer pairs of App Data.

Set app data
------------

You can add a pair of such data for the user you're authenticated as by using **UserActionsServiceProtocol** and calling:

* **getAppData**

It will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
userId      Integer The authenticated user id
appId       Integer The app id
token       String  The authenticated user token
=========== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

And an example is:

.. code-block:: java

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userActionsService = sdk.getService(withType: UserActionsServiceProtocol.self)

  userActionsService?.getAppData(userId: 123, appId: 2, token: "AAA.BBB.CCC") { (result, error) in

     if result != nil {
       //Success!!! All went well.
     } else {
       //Uh-oh! It seems there's an error...
     }
   }

The callback will pass the following value on completion:

======= =========================== ======
Value   Type                        Meaning
======= =========================== ======
result  AppDataWrapperModelProtocol If non-null, the SDK was able to retrieve information about the app data
error   Error                       If non-null, an error occurred
======= =========================== ======

The **AppDataWrapperModelProtocol** contains the following fields:

======= ========================= =======
Field   Type                      Meaning
======= ========================= =======
count   Integer                   The number of items in the app data
offset  Integer                   The offset of the app data
limit   Integer                   The limit for the app data
results [AppDataModelProtocol]    A list of app data
======= ========================= =======

The **AppDataModelProtocol** contains the following fields:

======= ======== =======
Field   Type     Meaning
======= ======== =======
name    String   The name of the specific data
value   Integer  Value for the specific data
======= ======== =======

.. note::

  Please note the fact that app data pairs can only by String-Integer. This is in order to further protect users.

Get app data
------------

To get the app data for the user you're authenticated as, you can use **UserActionsServiceProtocol** and calling:

* **setAppData**

It will take:

======== ======= =======
Field.   Type    Meaning
======== ======= =======
value    String  The value for your data to set
key      Integer The key name for your data to set
userId   Integer The authenticated user id
appId    Integer The app id
token    String  The authenticated user token
======== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

And an example is:

.. code-block:: java

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userActionsService = sdk.getService(withType: UserActionsServiceProtocol.self)

  userActionsService?.setAppData(value: 1, key: "your_key_name", userId: 123, token: "AAA.BBB.CCC") { (error) in

    if error == nil {
      //Success!!! All went well.
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

The callback will pass the following values on completion:

======= ========= ======
Value   Type      Meaning
======= ========= ======
error   Error     If non-null, an error occurred
======= ========= ======
