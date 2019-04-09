��    !      $              ,  <   -  ?   j     �     �     �     �  	   �  )        0  X  8  [  �  Y   �  �   G  h   �  s   K  #  �  T   �  B  8	  H   {
  "  �
     �  �        �  %  �  O   �  
  5  G   @    �  �   �  p   l    �  	   �  u  �  <   d  ?   �     �     �     	       	   3  )   =     g  X  o  [  �  Y   $  �   ~  h     s   �  #  �  T     B  o  H   �  "  �        �   8      �   %  �   O   #  
  l#  G   w%    �%  �   �&  p   �'    (  	   )   A basic FastCGI configuration for lighttpd looks like that:: A basic Flask FastCGI configuration for nginx looks like this:: Configuring Apache Configuring lighttpd Configuring nginx Creating a `.fcgi` file Debugging Different python interpreters being used. FastCGI FastCGI deployments tend to be hard to debug on most web servers.  Very often the only thing the server log tells you is something along the lines of "premature end of headers".  In order to debug the application the only thing that can really give you ideas why it breaks is switching to the correct user and executing the application by hand. FastCGI is a deployment option on servers like `nginx`_, `lighttpd`_, and `cherokee`_; see :doc:`uwsgi` and :doc:`wsgi-standalone` for other options. To use your WSGI application with any of them you will need a FastCGI server first. The most popular one is `flup`_ which we will use for this guide. Make sure to have it installed to follow along. First you need to create the FastCGI server file.  Let's call it `yourapplication.fcgi`:: If you cannot set ScriptAlias, for example on a shared web host, you can use WSGI middleware to remove yourapplication.fcgi from the URLs. Set .htaccess:: In this case the error seems to be "yourapplication" not being on the python path.  Common problems are: Installing FastCGI applications on nginx is a bit different because by default no FastCGI parameters are forwarded. Make sure to apply it only if you are mounting the application the URL root. Also, see the Lighty docs for more information on `FastCGI and Python <https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModFastCGI>`_ (note that explicitly passing a socket to run() is no longer necessary). Make sure to set the executable bit on that file so that the servers can execute it: Please make sure in advance that any ``app.run()`` calls you might have in your application file are inside an ``if __name__ == '__main__':`` block or moved to a separate file.  Just make sure it's not called because this will always start a local WSGI server which we do not want if we deploy that application to FastCGI. Relative paths being used.  Don't rely on the current working directory. Remember to enable the FastCGI, alias and rewrite modules. This configuration binds the application to ``/yourapplication``.  If you want the application to work in the URL root you have to work around a lighttpd bug with the :class:`~werkzeug.contrib.fixers.LighttpdCGIRootFix` middleware. Running FastCGI Processes Save the :file:`yourapplication.fcgi` file somewhere you will find it again. It makes sense to have that in :file:`/var/www/yourapplication` or something similar. Set yourapplication.fcgi:: Since nginx and others do not load FastCGI apps, you have to do it by yourself.  `Supervisor can manage FastCGI processes. <http://supervisord.org/configuration.html#fcgi-program-x-section-settings>`_ You can look around for other FastCGI process managers or write a script to run your `.fcgi` file at boot, e.g. using a SysV ``init.d`` script. For a temporary solution, you can always run the ``.fcgi`` script inside GNU screen.  See ``man screen`` for details, and note that this is a manual solution which does not persist across system restart:: The code depending on environment variables that are not set by the web server. The example above is good enough for a basic Apache deployment but your `.fcgi` file will appear in your application URL e.g. ``example.com/yourapplication.fcgi/news/``. There are few ways to configure your application so that yourapplication.fcgi does not appear in the URL. A preferable way is to use the ScriptAlias and SetHandler configuration directives to route requests to the FastCGI server. The following example uses FastCgiServer to start 5 instances of the application which will handle all incoming requests:: The path has to be the exact same path you define in the server config. These processes will be managed by Apache. If you're using a standalone FastCGI server, you can use the FastCgiExternalServer directive instead. Note that in the following the path is not real, it's simply used as an identifier to other directives such as AliasMatch:: This configuration binds the application to ``/yourapplication``.  If you want to have it in the URL root it's a bit simpler because you don't have to figure out how to calculate ``PATH_INFO`` and ``SCRIPT_NAME``:: This example assumes your application is called `application.fcgi` and that your web server user is `www-data`:: This is enough for Apache to work, however nginx and older versions of lighttpd need a socket to be explicitly passed to communicate with the FastCGI server.  For that to work you need to pass the path to the socket to the :class:`~flup.server.fcgi.WSGIServer`:: Watch Out Project-Id-Version: Flask 1.0.x
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
 A basic FastCGI configuration for lighttpd looks like that:: A basic Flask FastCGI configuration for nginx looks like this:: Configuring Apache Configuring lighttpd Configuring nginx Creating a `.fcgi` file Debugging Different python interpreters being used. FastCGI FastCGI deployments tend to be hard to debug on most web servers.  Very often the only thing the server log tells you is something along the lines of "premature end of headers".  In order to debug the application the only thing that can really give you ideas why it breaks is switching to the correct user and executing the application by hand. FastCGI is a deployment option on servers like `nginx`_, `lighttpd`_, and `cherokee`_; see :doc:`uwsgi` and :doc:`wsgi-standalone` for other options. To use your WSGI application with any of them you will need a FastCGI server first. The most popular one is `flup`_ which we will use for this guide. Make sure to have it installed to follow along. First you need to create the FastCGI server file.  Let's call it `yourapplication.fcgi`:: If you cannot set ScriptAlias, for example on a shared web host, you can use WSGI middleware to remove yourapplication.fcgi from the URLs. Set .htaccess:: In this case the error seems to be "yourapplication" not being on the python path.  Common problems are: Installing FastCGI applications on nginx is a bit different because by default no FastCGI parameters are forwarded. Make sure to apply it only if you are mounting the application the URL root. Also, see the Lighty docs for more information on `FastCGI and Python <https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModFastCGI>`_ (note that explicitly passing a socket to run() is no longer necessary). Make sure to set the executable bit on that file so that the servers can execute it: Please make sure in advance that any ``app.run()`` calls you might have in your application file are inside an ``if __name__ == '__main__':`` block or moved to a separate file.  Just make sure it's not called because this will always start a local WSGI server which we do not want if we deploy that application to FastCGI. Relative paths being used.  Don't rely on the current working directory. Remember to enable the FastCGI, alias and rewrite modules. This configuration binds the application to ``/yourapplication``.  If you want the application to work in the URL root you have to work around a lighttpd bug with the :class:`~werkzeug.contrib.fixers.LighttpdCGIRootFix` middleware. Running FastCGI Processes Save the :file:`yourapplication.fcgi` file somewhere you will find it again. It makes sense to have that in :file:`/var/www/yourapplication` or something similar. Set yourapplication.fcgi:: Since nginx and others do not load FastCGI apps, you have to do it by yourself.  `Supervisor can manage FastCGI processes. <http://supervisord.org/configuration.html#fcgi-program-x-section-settings>`_ You can look around for other FastCGI process managers or write a script to run your `.fcgi` file at boot, e.g. using a SysV ``init.d`` script. For a temporary solution, you can always run the ``.fcgi`` script inside GNU screen.  See ``man screen`` for details, and note that this is a manual solution which does not persist across system restart:: The code depending on environment variables that are not set by the web server. The example above is good enough for a basic Apache deployment but your `.fcgi` file will appear in your application URL e.g. ``example.com/yourapplication.fcgi/news/``. There are few ways to configure your application so that yourapplication.fcgi does not appear in the URL. A preferable way is to use the ScriptAlias and SetHandler configuration directives to route requests to the FastCGI server. The following example uses FastCgiServer to start 5 instances of the application which will handle all incoming requests:: The path has to be the exact same path you define in the server config. These processes will be managed by Apache. If you're using a standalone FastCGI server, you can use the FastCgiExternalServer directive instead. Note that in the following the path is not real, it's simply used as an identifier to other directives such as AliasMatch:: This configuration binds the application to ``/yourapplication``.  If you want to have it in the URL root it's a bit simpler because you don't have to figure out how to calculate ``PATH_INFO`` and ``SCRIPT_NAME``:: This example assumes your application is called `application.fcgi` and that your web server user is `www-data`:: This is enough for Apache to work, however nginx and older versions of lighttpd need a socket to be explicitly passed to communicate with the FastCGI server.  For that to work you need to pass the path to the socket to the :class:`~flup.server.fcgi.WSGIServer`:: Watch Out 