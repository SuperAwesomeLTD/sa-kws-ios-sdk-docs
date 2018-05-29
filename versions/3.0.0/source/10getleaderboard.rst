Get leaderboard
===============

You can get the current application's leaderboard, for the user you're authenticated as, by using **ScoreServiceProtocol** and calling:

* **getScore**

It will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
appId       Integer The app id
token       String  The authenticated user token
=========== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

And an example is:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let scoreService = sdk.getService(withType: ScoreServiceProtocol.self)

  scoreService?.getLeaderboard(appId: 2, token: "AAA.BBB.CCC" ){ (result, error) in

     if result != nil {
       //Success!!! All went well.
     } else {
       //Uh-oh! It seems there's an error...
     }
  }

The callback will pass the following value on completion:

======= ========================== ======
Value   Type    		           Meaning
======= ========================== ======
result  LeaderWrapperModelProtocol If non-null, the SDK was able to retrieve information about the leaderboard
error   Throwable                  If non-null, an error occurred
======= ========================== ======

The **LeaderWrapperModelProtocol** contains the following fields:

======= ======================= =======
Field   Type                    Meaning
======= ======================= =======
results [LeaderModelProtocol]   A list of leaderboards
count   Integer                 The number of items in the leaderboard
offset  Integer                 The offset of the leaderboard
limit   Integer                 The limit for the leaderboard
======= ======================= =======

The **LeadersModel** object contains the following fields:

======= ======== =======
Field   Type     Meaning
======= ======== =======
name    String   The username in leaderboard
score   Integer  Current score in the app
rank    Integer  Current rank in the app
======= ======== =======