lcXLS = "c:\fox\test.xls"
lcTable = "c:\fox\test.dbf"
oExcel = createobject("Excel.Application")
with oExcel
	.DisplayAlerts = .F.
	.WorkBooks.Open(m.lcXLS)
	.ActiveWorkBook.SaveAs(m.lcTable,8)
	.ActiveWorkBook.Saved = .T.
	.Quit
EndWith
USE (m.lcTable)
browse