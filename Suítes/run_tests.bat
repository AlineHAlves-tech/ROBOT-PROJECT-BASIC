@echo off

:: Defina o diretório onde os testes estão localizados
set TESTS_DIR=.\Suítes
:: Defina o diretório onde os relatórios serão armazenados
set RESULTADOS_DIR=.\Resultados

:: Cria o diretório de resultados, se não existir
if not exist "%RESULTADOS_DIR%" mkdir "%RESULTADOS_DIR%"

:: Gera a data e hora atual para usar no nome do diretório
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set DATE=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%

:: Define o diretório de saída
set OUTPUT_DIR=%RESULTADOS_DIR%\%DATE%

:: Cria o subdiretório para essa execução de teste
mkdir "%OUTPUT_DIR%"

:: Executa o Robot Framework com as opções necessárias
robot --outputdir "%OUTPUT_DIR%" --output "%OUTPUT_DIR%\output.xml" --log "%OUTPUT_DIR%\log.html" --report "%OUTPUT_DIR%\report.html" "%TESTS_DIR%"

:: Exibe uma mensagem de conclusão
echo Testes concluídos. Relatórios salvos em: %OUTPUT_DIR%
