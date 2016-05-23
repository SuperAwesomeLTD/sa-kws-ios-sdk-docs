Errors
======

User has no parent email associated in KWS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When checking that the user is allowed remote notifications, if the SDK does not encounter a parent email, the following
delegate method will be called:

.. code-block:: swift

    func didFailBecauseKWSCouldNotFindParentEmail () {

    }

In this case, you'll then need to call the corresponding KWS email function:

.. code-block:: swift

    func didFailBecauseKWSCouldNotFindParentEmail () {
        let email = "example@mail.com"
        KWS.sdk.submitParentEmail(email);
    }

If all goes well, the preceding **isAllowedToRegisterForRemoteNotifications** function will get called and the process will go
on as usual.

User has no KWS permission for remote notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case a parental authority in KWS has disabled remote notification permission for this user, and
the following delegate method will get called:

.. code-block:: swift

    func didFailBecauseKWSDoesNotAllowRemoteNotificaitons () {
        // handle scenario
    }

User has explicitly disabled remote notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this case the user has explicitly denied permissions for remote notifications (either through the System popup or through the Settings panel).

In this case the following delegate method will get called:

.. code-block:: swift

    func didFailBecauseRemoteNotificationsAreDisabled () {
        // handle scenario
    }

Generic error
^^^^^^^^^^^^^

Sometimes due to different conditions (no network, invalid data, etc) the whole process might fail.

In this case the following delegate method will get called:

.. code-block:: swift

    func didFailBecauseOfError () {
        // handle scenario
    }
