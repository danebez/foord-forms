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
    document.getElementById("naturalPersonDiv").style.display = (document.getElementById("naturalPersonDiv").style.display == "none" ? "block" : "none");
    document.getElementById("corporateDiv").style.display = (document.getElementById("corporateDiv").style.display == "none" ? "block" : "none");
}

function capacityChanged() {
    if (document.getElementById("jointNameInvestor").checked) {
        document.getElementById("naturalPersonJointNameDiv").style.display = "block";
        
    } else {
        document.getElementById("naturalPersonJointNameDiv").style.display = "none";
    }
}

function paymentMethodChanged() {
    if (document.getElementById("paymentMethodCheque").checked) {
        document.getElementById("paymentMethodChequeDiv").style.display = "block";
        document.getElementById("paymentMethodEftDiv").style.display = "none";
        
    } else {
        document.getElementById("paymentMethodChequeDiv").style.display = "none";
        document.getElementById("paymentMethodEftDiv").style.display = "block";
    }
}

function paymentMethodEftCurrencyChanged() {
    if (document.getElementById("paymentMethodEftCurrencyUsd").checked) {
        document.getElementById("paymentMethodEftCurrencyUsdDiv").style.display = "block";
        document.getElementById("paymentMethodEftCurrencyEurDiv").style.display = "none";
        document.getElementById("paymentMethodEftCurrencyGbpDiv").style.display = "none";
        
    } else if (document.getElementById("paymentMethodEftCurrencyEur").checked) {
        document.getElementById("paymentMethodEftCurrencyUsdDiv").style.display = "none";
        document.getElementById("paymentMethodEftCurrencyEurDiv").style.display = "block";
        document.getElementById("paymentMethodEftCurrencyGbpDiv").style.display = "none";
        
    } else {
        document.getElementById("paymentMethodEftCurrencyUsdDiv").style.display = "none";
        document.getElementById("paymentMethodEftCurrencyEurDiv").style.display = "none";
        document.getElementById("paymentMethodEftCurrencyGbpDiv").style.display = "block";
    }
}

function paymentMethodEftCurrencyGbpLocationChanged() {
    if (document.getElementById("paymentMethodEftCurrencyGbpFromUk").checked) {
        document.getElementById("paymentMethodEftCurrencyGbpFromUkDiv").style.display = "block";
        document.getElementById("paymentMethodEftCurrencyGbpOutsideUkDiv").style.display = "none";
        
    } else {
        document.getElementById("paymentMethodEftCurrencyGbpFromUkDiv").style.display = "none";
        document.getElementById("paymentMethodEftCurrencyGbpOutsideUkDiv").style.display = "block";
    }
}

function termsConditionsChecked() {
	if (document.getElementById("fitInvestorDeclarations").checked && document.getElementById("fitComplianceComplaints").checked) {
		document.getElementById("generateFormInput").disabled = false;
		document.getElementById("generateFormInput").className = "navigationInput";
		
	} else {
		document.getElementById("generateFormInput").disabled = true;
		document.getElementById("generateFormInput").className = "compileFormDisabled";
	}
}