%% Copyright (c) 2020 Guilherme Andrade
%%
%% Permission is hereby granted, free of charge, to any person obtaining a
%% copy  of this software and associated documentation files (the "Software"),
%% to deal in the Software without restriction, including without limitation
%% the rights to use, copy, modify, merge, publish, distribute, sublicense,
%% and/or sell copies of the Software, and to permit persons to whom the
%% Software is furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%% DEALINGS IN THE SOFTWARE.

%% @private
-module(tls_certificate_validation_pki).

-include_lib("public_key/include/OTP-PUB-KEY.hrl").

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export(
   [extract/1
   ]).

%% ------------------------------------------------------------------
%% Record and Type Definitions
%% ------------------------------------------------------------------

-type t() :: term().
-export_type([t/0]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

-spec extract(#'OTPCertificate'{}) -> t().
extract(Certificate) ->
    #'OTPCertificate'{tbsCertificate = TbsCertificate} = Certificate,
    #'OTPTBSCertificate'{subjectPublicKeyInfo = PKI} = TbsCertificate,
    PKI.
