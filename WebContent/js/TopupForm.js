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

function populateSelects() {
	populateMonthlyDebitOrderSelects();
}

function populateMonthlyDebitOrderSelects() {
    var sel = document.getElementById("monthlyDebitOrderDay");
    var newOpt = document.createElement("option");
    newOpt.text = "Select";
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
    
    sel = document.getElementById("monthlyDebitOrderCommencementMonth");
    newOpt = document.createElement("option");
    newOpt.text = "Select";
    newOpt.value = "";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "January";
    newOpt.value = "January";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "February";
    newOpt.value = "February";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "March";
    newOpt.value = "March";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "April";
    newOpt.value = "April";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "May";
    newOpt.value = "May";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "June";
    newOpt.value = "June";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "July";
    newOpt.value = "July";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "August";
    newOpt.value = "August";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "September";
    newOpt.value = "September";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "October";
    newOpt.value = "October";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "November";
    newOpt.value = "November";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "December";
    newOpt.value = "December";
    sel.options.add(newOpt);
}

function statusChanged() {
    document.getElementById("naturalPersonDiv").style.display = (document.getElementById("naturalPersonDiv").style.display == "none" ? "block" : "none");
    document.getElementById("legalEntityDiv").style.display = (document.getElementById("legalEntityDiv").style.display == "none" ? "block" : "none");
}

function capacityChanged() {
    if (document.getElementById("jointNameInvestor").checked) {
        document.getElementById("naturalPersonJointNameDiv").style.display = "block";
        
    } else {
        document.getElementById("naturalPersonJointNameDiv").style.display = "none";
    }
}

function changeBankDetailsChanged() {
    if (document.getElementById("changeBankDetails").checked) {
        document.getElementById("changeBankDetailsDiv").style.display = "block";
    } else {
        document.getElementById("changeBankDetailsDiv").style.display = "none";
    }
}

function paymentMethodChanged() {
	// show sections
	
    if (document.getElementById("paymentMethodMonthlyDebitOrder").checked) {
        document.getElementById("debitOrderDiv").style.display = "block";
        document.getElementById("monthlyDebitOrderTable").style.display = "block";
    }
    
    if (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked) {
        document.getElementById("foordBankDetailsDiv").style.display = "block";
    }
    
    // hide sections
    
    if (!document.getElementById("paymentMethodMonthlyDebitOrder").checked) {
    	document.getElementById("monthlyDebitOrderTable").style.display = "none";
    }
    
    if (!document.getElementById("paymentMethodMonthlyDebitOrder").checked) {
    	document.getElementById("debitOrderDiv").style.display = "none";
    }
    
    if (!document.getElementById("paymentMethodEft").checked && !document.getElementById("paymentMethodChequeDeposit").checked) {
    	document.getElementById("foordBankDetailsDiv").style.display = "none";
    }
}

function sourceInvestmentFundsOtherChanged() {
    if (document.getElementById("sourceInvestmentFundsOther").checked) {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = false;
    } else {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = true;
    }
}

function termsConditionsChecked() {
    if (document.getElementById("investorDeclaration").checked && document.getElementById("foordTermsConditions").checked && document.getElementById("complianceComplaints").checked) {
        document.getElementById("generateFormInput").disabled = false;
        document.getElementById("generateFormInput").className = "navigationInput";
    } else {
        document.getElementById("generateFormInput").disabled = true;
        document.getElementById("generateFormInput").className = "compileFormDisabled";
    }
}