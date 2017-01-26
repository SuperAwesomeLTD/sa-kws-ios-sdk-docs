Associate a parent email
========================

You can associate a parent email for the user you're authenticated as by calling:

.. code-block:: objective-c

  [[KWS sdk] submitParentEmail:@"parent@test.com"
                   andResponse:^(KWSParentEmailStatus status)
  {
    switch (type) {
      case KWSParentEmail_Success:{
        break;
      }
      case KWSParentEmail_Invalid: {
        break;
      }
      case KWSParentEmail_NetworkError:{
        break;
      }
    }
  }];

The callback will pass the following value on completion:

====== ==================== ======
Value                       Type Meaning
====== ==================== ======
status KWSParentEmailStatus End status of the operation
====== ==================== ======

The **status** parameter may have the following values:

=========================== ======
Value                       Meaning
=========================== ======
KWSParentEmail_Success      Submitted parent email successfully
KWSParentEmail_Invalid      Not a valid email
KWSParentEmail_NetworkError Other network error
=========================== ======

.. note::

  Once the parent email is successfully submitted you'll be able to request permissions.

There's also a quick hand version of this method that displays a standard system popup to enable the user to submit an email:

.. code-block:: objective-c

  [[KWS sdk] submitParentEmailWithPopup:^(KWSParentEmailStatus status) {
	  // handle submit
  }];
