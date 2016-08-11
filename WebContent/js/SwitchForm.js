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

function populateFundSelects() {
    var sel = document.getElementById("fromFund1");
    populateSelectWithFundsFrom(sel);
    sel = document.getElementById("toFund1");
    populateSelectWithFundsTo(sel);
    
    sel = document.getElementById("fromFund2");
    populateSelectWithFundsFrom(sel);
    sel = document.getElementById("toFund2");
    populateSelectWithFundsTo(sel);
    
    sel = document.getElementById("fromFund3");
    populateSelectWithFundsFrom(sel);
    sel = document.getElementById("toFund3");
    populateSelectWithFundsTo(sel);
    
    sel = document.getElementById("fromFund4");
    populateSelectWithFundsFrom(sel);
    sel = document.getElementById("toFund4");
    populateSelectWithFundsTo(sel);
}

function populateSelectWithFundsFrom(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Select";
    newOpt.value = "";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Conservative";
    newOpt.value = "Conservative";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Balanced";
    newOpt.value = "Balanced";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Flexible FoF";
    newOpt.value = "Flexible FoF";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Equity";
    newOpt.value = "Equity";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "International Feeder";
    newOpt.value = "International Feeder";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Global Equity Feeder";
    newOpt.value = "Global Equity Feeder";
    sel.options.add(newOpt);
}

function populateSelectWithFundsTo(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Select";
    newOpt.value = "";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Conservative";
    newOpt.value = "Conservative";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Balanced";
    newOpt.value = "Balanced";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Flexible FoF";
    newOpt.value = "Flexible FoF";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Equity";
    newOpt.value = "Equity";
    sel.options.add(newOpt);
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

function debitOrderDetailsChanged() {
    if (document.getElementById("debitOrderDetailsChange").checked) {
        document.getElementById("debitOrderDetailsChangeDiv").style.display = "block";
    } else {
        document.getElementById("debitOrderDetailsChangeDiv").style.display = "none";
    }
}

function totalDebitOrderAmountChanged() {
    var total = (document.getElementById("flexibleDebitOrderAmount").value != "" ? $('#flexibleDebitOrderAmount').asNumber({ parseType: 'int' }) : 0) +
        (document.getElementById("balancedDebitOrderAmount").value != "" ? $('#balancedDebitOrderAmount').asNumber({ parseType: 'int' }) : 0) +
        (document.getElementById("equityDebitOrderAmount").value != "" ? $('#equityDebitOrderAmount').asNumber({ parseType: 'int' }) : 0) +
        (document.getElementById("conservativeDebitOrderAmount").value != "" ? $('#conservativeDebitOrderAmount').asNumber({ parseType: 'int' }) : 0);
    
    document.getElementById("totalDebitOrderAmountLabel").value = total;
    $('#totalDebitOrderAmountLabel').formatCurrency({symbol: '', roundToDecimalPlace: 0});
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