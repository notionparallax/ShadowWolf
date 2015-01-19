var filePath = "~/Desktop/tempLogFile.txt";
var logFile = new File(filePath);
logFile.encoding = "UTF-16";
function log(aFile, message, header, incDate) {
	var today = new Date();
	if (!aFile.exists) {
		// make new log file
		aFile.open("w");
		if (incDate) {
			aFile.write(String(today));
		}
		if (header != null) {
			aFile.write(header);
		}
		aFile.close();
	}
 
	if (aFile.open("e")) {
		if (aFile.seek(0,2)) {
			if (aFile.write("," + message)) {
				if (aFile.close()) {
					return true;
				}
			}
		}
	}
	$.writeln("ERROR='"+aFile.error+"', Log() failed to write '"+ message + "' to log file.");
	aFile.close();
	return false;
}


var files = File.openDialog("prompt","*.indd",true);
for (var fc = files.length - 1; fc >= 0; fc--) {
	var currentPath = files[fc];
	var thisDocument = app.open(File(currentPath));
	log(logFile, "\n***************\n"+currentPath+"\n", "", false);

	var allTextFrames = document.textFrames;

	// for (var i = allTextFrames.length - 1; i >= 0; i--) {
	// 	alert(allTextFrames[i].paragraph[0].contents);
	// };

	for (var sc = thisDocument.stories.count()-1; sc >= 0; sc--) {
		// var sc = 1;
		var story = thisDocument.stories[sc];
		//log(logFile,"story "+sc,"",false);
		// Get every paragraph in `story`
		//(using `everyItem().getElements()` is more efficient)
		var paras = story.paragraphs.everyItem().getElements();

		for (var i=0,l=paras.length; i<l; i++) {
		   var para = paras[i];
		   var message =  "(sc: "+sc+") | "+para.appliedParagraphStyle.name + " | " +
		                  para.contents.replace(/,/, "|comma|");
		   log(logFile,message,"",false);
		}
	}
	// Do something with each `para` in `paras_with_style`
	//log(logFile,"****************\n","",false);
	thisDocument.close();
}
