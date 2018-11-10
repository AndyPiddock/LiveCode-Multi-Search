# LiveCode-Multi-Search


![LiveCode-Multi-Search](https://2108.co.uk/LCDict/LCMultiSearch1.png)

**One Search box Eight sites searched**
Search across
LiveCode Forum, Nabble Forum, StackOverflow, LiveCode Dictionary, LiveCode Lessons, GitHub, Github Gists and LiveCode Wiki all from one search box!

Filter Gist reults by extension.
Traverse back and forward through your searches.

Add your own web resources to the Resources dropdown menu via a simple text file.
This text file which if it does not exist is created on startup.
The text file can be mended with your favourite resource links in the form of menu item,web link
e.g.  LiveCode Super Site,http://livecodesupersite.com/

The resources file is lcmsresources.txt and will be created on first run in the user/documents folder.

The option to exclude a search target was added in v1.0.6, this allows for quicker search returns if you are only intersted in searching a subset of all the search target available. To exclude a target, click on the green segment above the target to exclude. The segment will turn red to show that this target has been exclded from the next searches. Click again to reset, the segment will turn green.

The online dictionary was created using the WebDocMaker by 
Brian Milby https://github.com/bwmilby/lc-misc/tree/master/WebDocMaker
the output modified to accept url perameters.

The online dictionary is on my hosting. If you would like to have your own hosted dictionary, then generate the files using WebDocMaker and then at the end of the api.html file, replace

 
	
	<script>
		$(document).ready(function(e)
		{
			setEdition('commercial');
			setActions();
			dataFilter();
			displayLibraryChooser();
			
			goEntryName('tLibraryName', 'tEntryName', 'tEntryType');
			document.getElementById("ui_filer").focus();
		});
	</script>
  
  with
  
	< script >
    function getURLParameter(e) {
        return decodeURI((new RegExp(e + "=(.+?)(&|$)").exec(location.search) || [, ""])[1]);
    }
    if (getURLParameter("search") === "") {
    console.log("No URL param value found.");
    } else {


    document.getElementById("ui_filer").value = getURLParameter("search");
    } </script>


	<script>
		$(document).ready(function(e)
		{
			setEdition('commercial');
			setActions();
			dataFilter();
			displayLibraryChooser();
			
			goEntryName('tLibraryName', 'tEntryName', 'tEntryType');
			document.getElementById("ui_filer").focus();
			$('#ui_filer').keyup();
		});
	</script


to allow passing of the search perameters and to force trigger the keyup event in the search input field.

You will also need to change the url here

--LC Dictionary
   put "https://2108.co.uk/LCDict/api.html?search=" & fld "Search" into tSearchLCDict
   set the url of widget "Browser LC Dictionary" to tSearchLCDict
   
which can be found in the maingroupid1032searchbuttonbehavior.livecodescript file
