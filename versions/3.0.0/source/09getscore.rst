Get score
=========

You can get the current score of the user you're authenticated as by by using **ScoreServiceProtocol** and calling:

* **getScore**

And it will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
appId       Integer The app id
token       String  The authenticated user token
=========== ======= =======

.. note::
 The **appId** can be retrieved from the authenticated token.

 As an example, we'll be using **2**.

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let scoreService = sdk.getService(withType: ScoreServiceProtocol.self)

  scoreService?.getScore(appId: 2, token: "AAA.BBB.CCC"){ (result, error) in

    if result != nil {
      //Success!!! All went well.
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

The callback will pass the following value on completion:

=========== ================== ======
Value       Type               Meaning
=========== ================== ======
result      ScoreModelProtocol If non-null, the SDK was able to a score for the user
error       Error              If non-null, an error occurred
=========== ================== ======

The **ScoreModelProtocol** contains the following fields:

===== ======= =======
Field Type    Meaning
===== ======= =======
rank  Integer Users' current rank in the app
score Integer Users' current score in the app
===== ======= =======
