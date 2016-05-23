Process
=======

To check if remote notifications are allowed for the current user, you will need to call:

.. code-block:: swift

    KWS.sdk.checkIfNotificationsAreAllowed()

This will look at a number of conditions in order to determine if remote notifications are enabled:

* has the user enabled / disabled remote notifications on his device?
* has the user ever asked for remote notification permissions on his device?
* is the user allowed by his parent (in KWS) to receive remote notifications?
* does the user have a valid parent email (in KWS)?

If the process goes OK, the following function will get called:

.. code-block:: swift

    func isAllowedToRegisterForRemoteNotifications () {
        // continue ...
    }

In this function you'll need to then call the second SDK function:

.. code-block:: swift

    func isAllowedToRegisterForRemoteNotifications () {
        KWS.sdk.registerForRemoteNotifications ()
    }

After this step is through, remote notification will be enabled.
If the application asks for this permission the first time, then the general System pop-up will appear. If not,
the notifications will be silently enabled.

There are also multiple errors that can happen.
