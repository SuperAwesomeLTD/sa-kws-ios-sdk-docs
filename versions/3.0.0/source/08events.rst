Events
======

Kids Web Services allows you to define custom events in the Control Panel through which you can add or subtract points for users.

Events are defined on a per-app basis.

.. image:: img/control-panel-events.png

After creating an event, it should look like this:

.. image:: img/checkevent.png

Trigger event
-------------

You can trigger an event for the user you're authenticated as by using **UserActionsServiceProtocol** and calling:

* **triggerEvent**

It will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
eventId     String  The event id, as defined in the Control Panel
points      Integer The number of points to be awarded
userdId     Integer The authenticated user id
token       String  The authenticated user token
=========== ======= =======

.. note::

	Please note that this **eventId** is the **event code**. 

	From the example image, it will be **custom-event-30-points**.

And look like this:

.. code-block:: java

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userActionsService = sdk.getService(withType: UserActionsServiceProtocol.self)

  //your event code as per the Control Panel
  let eventId = "custom-event-30-points"
   
  //the number of points to award
  let points = 30

  userActionsService?.triggerEvent(eventId: eventId, points: points, userId: 123, token: "AAA.BBB.CCC" ){ (error) in

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


Check event
-----------

You can check if an event has been triggered by using **IUserActionsService** and calling:

* **hasTriggeredEvent**

It will take:

=========== ======= =======
Field       Type    Meaning
=========== ======= =======
eventId     Integer The event id, as defined in the Control Panel
points      Integer The number of points to be awarded
userdId     Integer The authenticated user id
token       String  The authenticated user token
=========== ======= =======

.. note::

	Please note that this **eventId** is the **event id**. 

	From the example image, it will be **808**.

And look like this:

.. code-block:: swift

  let myEnvironment = MyEnvironment()
  let sdk = ComplianceSDK(withEnvironment: myEnvironment!)
  let userActionsService = sdk.getService(withType: UserActionsServiceProtocol.self)

  //your event id as per the Control Panel
  let eventId = 808

  userActionsService?.hasTriggeredEvent(eventId: eventId, userId: userId, token: token){ (result, error) in

    if result != nil {
      //Success!!! All went well.
    } else {
      //Uh-oh! It seems there's an error...
    }
  }

The callback will pass the following values on completion:

======= =============================== ======
Value   Type                            Meaning
======= =============================== ======
result  HasTriggeredEventModelProtocol  If non-null, the SDK was able to validate if an event has been triggered
error   Error                           If non-null, an error occurred
======= =============================== ======

The **HasTriggeredEventModelProtocol** object has the following fields:

================= ======== =======
Field             Type     Meaning
================= ======== =======
hasTriggeredEvent Boolean  Unique Id of the user
name              String   Username for this app only
================= ======== =======