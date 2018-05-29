Invite friends
==============

You can invite other users on behalf of the user you're authenticated as by using **UserActionsServiceProtocol** and calling:

* **inviteUser**

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userActionsService = sdk.getService(withType: UserActionsServiceProtocol.self)

   userActionsService?.inviteUser(email: "friend@test.com", userId: 123, token: "AAA.BBB.CCC") { (error) in

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
