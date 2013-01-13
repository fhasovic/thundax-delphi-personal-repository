//  Copyright (c) 2012-2013, Jordi Corbilla
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  - Neither the name of this library nor the names of its contributors may be
//    used to endorse or promote products derived from this software without
//    specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

unit Testthundax.UMLDiagrams;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, thundax.UML, thundax.logging;

type
  // Test methods for class TUML

  TestTUML = class(TTestCase)
  strict private
    FUML: TUML;
    FUmlFileName: string;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestUMLDiagram;
  end;

implementation

uses
  SysUtils, Windows;

procedure TestTUML.SetUp;
begin
  FUmlFileName := 'TestDiagramUML';
  FUML := TUML.Start(FUmlFileName);
end;

procedure TestTUML.TearDown;
begin
  FUML.Free;
  FUML := nil;
end;

procedure TestTUML.TestUMLDiagram;
begin
  //Example Calling different imaginary methods
  if fileExists(FUmlFileName + '.sdx') then
    DeleteFile(PChar(FUmlFileName + '.sdx'));

  if fileExists(FUmlFileName + '.jpg') then
    DeleteFile(PChar(FUmlFileName + '.jpg'));

  FUML.Define('Server', 'TServer');
  FUML.Define('Proxy', 'TProxy');
  FUML.Define('Client1', 'TClient');
  FUML.Define('Client2', 'TClient');
  FUML.Define('Client3', 'TClient');
  FUML.Define();

  FUML.Call('Server','Proxy','start','');
  FUML.Call('Proxy','Client1','start','', 'STARTED');
  FUML.Call('Proxy','Client2','start','', 'STARTED');
  FUML.Call('Proxy','Client3','start','', 'STARTED');
  //Generating the diagram
  FUML.Convert;
  Sleep(2000); //give time the file to be generated
  CheckTrue(FileExists(FUmlFileName + '.jpg'), 'Error, File was not created');
end;

initialization
  RegisterTest(TestTUML.Suite);
end.
