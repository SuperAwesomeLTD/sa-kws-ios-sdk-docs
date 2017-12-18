Trigger event
=============

Kids Web Services allows you to define custom events in the Control Panel through which you can add or subtract points for users.

Events are defined on a per-app basis.

.. image:: img/control-panel-events.png

You can trigger an event for the user you're authenticated as by calling:

.. code-block:: objective-c

  [[KWSChildren sdk] triggerEvent: @"custom-event-30-points"
                       withPoints: 20
                      andResponse: ^(BOOL success) {
    // handle success
  }];

The method has the following parameters:

=========== ======= =======
Parameter   Type    Meaning
=========== ======= =======
event       String  The event code, as defined in the Control Panel
points      Integer Optional number of points to be awarded
=========== ======= =======

The callback will pass the following value on completion:

======= ==== =======
Value   Type Meaning
======= ==== =======
success Bool wether the network operation succeeded
======= ==== =======
