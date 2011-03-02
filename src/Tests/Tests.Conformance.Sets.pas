(*
* Copyright (c) 2011, Ciobanu Alexandru
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the <organization> nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

unit Tests.Conformance.Sets;
interface
uses SysUtils,
     Tests.Conformance.Base,
     TestFramework,
     Generics.Collections,
     Collections.Base,
     Collections.Sets;

type
  TConformance_THashSet = class(TConformance_ISet)
  protected
    procedure SetUp_ISet(out AEmpty, AOne, AFull: ISet<NativeInt>; out AElements: TElements; out AOrdering: TOrdering); override;

  published
  end;

  TConformance_TLinkedSet = class(TConformance_ISet)
  published
  end;

  TConformance_TSortedSet = class(TConformance_ISet)
  published
  end;

  TConformance_TArraySet = class(TConformance_ISet)
  published
  end;

  TConformance_TBitSet = class(TConformance_ISet)
  published
  end;

implementation

{ TConformance_THashSet }

procedure TConformance_THashSet.SetUp_ISet(out AEmpty, AOne, AFull: ISet<NativeInt>; out AElements: TElements; out AOrdering: TOrdering);
var
  LItem: NativeInt;
begin
  AElements := GenerateUniqueRandomElements();
  AOrdering := oNone;

  AEmpty := THashSet<NativeInt>.Create();
  AOne := THashSet<NativeInt>.Create();
  AOne.Add(AElements[0]);
  AFull := THashSet<NativeInt>.Create();

  for LItem in AElements do
    AFull.Add(LItem);
end;

initialization
  RegisterTests('Conformance.Simple.Sets', [
    TConformance_THashSet.Suite,
    TConformance_TLinkedSet.Suite,
    TConformance_TSortedSet.Suite,
    TConformance_TArraySet.Suite,
    TConformance_TBitSet.Suite
  ]);

end.

