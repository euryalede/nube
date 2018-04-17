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
%#   File: Exception-class-hpp.t
%#
%# Author: $author$
%#   Date: 4/16/2018
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
%typedef int %Enum_name%Status;
enum {%parse(%Enum_value%,;,,%(,)%,,%(
    %Enum_value%)%,Enum_value)%
};
template <class TString>
inline const char* %Enum_name%StatusToString(%Enum_name%Status status) {
    switch (status) {%parse(%Enum_value%,;,,,,%(
    case %Enum_value%: return TString("%Enum_value%");)%,Enum_value)%
    default: break;
    }
    return TString("Unknown");
}
///////////////////////////////////////////////////////////////////////
///  Class: %Enum_name%ExceptionT
///////////////////////////////////////////////////////////////////////
template 
<typename TStatus = %Enum_name%Status, 
 class TString = String, 
 class TImplements = Exception::Implements, 
 class TExtends = ExceptionT<TStatus, TString, TImplements> >

class _EXPORT_CLASS %Enum_name%ExceptionT: virtual public TImplements, public TExtends {
public:
    typedef TImplements Implements;
    typedef TExtends Extends;
    typedef %Enum_name%ExceptionT Derives;

    typedef TStatus status_t;
    typedef TString string_t;
    
    %Enum_name%ExceptionT(const status_t& status): Extends(status) {
    }
    %Enum_name%ExceptionT(const Derives &copy): Extends(copy.Status()) {
    }
    %Enum_name%ExceptionT(): Extends(%Enum_name%Failed) {
    }
    virtual ~%Enum_name%ExceptionT() {
    }

    virtual string_t StatusToString() const {
        return ExceptionStatusToString<string_t>(this->Status());
    }
};
typedef %Enum_name%ExceptionT<> %Enum_name%Exception;

typedef ImplementBase %Implements%TImplements;
///////////////////////////////////////////////////////////////////////
///  Class: %Implements%T
///////////////////////////////////////////////////////////////////////
template <class TImplements = %Implements%TImplements>
class _EXPORT_CLASS %Implements%T: virtual public TImplements {
public:
    typedef TImplements Implements;
};
typedef %Implements%T<> %Implements%;

typedef %Implements% %Name%TImplements;
%if(%Extends%,%(typedef %Extends% %Name%TExtends;
)%)%///////////////////////////////////////////////////////////////////////
///  Class: %Name%T
///////////////////////////////////////////////////////////////////////
template <class TImplements = %Name%TImplements, class TExtends = %Name%TExtends>
class _EXPORT_CLASS %Name%T: virtual public TImplements%if(%Extends%,%(, public TExtends)%)% {
public:
    typedef TImplements Implements;
    %if(%Extends%,%(typedef TExtends Extends;
)%)%
    %Name%T(const %Name%T &copy) {
    }
    %Name%T() {
    }
    virtual ~%Name%T() {
    }
};
typedef %Name%T<> %Name%;
%Namespace_end%
#endif /// %IFNDEF_DIRECTORY%_%BASE%_%EXTENSION% 
%
%)%)%