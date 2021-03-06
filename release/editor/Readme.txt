Symbian Text Editor Application v1.41(049)
==========================================
Copyright (c) 1998-2001 Symbian Ltd. All rights reserved.

DISCLAIMER OF WARRANTY
======================
SYMBIAN PROVIDES NO WARRANTY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHERE OTHERWISE STATED IN WRITING, SYMBIAN PROVIDES THIS SOFTWARE AND/OR DOCUMENTATION "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THIS SOFTWARE AND/OR DOCUMENTATION IS LICENSED TO YOU WITHOUT FEE AND ACCORDINGLY YOU ACCEPT THAT THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE AND/OR DOCUMENTATION IS WITH YOU AND YOU AGREE NOT TO TAKE ANY INCONSISTENT POSITION. SHOULD THE SOFTWARE AND/OR DOCUMENTATION PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION OF THE SOFTWARE AND/OR DOCUMENTATION AND OF ANY PRODUCT OR APPLICATION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW WILL SYMBIAN BE LIABLE TO YOU FOR DAMAGES, (WHETHER ARISING IN CONTRACT, TORT, NEGLIGENCE OR OTHERWISE) INCLUDING ANY LOST PROFITS, LOST MONIES, LOST TIME, LOSSES ATTRIBUTABLE IN WHOLE OR PART TO ANY DEFECTS IN THE DESIGN OR PERFORMANCE OF THE SOFTWARE AND/OR DOCUMENTATION OR ANY PRODUCT OR APPLICATION, OR SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE SOFTWARE AND/OR DOCUMENTATION (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY THIRD PARTIES OR A FAILURE OF THE SDK TO OPERATE WITH PROGRAMS NOT DISTRIBUTED BY SYMBIAN), EVEN IF SYMBIAN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES, OR FOR ANY CLAIM BY ANY OTHER PARTY. NOTHING IN THIS AGREEMENT LIMITS SYMBIAN'S LIABILITY FOR DEATH OR PERSONAL INJURY CAUSED BY ITS NEGLIGENCE.

File Listing
============
The following files should have been included with this distribution:

Readme.txt				This text file
Editor (Black & White).sis	MARM installation of the Editor application for Black & White devices
Editor (Colour).sis		MARM installation of the Editor application for Black & White devices
EditorW.zip				WINS release of the Editor (zip file includes paths for easy extraction)

About This Software
===================
This application is a plain text editor EPOC. It originally started life as an internal Symbian tool. With the advent of ER5 and Java it became clear some 3rd party developers who were members of the Symbian Developer Network (www.SymbianDevNet.com) would find a text editor useful for editing their Java code under EPOC. The application was therefore tidied up and made available for release.

This software has been tested under both ER3 and ER5 and no major problems have been found. ER3 users should not that no file recognizer is supplied at the moment, so .TXT files will not get associated with Editor. Under ER5, Editor recognises text files by MIME so you *will* be able to double-tap them from System, for example, to edit them.

Installation Instructions
=========================
For MARM, simply copy the Editor.sis file to your EPOC device and double tap it. The installer technologies should take care of the rest.

Under WINS, extract the contents of EditorW.zip onto your SDK drive, ensuring you have the option enabled in your unzipper which will 'restore paths' (or similar).

Editor has been tested on the Psion Series 5mx, Psion Revo and ER5 WINS emulator. Whilst not tested on other devices, it should run without issue on any machine running ER1-ER5.

Known Issues/Omissions
======================
1. There is no Help file included with this release.

Future plans
============
Although Editor is being released as an unsupported tool, the Symbian Developer Network will do its best to maintain and enhance it as time permits. Along those lines, we would *like* to add the following features to future versions, but there is no guarantee that any of these will definitely be implemented:

1. Address the above issues
2. Add an option to display the current line and column number
3. Add a 'Go to line' option

History
=======
- v1.41(049)	03 September 2001	* Changes to improve Editor's interaction with some third party
						FEP (Front End Processor) software.

						* Fix defect of first two Recent files items always opening the
						same document.

- v1.40(048)	19 June 2001	* Fixed defect (STORE-1 panic) when using filenames longer than
						100 characters (at the same time fixing a panic for the Recent
						files menu when using filenames longer than 80 characters)
						
						* All file dialogs now obey the "Show 'System' files" preference
						(instead of just the Open dialog as was previously the case)

- v1.38(046)	12 January 2001	* Added a very basic text file recognizer for devices running
						EPOC Releases 1 through 4. Any file with a .TXT extension
						should now open in Editor when tapped in System.

						* Editor will now have a toolbar like the ROM applications on
						the netBook/Series 7 (including battery meter).

						* Further fix for Editor closing Data files down when it exited.

- v1.37(044)	24 July 2000	* If there's an error when opening/saving a file, Editor
						no longer leaves a temp file called "Editor.tmp" behind.

- v1.36(043)	17 July 2000	* The Editor application now loads the last used file if it
						still exists (i.e. it now behaves like Word, Sheet, etc.).

						* The Editor no longer closes all open Help files on exit

- v1.35(040)	30 June 2000	* Second public version with several minor bug fixes, plus a
						Psion Revo toolbar. Released to the Symbian Developer Network
						website.

- v1.20(027)	24 January 2000	* Initial public release on the Technology Supplement CD
						for the US Developer Conference, February 2000.