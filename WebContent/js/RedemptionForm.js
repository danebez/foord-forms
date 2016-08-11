var currentLayer = "step1";

function showLayer(layer) {
   hideLayer(currentLayer);
   document.getElementById(layer).style.display = "block";
   currentLayer = layer;
   window.scrollTo(0, 0);
}

function hideLayer(layer) {
   document.getElementById(layer).style.display = "none";
}

function statusChanged() {
	if (document.getElementById("naturalPerson").checked) {
		document.getElementById("naturalPersonDiv").style.display = "block";
		document.getElementById("legalEntityDiv").style.display = "none";
		
	} else {
		document.getElementById("naturalPersonDiv").style.display = "none";
		document.getElementById("legalEntityDiv").style.display = "block";
	}
}

function capacityChanged() {
    if (document.getElementById("jointNameInvestor").checked) {
        document.getElementById("naturalPersonJointNameDiv").style.display = "block";
        
    } else {
        document.getElementById("naturalPersonJointNameDiv").style.display = "none";
    }
}

function populateMonthlySelect() {
	var sel = document.getElementById("regWithMonthlyDaySelect");
    var newOpt = document.createElement("option");
    newOpt.text = "Day Of Month";
    newOpt.value = "";
    sel.options.add(newOpt);
    for (var i = 1; i < 29; i++) {
    	newOpt = document.createElement("option");
	    newOpt.text = "" + i;
    	newOpt.value = i;
	    sel.options.add(newOpt);
    }
    newOpt = document.createElement("option");
    newOpt.text = "Last";
    newOpt.value = "Last";
    sel.options.add(newOpt);
}

function populateQuarterlySelects() {
	var sel1 = document.getElementById("regWithQuarterlyMonthSelect");
	var newOpt = document.createElement("option");
    newOpt.text = "Month Of Quarter";
    newOpt.value = "";
    sel1.options.add(newOpt);
	newOpt = document.createElement("option");
    newOpt.text = "First";
    newOpt.value = 1;
    sel1.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Second";
    newOpt.value = 2;
    sel1.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Third";
    newOpt.value = 3;
    sel1.options.add(newOpt);
	
	var sel2 = document.getElementById("regWithQuarterlyDaySelect");
	newOpt = document.createElement("option");
	newOpt.text = "Day Of Month";
    newOpt.value = "";
    sel2.options.add(newOpt);
    for (var i = 1; i < 29; i++) {
    	newOpt = document.createElement("option");
	    newOpt.text = "" + i;
	    newOpt.value = i;
	    sel2.options.add(newOpt);
    }
    newOpt = document.createElement("option");
    newOpt.text = "Last";
    newOpt.value = "Last";
    sel2.options.add(newOpt);
}

function debitOrderDetailsChanged() {
	if (document.getElementById("debitOrderDetailsChange").checked) {
		document.getElementById("debitOrderDetailsChangeDiv").style.display = "block";
	} else {
		document.getElementById("debitOrderDetailsChangeDiv").style.display = "none";
	}
}

function changeBankDetailsChanged() {
	if (document.getElementById("changeBankDetails").checked) {
		document.getElementById("changeBankDetailsDiv").style.display = "block";
	} else {
		document.getElementById("changeBankDetailsDiv").style.display = "none";
	}
}

function changeRegWithChanged() {
	if (document.getElementById("changeRegWith").checked) {
		document.getElementById("changeRegWithDiv").style.display = "block";
	} else {
		document.getElementById("changeRegWithDiv").style.display = "none";
	}
}

function regWithChanged() {
	if (document.getElementById("monthlyWithdrawal").checked) {
		document.getElementById("regWithMonthlyDaySelect").disabled = false;
		document.getElementById("regWithQuarterlyMonthSelect").disabled = true;
		document.getElementById("regWithQuarterlyDaySelect").disabled = true;
	} else {
		document.getElementById("regWithMonthlyDaySelect").disabled = true;
		document.getElementById("regWithQuarterlyMonthSelect").disabled = false;
		document.getElementById("regWithQuarterlyDaySelect").disabled = false;
	}
}

function termsConditionsChecked() {
	if (document.getElementById("investorDeclarations").checked && document.getElementById("complianceComplaints").checked) {
		document.getElementById("generateFormInput").disabled = false;
		document.getElementById("generateFormInput").className = "navigationInput";
	} else {
		document.getElementById("generateFormInput").disabled = true;
		document.getElementById("generateFormInput").className = "compileFormDisabled";
	}
}