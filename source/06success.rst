Success
=======

Success is signaled when the delegate calls the following method:

.. code-block:: swift

    func didRegisterForRemoteNotifications() {
        // handle success
    }

    // or

    func isAlreadyRegisteredForRemoteNotifications () {
        // in case user is already registered for remote notifications
    }
