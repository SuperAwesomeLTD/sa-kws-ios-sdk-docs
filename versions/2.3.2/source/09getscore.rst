Get score
=========

You can get the current score of the use you're authenticated as by calling:

.. code-block:: objective-c

  [[KWSChildren sdk] getScore: ^(KWSScore *score) {
    // handle score
  }];

The callback will pass the following value on completion:

======= ======== ======
Value   Type     Meaning
======= ======== ======
score   KWSScore If non-null, contains info about a user's current app score
======= ======== ======

The **KWSScore** object contains the following fields:

===== ======= =======
Field Type    Meaning
===== ======= =======
rank  Integer Users' current rank in the app
score Integer Users' current score in the app
===== ======= =======
