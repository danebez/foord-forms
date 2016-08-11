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
	populateLegalEntitySelects();
	
	populateMonthlyDebitOrderSelects();
}

function populateNaturalPersonSelects() {
    var sel = document.getElementById("naturalPersonTitle");
    populateTitleSelect(sel);
    
    sel = document.getElementById("naturalPersonDobDay");
    populateDobDaySelect(sel);
    
    sel = document.getElementById("naturalPersonDobMonth");
    populateDobMonthSelect(sel);
    
    sel = document.getElementById("naturalPersonDobYear");
    populateDobYearSelect(sel);
    
    
    sel = document.getElementById("naturalPerson2Title");
    populateTitleSelect(sel);
    
    sel = document.getElementById("naturalPerson2DobDay");
    populateDobDaySelect(sel);
    
    sel = document.getElementById("naturalPerson2DobMonth");
    populateDobMonthSelect(sel);
    
    sel = document.getElementById("naturalPerson2DobYear");
    populateDobYearSelect(sel);
    
    
    sel = document.getElementById("naturalPerson3Title");
    populateTitleSelect(sel);
    
    sel = document.getElementById("naturalPerson3DobDay");
    populateDobDaySelect(sel);
    
    sel = document.getElementById("naturalPerson3DobMonth");
    populateDobMonthSelect(sel);
    
    sel = document.getElementById("naturalPerson3DobYear");
    populateDobYearSelect(sel);
}

function populateLegalEntitySelects() {
	sel = document.getElementById("legalEntityAuthorisedPersonTitle");
    populateTitleSelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPersonDobDay");
    populateDobDaySelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPersonDobMonth");
    populateDobMonthSelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPersonDobYear");
    populateDobYearSelect(sel);
    
    
    sel = document.getElementById("legalEntityAuthorisedPerson2Title");
    populateTitleSelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPerson2DobDay");
    populateDobDaySelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPerson2DobMonth");
    populateDobMonthSelect(sel);
    
    sel = document.getElementById("legalEntityAuthorisedPerson2DobYear");
    populateDobYearSelect(sel);
    
	
	var sel = document.getElementById("legalEntityTypeOfInstitution");
    var newOpt = document.createElement("option");
    newOpt.text = "Select";
    newOpt.value = "";
    sel.options.add(newOpt);
    newOpt = document.createElement("option");
    newOpt.text = "SA Company";
    newOpt.value = "SA Company";
    sel.options.add(newOpt);
     newOpt = document.createElement("option");
    newOpt.text = "Foreign Company";
    newOpt.value = "Foreign Company";
    sel.options.add(newOpt);
     newOpt = document.createElement("option");
    newOpt.text = "CC";
    newOpt.value = "CC";
    sel.options.add(newOpt);
     newOpt = document.createElement("option");
    newOpt.text = "Partnership";
    newOpt.value = "Partnership";
    sel.options.add(newOpt);
     newOpt = document.createElement("option");
    newOpt.text = "Trust";
    newOpt.value = "Trust";
    sel.options.add(newOpt);
     newOpt = document.createElement("option");
    newOpt.text = "Other";
    newOpt.value = "Other";
    sel.options.add(newOpt);
}

function populateTitleSelect(sel) {
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

function populateDobDaySelect(sel) {
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

function populateDobMonthSelect(sel) {
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

function populateDobYearSelect(sel) {
    var newOpt = document.createElement("option");
    newOpt.text = "Year";
    newOpt.value = "";
    sel.options.add(newOpt);
    for (var i = 2005; i > 1920; i--) {
        newOpt = document.createElement("option");
        newOpt.text = "" + i;
        newOpt.value = i;
        sel.options.add(newOpt);
    }
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
	if (document.getElementById("naturalPerson").checked) {
		document.getElementById("naturalPersonDiv").style.display = "block";
		document.getElementById("legalEntityDiv").style.display = "none";
		document.getElementById("legalEntityAuthorisedPerson2Div").style.display = "none";
		
	} else {
		document.getElementById("naturalPersonDiv").style.display = "none";
		document.getElementById("legalEntityDiv").style.display = "block";
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

function legalEntityAuthorisedPerson2Changed() {
    if (document.getElementById("legalEntityAuthorisedPerson2").checked) {
        document.getElementById("legalEntityAuthorisedPerson2Div").style.display = "block";
    } else {
        document.getElementById("legalEntityAuthorisedPerson2Div").style.display = "none";
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

function legalEntityPostalSameAsResidentialChanged() {
	if (document.getElementById("legalEntityPostalAddressSame").checked) {
		document.getElementById("legalEntityPostalAddressTable").style.display = "none";
	} else {
		document.getElementById("legalEntityPostalAddressTable").style.display = "block";
	}
}

function legalEntityAuthorisedPersonPostalSameAsResidentialChanged() {
	if (document.getElementById("legalEntityAuthorisedPersonPostalAddressSame").checked) {
		document.getElementById("legalEntityAuthorisedPersonPostalAddressTable").style.display = "none";
	} else {
		document.getElementById("legalEntityAuthorisedPersonPostalAddressTable").style.display = "block";
	}
}

function legalEntityAuthorisedPerson2PostalSameAsResidentialChanged() {
	if (document.getElementById("legalEntityAuthorisedPerson2PostalAddressSame").checked) {
		document.getElementById("legalEntityAuthorisedPerson2PostalAddressTable").style.display = "none";
	} else {
		document.getElementById("legalEntityAuthorisedPerson2PostalAddressTable").style.display = "block";
	}
}

function naturalPersonCommStatementsChanged() {
	if (document.getElementById("naturalPersonCommStatementsEmail").checked) {
		document.getElementById("naturalPersonCommStatementsEmailWeekly").disabled = false;
		document.getElementById("naturalPersonCommStatementsEmailMonthly").disabled = false;
		document.getElementById("naturalPersonCommStatementsEmailQuarterly").disabled = false;
	} else {
		document.getElementById("naturalPersonCommStatementsEmailWeekly").disabled = true;
		document.getElementById("naturalPersonCommStatementsEmailMonthly").disabled = true;
		document.getElementById("naturalPersonCommStatementsEmailQuarterly").disabled = true;
	}
}

function naturalPerson2CommStatementsChanged() {
	if (document.getElementById("naturalPerson2CommStatementsEmail").checked) {
		document.getElementById("naturalPerson2CommStatementsEmailWeekly").disabled = false;
		document.getElementById("naturalPerson2CommStatementsEmailMonthly").disabled = false;
		document.getElementById("naturalPerson2CommStatementsEmailQuarterly").disabled = false;
	} else {
		document.getElementById("naturalPerson2CommStatementsEmailWeekly").disabled = true;
		document.getElementById("naturalPerson2CommStatementsEmailMonthly").disabled = true;
		document.getElementById("naturalPerson2CommStatementsEmailQuarterly").disabled = true;
	}
}

function naturalPerson3CommStatementsChanged() {
	if (document.getElementById("naturalPerson3CommStatementsEmail").checked) {
		document.getElementById("naturalPerson3CommStatementsEmailWeekly").disabled = false;
		document.getElementById("naturalPerson3CommStatementsEmailMonthly").disabled = false;
		document.getElementById("naturalPerson3CommStatementsEmailQuarterly").disabled = false;
	} else {
		document.getElementById("naturalPerson3CommStatementsEmailWeekly").disabled = true;
		document.getElementById("naturalPerson3CommStatementsEmailMonthly").disabled = true;
		document.getElementById("naturalPerson3CommStatementsEmailQuarterly").disabled = true;
	}
}

function legalEntityCommStatementsChanged() {
	if (document.getElementById("legalEntityCommStatementsEmail").checked) {
		document.getElementById("legalEntityCommStatementsEmailWeekly").disabled = false;
		document.getElementById("legalEntityCommStatementsEmailMonthly").disabled = false;
		document.getElementById("legalEntityCommStatementsEmailQuarterly").disabled = false;
	} else {
		document.getElementById("legalEntityCommStatementsEmailWeekly").disabled = true;
		document.getElementById("legalEntityCommStatementsEmailMonthly").disabled = true;
		document.getElementById("legalEntityCommStatementsEmailQuarterly").disabled = true;
	}
}

function naturalPersonTaxSaResidentChanged() {
	if (document.getElementById("naturalPersonTaxSaResidentNo").checked) {
		document.getElementById("naturalPersonSaIncomeTaxNumberTable").style.display = "none";
	} else {
		document.getElementById("naturalPersonSaIncomeTaxNumberTable").style.display = "block";
	}
}

function naturalPersonTaxOtherCountryChanged() {
	if (document.getElementById("naturalPersonTaxOtherCountryNo").checked) {
		document.getElementById("naturalPersonForeignTaxTable").style.display = "none";
	} else {
		document.getElementById("naturalPersonForeignTaxTable").style.display = "block";
	}
}

function naturalPersonPepChanged() {
	if (document.getElementById("naturalPersonPepNo").checked) {
		document.getElementById("naturalPersonPepTable").style.display = "none";
	} else {
		document.getElementById("naturalPersonPepTable").style.display = "block";
	}
}

function naturalPerson2PepChanged() {
	if (document.getElementById("naturalPerson2PepNo").checked) {
		document.getElementById("naturalPerson2PepTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson2PepTable").style.display = "block";
	}
}

function naturalPerson3PepChanged() {
	if (document.getElementById("naturalPerson3PepNo").checked) {
		document.getElementById("naturalPerson3PepTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson3PepTable").style.display = "block";
	}
}

function naturalPerson2TaxSaResidentChanged() {
	if (document.getElementById("naturalPerson2TaxSaResidentNo").checked) {
		document.getElementById("naturalPerson2SaIncomeTaxNumberTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson2SaIncomeTaxNumberTable").style.display = "block";
	}
}

function naturalPerson2TaxOtherCountryChanged() {
	if (document.getElementById("naturalPerson2TaxOtherCountryNo").checked) {
		document.getElementById("naturalPerson2ForeignTaxTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson2ForeignTaxTable").style.display = "block";
	}
}

function naturalPerson3TaxSaResidentChanged() {
	if (document.getElementById("naturalPerson3TaxSaResidentNo").checked) {
		document.getElementById("naturalPerson3SaIncomeTaxNumberTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson3SaIncomeTaxNumberTable").style.display = "block";
	}
}

function naturalPerson3TaxOtherCountryChanged() {
	if (document.getElementById("naturalPerson3TaxOtherCountryNo").checked) {
		document.getElementById("naturalPerson3ForeignTaxTable").style.display = "none";
	} else {
		document.getElementById("naturalPerson3ForeignTaxTable").style.display = "block";
	}
}

function legalEntityTaxOtherCountryChanged() {
	if (document.getElementById("legalEntityTaxOtherCountryNo").checked) {
		document.getElementById("legalEntityForeignTaxTable").style.display = "none";
	} else {
		document.getElementById("legalEntityForeignTaxTable").style.display = "block";
	}
}

function legalEntityPepChanged() {
	if (document.getElementById("legalEntityPepNo").checked) {
		document.getElementById("legalEntityPepTable").style.display = "none";
	} else {
		document.getElementById("legalEntityPepTable").style.display = "block";
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
    
    // show or hide payout account
    payoutAccountChanged();
}

function sourceInvestmentFundsOtherChanged() {
    if (document.getElementById("sourceInvestmentFundsOther").checked) {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = false;
    } else {
        document.getElementById("sourceInvestmentFundsOtherDescription").disabled = true;
    }
}

function payoutAccountChanged() {
	if (!document.getElementById("paymentMethodMonthlyDebitOrder").checked) {
		document.getElementById("payoutAccountDiv").style.display = "block";
	} else if (document.getElementById("payoutAccountSame").checked) {
        document.getElementById("payoutAccountDiv").style.display = "none";
    } else {
        document.getElementById("payoutAccountDiv").style.display = "block";
    }
}

function accountHolderThirdPartyAuthoriseClicked() {
	if (!document.getElementById("accountHolderThirdPartyYes").checked) {
		document.getElementById("accountHolderThirdPartyAuthorise").style.display = "none";
	} else {
        document.getElementById("accountHolderThirdPartyAuthorise").style.display = "block";
    }
}

function termsConditionsChecked() {
	if (document.getElementById("investorDeclaration").checked 
			&& document.getElementById("complianceComplaints").checked 
	        && document.getElementById("fica").checked 
	        && document.getElementById("foordTermsConditions").checked
	        && (!document.getElementById("accountHolderThirdPartyYes").checked 
	        		|| (document.getElementById("accountHolderThirdPartyYes").checked && document.getElementById("accountHolderThirdPartyAccept").checked))) {
		document.getElementById("generateFormInput").disabled = false;
		document.getElementById("generateFormInput").className = "navigationInput";
	} else {
		document.getElementById("generateFormInput").disabled = true;
		document.getElementById("generateFormInput").className = "compileFormDisabled";
	}
}