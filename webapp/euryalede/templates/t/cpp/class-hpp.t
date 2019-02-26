%########################################################################
%# Copyright (c) 1988-2018 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: class-hpp.t
%#
%# Author: $author$
%#   Date: 4/1/2018
%########################################################################
%with(%
%extension,%(%else-then(%extension%,%(hpp)%)%)%,%
%Extension,%(%else-then(%Extension%,%(%extension%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%%(%
%///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%year()% $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: %Base%.%Extension%
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%
#define %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION%

%if-then(%parse(%Include%,%(,)%,,,,%(#include "%Include%"
)%,Include)%%parse(%Sys_include%,%(,)%,,,,%(#include <%Include%>
)%,Include)%,
)%%
%%Namespace_begin%%
%%if-no(%is_name%,,%(%if(%Extends%,%(%if(%Implements%,%(typedef %Implements% %NameT%Implements;
)%)%typedef %Extends% %NameT%Extends;
///////////////////////////////////////////////////////////////////////
///  Class: %NameT%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <%if(%Implements%,%(class TImplements = %NameT%Implements, )%)%class TExtends = %NameT%Extends>
)%)%class _EXPORT_CLASS %NameT%: %if(%Implements%,%(virtual public %TImplements%, )%)%public %TExtends% {
public:
    %if(%Implements%,%(typedef %TImplements% Implements;
    )%)%typedef %TExtends% Extends;

    %NameT%(const %NameT%& copy) {
    }
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
}; /// class _EXPORT_CLASS %NameT%
%if-no(%is_template%,,%(typedef %NameT%<> %Name%;
)%)%)%,%(%if(%Implements%,%(typedef %Implements% %NameT%Implements;
///////////////////////////////////////////////////////////////////////
///  Class: %NameT%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <class TImplements = %NameT%Implements>
)%)%class _EXPORT_CLASS %NameT%: virtual public %TImplements% {
public:
    typedef %TImplements% Implements;

    %NameT%(const %NameT%& copy) {
    }
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
}; /// class _EXPORT_CLASS %NameT%
%if-no(%is_template%,,%(typedef %NameT%<> %Name%;
)%)%)%,%(///////////////////////////////////////////////////////////////////////
///  Class: %NameT%
///////////////////////////////////////////////////////////////////////
%if-no(%is_template%,,%(template <class TClass = TBase>
)%)%class _EXPORT_CLASS %NameT% {
public:
    %NameT%(const %NameT%& copy) {
    }
    %NameT%() {
    }
    virtual ~%NameT%() {
    }
}; /// class _EXPORT_CLASS %NameT%
%if-no(%is_template%,,%(typedef %NameT%<> %Name%;
)%)%)%)%)%)%)%)%%Namespace_end%
#endif /// %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION% 
%
%)%)%