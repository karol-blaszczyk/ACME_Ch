# Thought process

Take Rail in api mode (remove unnecessary files), rails was fastest to prototype

Added simple auth logic

```
Simple, multi-client and secure token-based authentication for Rails.

If you're building SPA or a mobile app, and you want authentication, you need tokens, not cookies. This gem refreshes the tokens on each request, and expires them in a short time, so the app is secure. Also, it maintains a session for each client/device, so you can have as many sessions as you want.
```


USER_CLASS
User
The name of the class to use for user authentication

MOUNT_PATH
auth
The path at which to mount the authentication routes

