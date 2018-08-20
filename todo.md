# Current Todo
* implement qv.secure [on hold] (doesnt work well on x32 arch)
* 
* implement account login
    - implement login authentication
        + (confirm session key) [priority] [in progress, db insert not working]
    - implement login cookie/session timeout and assign new cookie token [priority]
    - If origin of client change (IP), expire session, and force login again.[pending]
    - implement redirects after login
    
* implement user registration
    - validate signup form at clientside [later, important]
    - register confirmation queue
    - implement has password with qv.secure [on hold]
    - strengthening sign up data validation at back-end [important later]
    -
* implement sanitization and validation email [later]
    - isValidEmail
    - isStrongPassword(pass, PassStrength)
    - isLink
    - isUserName
* implement session authorised pages
    - decide on content accessible to public
    - use vibe.web.auth framework for session using authentication
    - use 
* Remove "final" keyword from switch statement to prevent server termination during error
* Log last login in db
* add last active column for checking ???
* add settings db table
* add tivs count under each category in discover page
* validate form input with regex
* wrap private funcs and vars in private{} block to make code clean
* figure out whether to store location only or name or coordinates and which to use for tracking, content prioritisation, and ad tracking [priority]
* replace all size_t data type in code with an alias for easy configuration
* successfully creating account, change class attribute of .status from error to success 
* Implement DB logging [important, later]
    - log signup action into db logs
* Extend signup validation to print messages in-line as well as show message for used email addresses

* Pagination
    - make clickable area cover whole box for each
    - implement pagination in index page for tivs
    - 


* implement user profile page [in-progress]
    - info section [yet to start]
    - fix tivs section css import issue [in progress]

# Bugs
* 

# Tips
* use input(type="file", name="file", size="50", maxlength="100000") for file inputs
* use logWarn("Failed to move file to destination folder: %s", e.msg);
        logInfo("Performing copy+delete instead.");
* Exceptions class is at import std.exception; ??
* ensure uploaded file is not null after retrieving from ref.files
        enforce(uploadedFile !is null, "No file uploaded!");


* sample auth definitin, also copy documentation
    
    // Defines the @auth attribute in terms of an @before annotation. @before causes
    // the given method (ensureAuth) to be called before the request handler is run.
    // It's return value will be passed to the "_authUser" parameter of the handler.
    private enum auth = before!ensureAuth("_authUser");

    // Implementation of the @auth attribute - ensures that the user is logged in and
    // redirects to the log in page otherwise (causing the actual request handler method
    // to be skipped).
    private string ensureAuth(scope HTTPServerRequest req, scope HTTPServerResponse res)
    {
        if (!SampleService.m_userSettings.loggedIn) redirect("/login");
        return SampleService.m_userSettings.userName;
    }
    
    // Adds support for using private member functions with "before". The ensureAuth method
    // is only used internally in this class and should be private, but by default external
    // template code has no access to private symbols, even if those are explicitly passed
    // to the template. This mixin template defined in vibe.web.web creates a special class
    // member that enables this usage pattern.
    mixin PrivateAccessProxy;
