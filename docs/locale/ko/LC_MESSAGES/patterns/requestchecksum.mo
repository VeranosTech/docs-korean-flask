��          T               �      �   O   �      �          �  j  �  u  �     n  O   ~     �     �    h  j  n   Example usage:: Fortunately this is however very simple to change by wrapping the input stream. Request Content Checksums The following example calculates the SHA1 checksum of the incoming data as it gets read and stores it in the WSGI environment:: To use this, all you need to do is to hook the calculating stream in before the request starts consuming data.  (Eg: be careful accessing ``request.form`` or anything of that nature.  ``before_request_handlers`` for instance should be careful not to access it). Various pieces of code can consume the request data and preprocess it. For instance JSON data ends up on the request object already read and processed, form data ends up there as well but goes through a different code path.  This seems inconvenient when you want to calculate the checksum of the incoming request data.  This is necessary sometimes for some APIs. Project-Id-Version: Flask 1.0.x
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
 Example usage:: Fortunately this is however very simple to change by wrapping the input stream. Request Content Checksums The following example calculates the SHA1 checksum of the incoming data as it gets read and stores it in the WSGI environment:: To use this, all you need to do is to hook the calculating stream in before the request starts consuming data.  (Eg: be careful accessing ``request.form`` or anything of that nature.  ``before_request_handlers`` for instance should be careful not to access it). Various pieces of code can consume the request data and preprocess it. For instance JSON data ends up on the request object already read and processed, form data ends up there as well but goes through a different code path.  This seems inconvenient when you want to calculate the checksum of the incoming request data.  This is necessary sometimes for some APIs. 