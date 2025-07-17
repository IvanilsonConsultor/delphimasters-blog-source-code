unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, System.Threading;

type
  TForm1 = class(TForm)
    ButtonBuscarDados: TButton;
    ButtonExecutarFeedback: TButton;
    ButtonExecutarTTask: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure ButtonBuscarDadosClick(Sender: TObject);
    procedure ButtonExecutarFeedbackClick(Sender: TObject);
    procedure ButtonExecutarTTaskClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscarDadosEmThread;
    procedure ExecutarTarefaComFeedback;
    procedure ExecutarComTTask;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Vcl.Dialogs;

{$R *.dfm}

{ TForm1 }

procedure TForm1.BuscarDadosEmThread;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      Resultado: string;
    begin
      Sleep(3000);
      Resultado := 'Dados carregados com sucesso';

      TThread.Synchronize(nil,
        procedure
        begin
          ShowMessage(Resultado);
        end
      );
    end
  ).Start;

end;

procedure TForm1.ButtonBuscarDadosClick(Sender: TObject);
begin
  BuscarDadosEmThread;
end;

procedure TForm1.ButtonExecutarFeedbackClick(Sender: TObject);
begin
  ExecutarTarefaComFeedback;
end;

procedure TForm1.ButtonExecutarTTaskClick(Sender: TObject);
begin
  ExecutarComTTask;
end;

procedure TForm1.ExecutarComTTask;
begin
  TTask.Run(
    procedure
    var
      Valor: Integer;
    begin
      Sleep(2000);
      Valor := 42;
      TThread.Synchronize(nil,
        procedure
        begin
          Label1.Caption := 'Resultado: ' + Valor.ToString;
        end
      );
    end
  );
end;

procedure TForm1.ExecutarTarefaComFeedback;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
    begin
      for i := 1 to 5 do
      begin
        Sleep(1000);
        TThread.Queue(nil,
          procedure
          begin
            Memo1.Lines.Add('Passo ' + i.ToString + ' concluído');
          end
        );
      end;
    end
  ).Start;
end;

end.
