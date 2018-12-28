@echo off
setlocal enabledelayedexpansion

set aloc="c:\gpumine\claymore\start_billionexpro_ETH.bat"
set bloc="c:\users\admin\dektop\claymore*\start_billionexpro_ETH.bat"
set cloc="c:\users\master\dektop\claymore*\start_billionexpro_ETH.bat"
set dloc="c:\users\bigfive\dektop\claymore*\start_billionexpro_ETH.bat"
set eloc="c:\users\bigfive\dektop\*\claymore*\start_billionexpro_ETH.bat"

set file=

if exist %aloc% ( 
	set file=%aloc%
) else (
	if exist %bloc% ( 
		set file=%bloc%
	) else (
		if exist %cloc% (
			set file=%cloc%
		) else (
			if exist %dloc% (
				set file=%dloc%
			) else (
				if exist %eloc% (
					set file=%eloc%
				) else (
					echo "FILE NOT FOUND (start_billionexpro_ETH.bat)"
				)
			)
		)
	)
)

set /a count=0

if not "%file%" == "" (
	for /f "tokens=* usebackq" %%f in (%file%) do (
		
		echo %%f|>nul findstr /L /C:"epool" && (

			echo %%f|>nul findstr /L /C:"eres" && (

				if "!count!" == "0" (
					echo %%f>%file%
				) else (
					echo %%f>>%file%
				)

			) || (

				set line=%%f -eres 0

			  	if "!count!" == "0" (
					echo !line!>%file%
				) else (
					echo !line!>>%file%
				)
			)

			set /a count+=1

		) || (

			if "!count!" == "0" (
				echo %%f>%file%
			) else (
				echo %%f>>%file%
			)

			set /a count+=1
		)
	)
)