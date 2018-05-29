Associate a parent email
========================

.. note::
  This is the same behaviour as the **Update user** page. Only highlighted due to the importance of this functionality related to the permissions request.

You can associate a parent email for the user you're authenticated using the **UserServiceProtocol** and call:

* **updateUser**

This function will take: 

======== ================ ========
Value    Type             Meaning
======== ================ ========
details  [String : Any]   A map of the fields to update
userId   String           The current authenticated user id
token    String           The current authenticated user token
======== ================ ========

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userService = sdk.getService(withType: UserServiceProtocol.self)

  let details: [String : Any] = ["parentEmail" : parentEmail]

  userService?.updateUser(details: details, userId: 123 , token: "AAA.BBB.CCC") { (error) in

    if error == nil {
      //Success!!! All went well.
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

The callback will pass the following value on completion:

======= ========= ======
Value   Type      Meaning
======= ========= ======
error   Error     If non-null, an error occurred
======= ========= ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

