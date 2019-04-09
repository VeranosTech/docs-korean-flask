��    ;      �              �  0  �  �   �  �     k  >    �  K  �  �   �	  G   �
     �
     �
     �
       �   #     �  ,  �  �   �  8  x     �     �  �   �     l  r   z  �   �  �   �  =  ~  i   �  �   &  R   �  �      �   �  |  �  �   5  U  �  �   <  �   �  q   �  j     �   q  v   J  i   �  �   +  �   �  �   �  �   l  �      �   �   �   �!  =   K"    �"  V   �#  �   �#     �$     �$     �$     �$     %     '%     <%  u  V%  0  �&  �   �'  �   ~(  k  =)    �*  K  �+  �   �,  G   �-     �-     �-     �-     .  �   ".     �.  ,  �.  �   �/  8  w0     �1     �1  �   �1     k2  r   y2  �   �2  �   �3  =  }4  i   �5  �   %6  R   �6  �   7  �   �7  |  �8  �   4:  U  �:  �   ;<  �   �<  q   �=  j   >  �   p>  v   I?  i   �?  �   *@  �   �@  �   �A  �   kB  �   C  �   �C  �   �D  =   JE    �E  V   �F  �   �F     �G     �G     �G     �G     H     &H     ;H   :attr:`~Response.data` contains the body of the response as bytes. If you expect a certain value to render on the page, check that it's in ``data``. Bytes must be compared to bytes. If you want to compare Unicode text, use :meth:`get_data(as_text=True) <werkzeug.wrappers.BaseResponse.get_data>` instead. :attr:`~Response.headers` will have a ``Location`` header with the login URL when the register view redirects to the login view. :data:`TESTING` tells Flask that the app is in test mode. Flask changes some internal behavior so it's easier to test, and other extensions can also use the flag to make testing them easier. :func:`tempfile.mkstemp` creates and opens a temporary file, returning the file object and the path to it. The ``DATABASE`` path is overridden so it points to this temporary path instead of the instance folder. After setting the path, the database tables are created and the test data is inserted. After the test is over, the temporary file is closed and removed. :meth:`client.get() <werkzeug.test.Client.get>` makes a ``GET`` request and returns the :class:`Response` object returned by Flask. Similarly, :meth:`client.post() <werkzeug.test.Client.post>` makes a ``POST`` request, converting the ``data`` dict into form data. A user must be logged in to access the ``create``, ``update``, and ``delete`` views. The logged in user must be the author of the post to access ``update`` and ``delete``, otherwise a ``403 Forbidden`` status is returned. If a ``post`` with the given ``id`` doesn't exist, ``update`` and ``delete`` should return ``404 Not Found``. All the blog views use the ``auth`` fixture you wrote earlier. Call ``auth.login()`` and subsequent requests from the client will be logged in as the ``test`` user. An HTML report allows you to see which lines were covered in each file: Authentication Blog Continue to :doc:`deploy`. Database Each test will create a new temporary database file and populate some data that will be used in the tests. Write a SQL file to insert that data. Factory For most of the views, a user needs to be logged in. The easiest way to do this in tests is to make a ``POST`` request to the ``login`` view with the client. Rather than writing that out every time, you can write a class with methods to do that, and use a fixture to pass it the client for each test. If any tests fail, pytest will show the error that was raised. You can run ``pytest -v`` to get a list of each test function rather than dots. Pytest uses fixtures by matching their function names with the names of arguments in the test functions. For example, the ``test_hello`` function you'll write next takes a ``client`` argument. Pytest matches that with the ``client`` fixture function, calls it, and passes the returned value to the test function. Running the Tests Setup and Fixtures Some extra configuration, which is not required but makes running tests with coverage less verbose, can be added to the project's ``setup.cfg`` file. Test Coverage Testing ``logout`` is the opposite of ``login``. :data:`session` should not contain ``user_id`` after logging out. The ``app`` fixture will call the factory and pass ``test_config`` to configure the application and database for testing instead of using your local development configuration. The ``client`` fixture calls :meth:`app.test_client() <Flask.test_client>` with the application object created by the ``app`` fixture. Tests will use the client to make requests to the application without running the server. The ``create`` and ``update`` views should render and return a ``200 OK`` status for a ``GET`` request. When valid data is sent in a ``POST`` request, ``create`` should insert the new post data into the database, and ``update`` should modify the existing data. Both pages should show an error message on invalid data. The ``delete`` view should redirect to the index URL and the post should no longer exist in the database. The ``index`` view should display information about the post that was added with the test data. When logged in as the author, there should be a link to edit the post. The ``init-db`` command should call the ``init_db`` function and output a message. The ``register`` view should render successfully on ``GET``. On ``POST`` with valid form data, it should redirect to the login URL and the user's data should be in the database. Invalid data should display error messages. The ``runner`` fixture is similar to ``client``. :meth:`app.test_cli_runner() <Flask.test_cli_runner>` creates a runner that can call the Click commands registered with the application. The closer you get to 100% coverage, the more comfortable you can be that making a change won't unexpectedly change other behavior. However, 100% coverage doesn't guarantee that your application doesn't have bugs. In particular, it doesn't test how the user interacts with the application in the browser. Despite this, test coverage is an important tool to use during development. The only behavior that can change is passing test config. If config is not passed, there should be some default configuration, otherwise the configuration should be overridden. The test code is located in the ``tests`` directory. This directory is *next to* the ``flaskr`` package, not inside it. The ``tests/conftest.py`` file contains setup functions called *fixtures* that each test will use. Tests are in Python modules that start with ``test_``, and each test function in those modules also starts with ``test_``. The tests for the ``login`` view are very similar to those for ``register``. Rather than testing the data in the database, :data:`session` should have ``user_id`` set after logging in. There's not much to test about the factory itself. Most of the code will be executed for each test already, so if something fails the other tests will notice. This generates files in the ``htmlcov`` directory. Open ``htmlcov/index.html`` in your browser to see the report. This is being introduced late in the tutorial, but in your future projects you should test as you develop. This test uses Pytest's ``monkeypatch`` fixture to replace the ``init_db`` function with one that records that it's been called. The ``runner`` fixture you wrote above is used to call the ``init-db`` command by name. To measure the code coverage of your tests, use the ``coverage`` command to run pytest instead of running it directly. To run the tests, use the ``pytest`` command. It will find and run all the test functions you've written. To test that the page renders successfully, a simple request is made and checked for a ``200 OK`` :attr:`~Response.status_code`. If rendering failed, Flask would return a ``500 Internal Server Error`` code. Using ``client`` in a ``with`` block allows accessing context variables such as :data:`session` after the response is returned. Normally, accessing ``session`` outside of a request would raise an error. With the ``auth`` fixture, you can call ``auth.login()`` in a test to log in as the ``test`` user, which was inserted as part of the test data in the ``app`` fixture. Within an application context, ``get_db`` should return the same connection each time it's called. After the context, the connection should be closed. Writing unit tests for your application lets you check that the code you wrote works the way you expect. Flask provides a test client that simulates requests to the application and returns the response data. You added the ``hello`` route as an example when writing the factory at the beginning of the tutorial. It returns "Hello, World!", so the test checks that the response data matches. You can also test some more authentication behavior while testing the ``index`` view. When not logged in, each page shows links to log in or register. When logged in, there's a link to log out. You can either view a simple coverage report in the terminal: You should test as much of your code as possible. Code in functions only runs when the function is called, and code in branches, such as ``if`` blocks, only runs when the condition is met. You want to make sure that each function is tested with data that covers each branch. You'll use `pytest`_ and `coverage`_ to test and measure your code. Install them both: ``pytest.mark.parametrize`` tells Pytest to run the same test function with different arguments. You use it here to test different invalid input and error messages without writing the same code three times. ``setup.cfg`` ``tests/conftest.py`` ``tests/data.sql`` ``tests/test_auth.py`` ``tests/test_blog.py`` ``tests/test_db.py`` ``tests/test_factory.py`` Project-Id-Version: Flask 1.0.x
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
 :attr:`~Response.data` contains the body of the response as bytes. If you expect a certain value to render on the page, check that it's in ``data``. Bytes must be compared to bytes. If you want to compare Unicode text, use :meth:`get_data(as_text=True) <werkzeug.wrappers.BaseResponse.get_data>` instead. :attr:`~Response.headers` will have a ``Location`` header with the login URL when the register view redirects to the login view. :data:`TESTING` tells Flask that the app is in test mode. Flask changes some internal behavior so it's easier to test, and other extensions can also use the flag to make testing them easier. :func:`tempfile.mkstemp` creates and opens a temporary file, returning the file object and the path to it. The ``DATABASE`` path is overridden so it points to this temporary path instead of the instance folder. After setting the path, the database tables are created and the test data is inserted. After the test is over, the temporary file is closed and removed. :meth:`client.get() <werkzeug.test.Client.get>` makes a ``GET`` request and returns the :class:`Response` object returned by Flask. Similarly, :meth:`client.post() <werkzeug.test.Client.post>` makes a ``POST`` request, converting the ``data`` dict into form data. A user must be logged in to access the ``create``, ``update``, and ``delete`` views. The logged in user must be the author of the post to access ``update`` and ``delete``, otherwise a ``403 Forbidden`` status is returned. If a ``post`` with the given ``id`` doesn't exist, ``update`` and ``delete`` should return ``404 Not Found``. All the blog views use the ``auth`` fixture you wrote earlier. Call ``auth.login()`` and subsequent requests from the client will be logged in as the ``test`` user. An HTML report allows you to see which lines were covered in each file: Authentication Blog Continue to :doc:`deploy`. Database Each test will create a new temporary database file and populate some data that will be used in the tests. Write a SQL file to insert that data. Factory For most of the views, a user needs to be logged in. The easiest way to do this in tests is to make a ``POST`` request to the ``login`` view with the client. Rather than writing that out every time, you can write a class with methods to do that, and use a fixture to pass it the client for each test. If any tests fail, pytest will show the error that was raised. You can run ``pytest -v`` to get a list of each test function rather than dots. Pytest uses fixtures by matching their function names with the names of arguments in the test functions. For example, the ``test_hello`` function you'll write next takes a ``client`` argument. Pytest matches that with the ``client`` fixture function, calls it, and passes the returned value to the test function. Running the Tests Setup and Fixtures Some extra configuration, which is not required but makes running tests with coverage less verbose, can be added to the project's ``setup.cfg`` file. Test Coverage Testing ``logout`` is the opposite of ``login``. :data:`session` should not contain ``user_id`` after logging out. The ``app`` fixture will call the factory and pass ``test_config`` to configure the application and database for testing instead of using your local development configuration. The ``client`` fixture calls :meth:`app.test_client() <Flask.test_client>` with the application object created by the ``app`` fixture. Tests will use the client to make requests to the application without running the server. The ``create`` and ``update`` views should render and return a ``200 OK`` status for a ``GET`` request. When valid data is sent in a ``POST`` request, ``create`` should insert the new post data into the database, and ``update`` should modify the existing data. Both pages should show an error message on invalid data. The ``delete`` view should redirect to the index URL and the post should no longer exist in the database. The ``index`` view should display information about the post that was added with the test data. When logged in as the author, there should be a link to edit the post. The ``init-db`` command should call the ``init_db`` function and output a message. The ``register`` view should render successfully on ``GET``. On ``POST`` with valid form data, it should redirect to the login URL and the user's data should be in the database. Invalid data should display error messages. The ``runner`` fixture is similar to ``client``. :meth:`app.test_cli_runner() <Flask.test_cli_runner>` creates a runner that can call the Click commands registered with the application. The closer you get to 100% coverage, the more comfortable you can be that making a change won't unexpectedly change other behavior. However, 100% coverage doesn't guarantee that your application doesn't have bugs. In particular, it doesn't test how the user interacts with the application in the browser. Despite this, test coverage is an important tool to use during development. The only behavior that can change is passing test config. If config is not passed, there should be some default configuration, otherwise the configuration should be overridden. The test code is located in the ``tests`` directory. This directory is *next to* the ``flaskr`` package, not inside it. The ``tests/conftest.py`` file contains setup functions called *fixtures* that each test will use. Tests are in Python modules that start with ``test_``, and each test function in those modules also starts with ``test_``. The tests for the ``login`` view are very similar to those for ``register``. Rather than testing the data in the database, :data:`session` should have ``user_id`` set after logging in. There's not much to test about the factory itself. Most of the code will be executed for each test already, so if something fails the other tests will notice. This generates files in the ``htmlcov`` directory. Open ``htmlcov/index.html`` in your browser to see the report. This is being introduced late in the tutorial, but in your future projects you should test as you develop. This test uses Pytest's ``monkeypatch`` fixture to replace the ``init_db`` function with one that records that it's been called. The ``runner`` fixture you wrote above is used to call the ``init-db`` command by name. To measure the code coverage of your tests, use the ``coverage`` command to run pytest instead of running it directly. To run the tests, use the ``pytest`` command. It will find and run all the test functions you've written. To test that the page renders successfully, a simple request is made and checked for a ``200 OK`` :attr:`~Response.status_code`. If rendering failed, Flask would return a ``500 Internal Server Error`` code. Using ``client`` in a ``with`` block allows accessing context variables such as :data:`session` after the response is returned. Normally, accessing ``session`` outside of a request would raise an error. With the ``auth`` fixture, you can call ``auth.login()`` in a test to log in as the ``test`` user, which was inserted as part of the test data in the ``app`` fixture. Within an application context, ``get_db`` should return the same connection each time it's called. After the context, the connection should be closed. Writing unit tests for your application lets you check that the code you wrote works the way you expect. Flask provides a test client that simulates requests to the application and returns the response data. You added the ``hello`` route as an example when writing the factory at the beginning of the tutorial. It returns "Hello, World!", so the test checks that the response data matches. You can also test some more authentication behavior while testing the ``index`` view. When not logged in, each page shows links to log in or register. When logged in, there's a link to log out. You can either view a simple coverage report in the terminal: You should test as much of your code as possible. Code in functions only runs when the function is called, and code in branches, such as ``if`` blocks, only runs when the condition is met. You want to make sure that each function is tested with data that covers each branch. You'll use `pytest`_ and `coverage`_ to test and measure your code. Install them both: ``pytest.mark.parametrize`` tells Pytest to run the same test function with different arguments. You use it here to test different invalid input and error messages without writing the same code three times. ``setup.cfg`` ``tests/conftest.py`` ``tests/data.sql`` ``tests/test_auth.py`` ``tests/test_blog.py`` ``tests/test_db.py`` ``tests/test_factory.py`` 