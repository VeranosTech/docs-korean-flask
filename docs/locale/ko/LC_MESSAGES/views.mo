��    &      L              |  (   }  �  �     Y  i   i     �     �     �       �     �   �  �   �     �  U   �  ;        M     T     m     z     �  �  �     H
  �   \
  x   S  �   �  �   ~  �     <  �  2  �            ]  ,     �     �  
   �     �     �     �  u  �  (   @  �  i       i   ,     �     �     �     �  �   �  �   |  �   u     d  U   ~  ;   �               0     =     S  �  c       �     x     �   �  �   A  �   �  <  e  2  �      �"     �"  ]  �"     M$     ]$  
   i$     t$     |$     �$   And then you can register it like this:: As you can see what you have to do is to create a subclass of :class:`flask.views.View` and implement :meth:`~flask.views.View.dispatch_request`.  Then we have to convert that class into an actual view function by using the :meth:`~flask.views.View.as_view` class method.  The string you pass to that function is the name of the endpoint that view will then have.  But this by itself is not helpful, so let's refactor the code a bit:: Basic Principle Consider you have a function that loads a list of objects from the database and renders into a template:: Creates a new user Decorating Views Deletes a single user Description Due to the implicit self from the caller's perspective you cannot use regular view decorators on the individual methods of the view however, keep this in mind. Flask 0.7 introduces pluggable views inspired by the generic views from Django which are based on classes instead of functions.  The main intention is that you can replace parts of the implementations and this way have customizable pluggable views. For RESTful APIs it's especially helpful to execute a different function for each HTTP method.  With the :class:`flask.views.MethodView` you can easily do that.  Each HTTP method maps to a function with the same name (just in lowercase):: Gives a list of all users If you have a lot of APIs that look similar you can refactor that registration code:: Let's assume for the moment the view would look like this:: Method Method Based Dispatching Method Hints Method Views for APIs Pluggable Views Pluggable views are attached to the application like a regular function by either using :func:`~flask.Flask.route` or better :meth:`~flask.Flask.add_url_rule`.  That however also means that you would have to provide the names of the HTTP methods the view supports when you attach this.  In order to move that information to the class you can provide a :attr:`~flask.views.View.methods` attribute that has this information:: Shows a single user Since the view class itself is not the view function that is added to the routing system it does not make much sense to decorate the class itself. Instead you either have to decorate the return value of :meth:`~flask.views.View.as_view` by hand:: So how do we hook this up with the routing system?  By adding two rules and explicitly mentioning the methods for each:: So how would you go about doing that with the :class:`~flask.views.MethodView`?  The trick is to take advantage of the fact that you can provide multiple rules to the same view. Starting with Flask 0.8 there is also an alternative way where you can specify a list of decorators to apply in the class declaration:: That way you also don't have to provide the :attr:`~flask.views.View.methods` attribute.  It's automatically set based on the methods defined in the class. This is simple and flexible, but if you want to provide this view in a generic fashion that can be adapted to other models and templates as well you might want more flexibility.  This is where pluggable class-based views come into place.  As the first step to convert this into a class based view you would do this:: This of course is not that helpful for such a small example, but it's good enough to explain the basic principle.  When you have a class-based view the question comes up what ``self`` points to.  The way this works is that whenever the request is dispatched a new instance of the class is created and the :meth:`~flask.views.View.dispatch_request` method is called with the parameters from the URL rule.  The class itself is instantiated with the parameters passed to the :meth:`~flask.views.View.as_view` function. For instance you can write a class like this:: URL Updates a single user Web APIs are often working very closely with HTTP verbs so it makes a lot of sense to implement such an API based on the :class:`~flask.views.MethodView`.  That said, you will notice that the API will require different URL rules that go to the same method view most of the time.  For instance consider that you are exposing a user object on the web: ``/users/<id>`` ``/users/`` ``DELETE`` ``GET`` ``POST`` ``PUT`` Project-Id-Version: Flask 1.0.x
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-12-24 16:20+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ko
Language-Team: ko <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 And then you can register it like this:: As you can see what you have to do is to create a subclass of :class:`flask.views.View` and implement :meth:`~flask.views.View.dispatch_request`.  Then we have to convert that class into an actual view function by using the :meth:`~flask.views.View.as_view` class method.  The string you pass to that function is the name of the endpoint that view will then have.  But this by itself is not helpful, so let's refactor the code a bit:: Basic Principle Consider you have a function that loads a list of objects from the database and renders into a template:: Creates a new user Decorating Views Deletes a single user Description Due to the implicit self from the caller's perspective you cannot use regular view decorators on the individual methods of the view however, keep this in mind. Flask 0.7 introduces pluggable views inspired by the generic views from Django which are based on classes instead of functions.  The main intention is that you can replace parts of the implementations and this way have customizable pluggable views. For RESTful APIs it's especially helpful to execute a different function for each HTTP method.  With the :class:`flask.views.MethodView` you can easily do that.  Each HTTP method maps to a function with the same name (just in lowercase):: Gives a list of all users If you have a lot of APIs that look similar you can refactor that registration code:: Let's assume for the moment the view would look like this:: Method Method Based Dispatching Method Hints Method Views for APIs Pluggable Views Pluggable views are attached to the application like a regular function by either using :func:`~flask.Flask.route` or better :meth:`~flask.Flask.add_url_rule`.  That however also means that you would have to provide the names of the HTTP methods the view supports when you attach this.  In order to move that information to the class you can provide a :attr:`~flask.views.View.methods` attribute that has this information:: Shows a single user Since the view class itself is not the view function that is added to the routing system it does not make much sense to decorate the class itself. Instead you either have to decorate the return value of :meth:`~flask.views.View.as_view` by hand:: So how do we hook this up with the routing system?  By adding two rules and explicitly mentioning the methods for each:: So how would you go about doing that with the :class:`~flask.views.MethodView`?  The trick is to take advantage of the fact that you can provide multiple rules to the same view. Starting with Flask 0.8 there is also an alternative way where you can specify a list of decorators to apply in the class declaration:: That way you also don't have to provide the :attr:`~flask.views.View.methods` attribute.  It's automatically set based on the methods defined in the class. This is simple and flexible, but if you want to provide this view in a generic fashion that can be adapted to other models and templates as well you might want more flexibility.  This is where pluggable class-based views come into place.  As the first step to convert this into a class based view you would do this:: This of course is not that helpful for such a small example, but it's good enough to explain the basic principle.  When you have a class-based view the question comes up what ``self`` points to.  The way this works is that whenever the request is dispatched a new instance of the class is created and the :meth:`~flask.views.View.dispatch_request` method is called with the parameters from the URL rule.  The class itself is instantiated with the parameters passed to the :meth:`~flask.views.View.as_view` function. For instance you can write a class like this:: URL Updates a single user Web APIs are often working very closely with HTTP verbs so it makes a lot of sense to implement such an API based on the :class:`~flask.views.MethodView`.  That said, you will notice that the API will require different URL rules that go to the same method view most of the time.  For instance consider that you are exposing a user object on the web: ``/users/<id>`` ``/users/`` ``DELETE`` ``GET`` ``POST`` ``PUT`` 