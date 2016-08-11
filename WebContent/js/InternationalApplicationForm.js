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
	populateNaturalPersonSelects();
	populateCorporateSelects();
}

function populateNaturalPersonSelects() {
    var sel = document.getElementById("naturalPersonTitle");
    populateNaturalPersonTitleSelect(sel);
    sel = document.getElementById("naturalPersonDobDay");
    populateDaySelect(sel);
    sel = document.getElementById("naturalPersonDobMonth");
    populateMonthSelect(sel);
    sel = document.getElementById("naturalPersonDobYear");
    populateYearSelect(sel);
    
    sel = document.getElementById("naturalPerson2Title");
    populateNaturalPersonTitleSelect(sel);
    sel = document.getElementById("naturalPerson2DobDay");
    populateDaySelect(sel);
    sel = document.getElementById("naturalPerson2DobMonth");
    populateMonthSelect(sel);
    sel = document.getElementById("naturalPerson2DobYear");
    populateYearSelect(sel);
    
    sel = document.getElementById("naturalPerson3Title");
    populateNaturalPersonTitleSelect(sel);
    sel = document.getElementById("naturalPerson3DobDay");
    populateDaySelect(sel);
    sel = document.getElementById("naturalPerson3DobMonth");
    populateMonthSelect(sel);
    sel = document.getElementById("naturalPerson3DobYear");
    populateYearSelect(sel);
}

function populateNaturalPersonTitleSelect(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Select";
    newOpt.value = "";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Mr";
    newOpt.value = "Mr";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Mrs";
    newOpt.value = "Mrs";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Miss";
    newOpt.value = "Miss";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Ms";
    newOpt.value = "Ms";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Dr";
    newOpt.value = "Dr";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Prof";
    newOpt.value = "Prof";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Rev";
    newOpt.value = "Rev";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Adv";
    newOpt.value = "Adv";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Hon";
    newOpt.value = "Hon";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "Sir";
    newOpt.value = "Sir";
    sel.options.add(newOpt);
}

function populateDaySelect(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Day";
    newOpt.value = "";
    sel.options.add(newOpt);
    for (var i = 1; i < 32; i++) {
        newOpt = document.createElement("option");
        newOpt.text = "" + i;
        newOpt.value = i;
        sel.options.add(newOpt);
    }
}

function populateMonthSelect(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Month";
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

function populateYearSelect(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Year";
    newOpt.value = "";
    sel.options.add(newOpt);
    for (var i = 2011; i > 1920; i--) {
        newOpt = document.createElement("option");
        newOpt.text = "" + i;
        newOpt.value = i;
        sel.options.add(newOpt);
    }
}

function populateCorporateSelects() {
    var sel = document.getElementById("corporateIncorporationDateDay");
    populateDaySelect(sel);
    sel = document.getElementById("corporateIncorporationDateMonth");
    populateMonthSelect(sel);
    sel = document.getElementById("corporateIncorporationDateYear");
    populateYearSelect(sel);
}

function entityChanged() {
    if (document.getElementById("entityIndividuals").checked) {
        document.getElementById("individualsDiv").style.display = "block";
        document.getElementById("corporateInvestorDiv").style.display = "none";
        document.getElementById("regulatedDiv").style.display = "none";
        
    } else if (document.getElementById("entityCorporate").checked) {
        document.getElementById("individualsDiv").style.display = "none";
        document.getElementById("corporateInvestorDiv").style.display = "block";
        document.getElementById("regulatedDiv").style.display = "none";
        
    } else {
        document.getElementById("individualsDiv").style.display = "none";
        document.getElementById("corporateInvestorDiv").style.display = "none";
        document.getElementById("regulatedDiv").style.display = "block";
    }
}

function regulatedWhoseBehalfChanged() {
    if (document.getElementById("regulatedOwnAccount").checked) {
        document.getElementById("regulatedOwnAccountDiv").style.display = "block";
        document.getElementById("regulatedOnBehalfOfClientDiv").style.display = "none";
        
    } else {
        document.getElementById("regulatedOwnAccountDiv").style.display = "none";
        document.getElementById("regulatedOnBehalfOfClientDiv").style.display = "block";
    }
}

function statusChanged() {
	if (document.getElementById("naturalPerson").checked) {
		document.getElementById("naturalPersonDiv").style.display = "block";
		document.getElementById("corporateDiv").style.display = "none";
		
	} else {
		document.getElementById("naturalPersonDiv").style.display = "none";
		document.getElementById("corporateDiv").style.display = "block";
	}
}

function capacityChanged() {
	if (document.getElementById("jointNameInvestor").checked) {
		document.getElementById("naturalPersonJointNameDiv").style.display = "block";
		document.getElementById("jointInvestor2Div").style.display = "block";
		document.getElementById("investorH").innerHTML = "JOINT INVESTOR 1";
		
	} else {
		document.getElementById("naturalPersonJointNameDiv").style.display = "none";
		document.getElementById("jointInvestor2Div").style.display = "none";
        document.getElementById("investorH").innerHTML = "INVESTOR";
	}
}

function jointInvestor3Changed() {
    if (document.getElementById("jointInvestor3").checked) {
        document.getElementById("jointInvestor3Div").style.display = "block";
        
    } else {
        document.getElementById("jointInvestor3Div").style.display = "none";
    }
}

function naturalPersonPostalSameAsResidentialChanged() {
	if (document.getElementById("naturalPersonPostalAddressSame").checked) {
		document.getElementById("naturalPersonPostalAddressTable").style.display = "none";
		
	} else {
		document.getElementById("naturalPersonPostalAddressTable").style.display = "block";
	}
}

function naturalPerson2PostalSameAsResidentialChanged() {
	if (document.getElementById("naturalPerson2PostalAddressSame").checked) {
		document.getElementById("naturalPerson2PostalAddressTable").style.display = "none";
		
	} else {
		document.getElementById("naturalPerson2PostalAddressTable").style.display = "block";
	}
}

function naturalPerson3PostalSameAsResidentialChanged() {
	if (document.getElementById("naturalPerson3PostalAddressSame").checked) {
		document.getElementById("naturalPerson3PostalAddressTable").style.display = "none";
		
	} else {
		document.getElementById("naturalPerson3PostalAddressTable").style.display = "block";
	}
}

function corporatePostalSameAsResidentialChanged() {
	if (document.getElementById("corporatePostalAddressSame").checked) {
		document.getElementById("corporatePostalAddressTable").style.display = "none";
		
	} else {
		document.getElementById("corporatePostalAddressTable").style.display = "block";
	}
}

function naturalPersonPublicOfficeChanged() {
	if (document.getElementById("naturalPersonPublicOfficeYes").checked) {
		document.getElementById("naturalPersonPublicOfficeDescriptionDiv").style.display = "block";
		
	} else {
	    document.getElementById("naturalPersonPublicOfficeDescriptionDiv").style.display = "none";
	}
}

function naturalPerson2PublicOfficeChanged() {
    if (document.getElementById("naturalPerson2PublicOfficeYes").checked) {
        document.getElementById("naturalPerson2PublicOfficeDescriptionDiv").style.display = "block";
        
    } else {
        document.getElementById("naturalPerson2PublicOfficeDescriptionDiv").style.display = "none";
    }
}

function naturalPerson3PublicOfficeChanged() {
    if (document.getElementById("naturalPerson3PublicOfficeYes").checked) {
        document.getElementById("naturalPerson3PublicOfficeDescriptionDiv").style.display = "block";
        
    } else {
        document.getElementById("naturalPerson3PublicOfficeDescriptionDiv").style.display = "none";
    }
}

function corporatePublicOfficeChanged() {
    if (document.getElementById("corporatePublicOfficeYes").checked) {
        document.getElementById("corporatePublicOfficeDescriptionDiv").style.display = "block";
        
    } else {
        document.getElementById("corporatePublicOfficeDescriptionDiv").style.display = "none";
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

function sourceInvestmentFundsSaleChanged() {
    if (document.getElementById("sourceInvestmentFundsSale").checked) {
        document.getElementById("sourceInvestmentFundsSaleDescription").disabled = false;
        
    } else {
        document.getElementById("sourceInvestmentFundsSaleDescription").disabled = true;
    }
}

function sourceInvestmentFundsOtherChanged() {
    if (document.getElementById("sourceInvestmentFundsOther").checked) {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = false;
        
    } else {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = true;
    }
}

function agentChanged() {
    if (document.getElementById("agentNo").checked) {
        document.getElementById("agentDiv").style.display = "none";
        
    } else {
        document.getElementById("agentDiv").style.display = "block";
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
	if (document.getElementById("fitDisclosures").checked && document.getElementById("fitFeesCharges").checked 
	        && document.getElementById("fitInvestorDeclarations").checked && document.getElementById("fitComplianceComplaints").checked) {
		document.getElementById("generateFormInput").disabled = false;
		document.getElementById("generateFormInput").className = "navigationInput";
		
	} else {
		document.getElementById("generateFormInput").disabled = true;
		document.getElementById("generateFormInput").className = "compileFormDisabled";
	}
}