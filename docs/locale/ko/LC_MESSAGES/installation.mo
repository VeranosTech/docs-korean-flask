��    )      d              �     �  H   �  9        I     _  m   l  @   �  \     f   x  w   �  F   W     �     �     �     �  7   �  9         Q     r     ~  �   �     <  J   K  l   �  m        q  �   �  m   C	    �	  M   �
  L     /   f  �   �  l   %  O   �  o   �  �   R  R   �  \   ;  S   �  u  �     b  H   {  9   �     �       m   !  @   �  \   �  f   -  w   �  F        S     a     t     {  7   �  9   �            !     -  �   C     �  J   �  l   G  m   �     "  �   7  m   �    b  M   |  L   �  /     �   G  l   �  O   C  o   �  �     R   �  \   �  S   I   Activate the environment Before you work on your project, activate the corresponding environment: Create a project folder and a :file:`venv` folder within: Create an environment Dependencies Flask is now installed. Check out the :doc:`/quickstart` or go to the :doc:`Documentation Overview </index>`. If you are on Mac OS X or Windows, download `get-pip.py`_, then: If you are using Python 2, the venv module is not available. Instead, install `virtualenv`_. If you needed to install virtualenv because you are using Python 2, use the following command instead: If you want to work with the latest Flask code before it's released, install or update the code from the master branch: If you're using Python 2, see :ref:`install-install-virtualenv` first. Install Flask Install virtualenv Installation Living on the edge Now you can return above and :ref:`install-create-env`. On Linux, virtualenv is provided by your package manager: On Windows, as an administrator: On Windows: Optional dependencies Python 3 comes bundled with the :mod:`venv` module to create virtual environments. If you're using a modern version of Python, you can continue on to the next section. Python Version These distributions will be installed automatically when installing Flask. These distributions will not be installed automatically. Flask will detect and use them if you install them. Use a virtual environment to manage the dependencies for your project, both in development and in production. Virtual environments Virtual environments are independent groups of Python libraries, one for each project. Packages installed for one project will not affect other projects or the operating system's packages. We recommend using the latest version of Python 3. Flask supports Python 3.4 and newer, Python 2.7, and PyPy. What problem does a virtual environment solve? The more Python projects you have, the more likely it is that you need to work with different versions of Python libraries, or even Python itself. Newer versions of libraries for one project can break compatibility in another project. Within the activated environment, use the following command to install Flask: Your shell prompt will change to show the name of the activated environment. `Blinker`_ provides support for :ref:`signals`. `Click`_ is a framework for writing command line applications. It provides the ``flask`` command and allows adding custom management commands. `ItsDangerous`_ securely signs data to ensure its integrity. This is used to protect Flask's session cookie. `Jinja`_ is a template language that renders the pages your application serves. `MarkupSafe`_ comes with Jinja. It escapes untrusted input when rendering templates to avoid injection attacks. `SimpleJSON`_ is a fast JSON implementation that is compatible with Python's ``json`` module. It is preferred for JSON operations if it is installed. `Watchdog`_ provides a faster, more efficient reloader for the development server. `Werkzeug`_ implements WSGI, the standard Python interface between applications and servers. `python-dotenv`_ enables support for :ref:`dotenv` when running ``flask`` commands. Project-Id-Version: Flask 1.0.x
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-01-08 10:39+0900
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ko
Language-Team: ko <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 Activate the environment Before you work on your project, activate the corresponding environment: Create a project folder and a :file:`venv` folder within: Create an environment Dependencies Flask is now installed. Check out the :doc:`/quickstart` or go to the :doc:`Documentation Overview </index>`. If you are on Mac OS X or Windows, download `get-pip.py`_, then: If you are using Python 2, the venv module is not available. Instead, install `virtualenv`_. If you needed to install virtualenv because you are using Python 2, use the following command instead: If you want to work with the latest Flask code before it's released, install or update the code from the master branch: If you're using Python 2, see :ref:`install-install-virtualenv` first. Install Flask Install virtualenv 설치 Living on the edge Now you can return above and :ref:`install-create-env`. On Linux, virtualenv is provided by your package manager: On Windows, as an administrator: On Windows: Optional dependencies Python 3 comes bundled with the :mod:`venv` module to create virtual environments. If you're using a modern version of Python, you can continue on to the next section. 파이썬 버전 These distributions will be installed automatically when installing Flask. These distributions will not be installed automatically. Flask will detect and use them if you install them. Use a virtual environment to manage the dependencies for your project, both in development and in production. Virtual environments Virtual environments are independent groups of Python libraries, one for each project. Packages installed for one project will not affect other projects or the operating system's packages. We recommend using the latest version of Python 3. Flask supports Python 3.4 and newer, Python 2.7, and PyPy. What problem does a virtual environment solve? The more Python projects you have, the more likely it is that you need to work with different versions of Python libraries, or even Python itself. Newer versions of libraries for one project can break compatibility in another project. Within the activated environment, use the following command to install Flask: Your shell prompt will change to show the name of the activated environment. `Blinker`_ provides support for :ref:`signals`. `Click`_ is a framework for writing command line applications. It provides the ``flask`` command and allows adding custom management commands. `ItsDangerous`_ securely signs data to ensure its integrity. This is used to protect Flask's session cookie. `Jinja`_ is a template language that renders the pages your application serves. `MarkupSafe`_ comes with Jinja. It escapes untrusted input when rendering templates to avoid injection attacks. `SimpleJSON`_ is a fast JSON implementation that is compatible with Python's ``json`` module. It is preferred for JSON operations if it is installed. `Watchdog`_ provides a faster, more efficient reloader for the development server. `Werkzeug`_ implements WSGI, the standard Python interface between applications and servers. `python-dotenv`_ enables support for :ref:`dotenv` when running ``flask`` commands. 