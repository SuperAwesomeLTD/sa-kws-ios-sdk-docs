Update a user
=============

You can update information for the user you're authenticated by using the **UserServiceProtocol** and call:

* **updateUser**

This function will take: 

======== ================ ========
Value    Type             Meaning
======== ================ ========
details  [String, Any]    A map of the fields to update
userId   String           The current authenticated user id
token    String           The current authenticated user token
======== ================ ========

.. code-block:: java

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userService = sdk.getService(withType: UserServiceProtocol.self)

  let details: [String : Any] = ["firstName" : "John",
                             "lastName" : "Doe"]

  userService?.updateUser(details: details, userId: 123 , token: "AAA.BBB.CCC") { (error) in
      if error == nil {
        //Success!!! All went well.
      } else {
        //Uh-oh! It seems there's an error...
      }
   }

A more complex example of an update of user details is where you'd want to update something like the **address**. 

This is how you should do it:

.. code-block:: java

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userService = sdk.getService(withType: UserServiceProtocol.self)
  
  let details: [String : Any] = ["firstName" : "John",
                                   "lastName" : "Doe",
                                   "address" : ["street": "22 Long Acre",
                                                "city": "London",
                                                "postCode": "WC2E 9LY",
                                                "country": "GB"
                                               ]
                                ]

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

  Please note that if you're trying to update a piece of information you haven't been granted permission for
  the whole update operation will fail.
