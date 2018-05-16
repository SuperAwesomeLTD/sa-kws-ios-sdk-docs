Associate a parent email
========================

You can associate a parent email for the user you're authenticated as by calling:

.. code-block:: objective-c

  [[KWSChildren sdk] updateParentEmail: @"parent@test.com"
                          withResponse: ^(KWSChildrenUpdateParentEmailStatus status)
  {
    switch (type) {
      case KWSChildren_UpdateParentEmail_Success:{
        break;
      }
      case KWSChildren_UpdateParentEmail_InvalidEmail: {
        break;
      }
      case KWSChildren_UpdateParentEmail_NetworkError:{
        break;
      }
    }
  }];

The callback will pass the following value on completion:

====== ================================== ======
Value  Type                               Meaning
====== ================================== ======
status KWSChildrenUpdateParentEmailStatus End status of the operation
====== ================================== ======

The **status** parameter may have the following values:

========================================== ======
Value                                      Meaning
========================================== ======
KWSChildren_UpdateParentEmail_Success      Submitted parent email successfully
KWSChildren_UpdateParentEmail_InvalidEmail Not a valid email
KWSChildren_UpdateParentEmail_NetworkError Other network error
========================================== ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

There's also a quick hand version of this method that displays a standard system popup to enable the user to submit an email:

.. code-block:: objective-c

  [[KWS sdk] updateParentEmailWithPopup:^(KWSChildrenUpdateParentEmailStatus status) {
	  // handle submit
  }];
