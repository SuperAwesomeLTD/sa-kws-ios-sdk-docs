Errors
======

User has no parent email associated in KWS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When checking that the user is allowed remote notifications, if the SDK does not encounter a parent email, the following
delegate method will be called:

.. code-block:: obj-c

    - (void) didFailBecauseKWSCouldNotFindParentEmail {

    }

In this case, you'll then need to call the corresponding KWS email function:

.. code-block:: obj-c

    - (void) didFailBecauseKWSCouldNotFindParentEmail {
        NSString *email = @"example@parent.com";
        [[KWS sdk] submitParentEmail:email];
    }

If all goes well, the preceding **isAllowedToRegisterForRemoteNotifications** function will get called and the process will go
on as usual.

User has no KWS permission for remote notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case a parental authority in KWS has disabled remote notification permission for this user, and
the following delegate method will get called:

.. code-block:: obj-c

    - (void) didFailBecauseKWSDoesNotAllowRemoteNotifications {
        // handle scenario
    }

In the background, the SDK will also call

.. code-block:: obj-c

    [[UIApplication sharedApplication] unregisterForRemoteNotifications];

to unregister a user from receiving notifications.

User has explicitly disabled remote notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case the user has explicitly denied permissions for remote notifications (either through the System popup or through the Settings panel).

In this case the following delegate method will get called:

.. code-block:: obj-c

    - (void) didFailBecauseRemoteNotificationsAreDisabled {
        // handle scenario
    }

This might be a good moment to inform your user that he might want to go to the apps Settings page and enable notifications.

Generic error
^^^^^^^^^^^^^

Sometimes due to different conditions (no network, invalid data, etc) the whole process might fail.

In this case the following delegate method will get called:

.. code-block:: obj-c

    - (void) didFailBecauseOfError {
        // handle scenario
    } 
