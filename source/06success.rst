Success
=======

Success is signaled when the delegate calls the following methods:

.. code-block:: obj-c

    - (void) didRegisterForRemoteNotifications {
        // handle success
    }

    - (void) isAlreadyRegisteredForRemoteNotifications {
        // in case user is already registered for remote notifications
    }
