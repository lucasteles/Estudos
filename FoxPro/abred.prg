LPARAMETERS cDrive
abredisk(PADL(UPPER(cDrive),1)+":")

FUNCTION ABREDISK(_UNIDAD)
	DECLARE integer mciSendString IN WINMM.DLL string, string, integer,integer
	m.CDDrive = _UNIDAD
	mciSendString('Opem '+m.CDDrive+' type CDAudio alias CD', Null, 0, 0)
	mciSendString('Set CD door open wait', Null, 0, 0)
