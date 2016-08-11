$(document).ready(function() {
	populateMonthlySelect();
	populateQuarterlySelects();
	
	$('.fancyPopup').fancybox({'padding':0,'margin':0,'width':493,'height':450,'autoScale':false,'scrolling':'no','transitionIn':'none','transitionOut':'none','type':'iframe'});
	
	jQuery('.fancySelect').each(
        function() {
            selectContainer = jQuery(this);
            // initialse the select-text
            selectContainer.children().before('<div class="select-text"></div>').each(
                function() {
                    if (this.selectedIndex > 0) {
                        jQuery(this).prev().text(this.options[this.selectedIndex].innerHTML);
                    } else {
                        jQuery(this).prev().text(this.options[0].innerHTML);
                    }
                }
            );
            // handle a selection event
            selectContainer.children().change(
                function() {
                    jQuery(this).prev().text(this.options[this.selectedIndex].innerHTML);
                }
            );
        }
    );
	
    $('.gridTable tr:nth-child(2n+1)').addClass('odd');
    
    $('.currency').blur(function() {
        $('.currency').formatCurrency({symbol: '', roundToDecimalPlace: 0});
    });
	
	$("img.onbehalf").qtip({
       content: "Legal guardian(s) or person(s) with power of attorney or mandate to act on behalf of an investor",
       show: "mouseover",
       hide: "mouseout",
       position: {
          corner: {
             tooltip: "rightTop",
             target: "leftBottom"
          }
       }
    });
	
	$("img.debit").qtip({
	   content: "Select 'Change' to enter your new debit order amount(s)",
	   show: "mouseover",
	   hide: "mouseout"
	});
	
	$("#redemptionForm").validate({
		submitHandler: function(form) {
		    if (currentLayer == "step1") {
		        showLayer("step2");
		        window.parent.window.scrollTo(0, 0);
                
		    } else if (currentLayer == "step2") {
				showLayer("step3");
				window.parent.window.scrollTo(0, 0);
				
			} else if (currentLayer == "step3") {
				var redemInstrFlexibleNumberOfUnitsElem = document.getElementById("redemInstrFlexibleNumberOfUnits");
				var redemInstrBalancedNumberOfUnitsElem = document.getElementById("redemInstrBalancedNumberOfUnits");
				var redemInstrEquityNumberOfUnitsElem = document.getElementById("redemInstrEquityNumberOfUnits");
				var redemInstrConservativeNumberOfUnitsElem = document.getElementById("redemInstrConservativeNumberOfUnits");
				var redemInstrInternationalNumberOfUnitsElem = document.getElementById("redemInstrInternationalNumberOfUnits");
				var redemInstrGefNumberOfUnitsElem = document.getElementById("redemInstrGefNumberOfUnits");
				
				var redemInstrFlexiblePercentageElem = document.getElementById("redemInstrFlexiblePercentage");
				var redemInstrBalancedPercentageElem = document.getElementById("redemInstrBalancedPercentage");
				var redemInstrEquityPercentageElem = document.getElementById("redemInstrEquityPercentage");
				var redemInstrConservativePercentageElem = document.getElementById("redemInstrConservativePercentage");
				var redemInstrInternationalPercentageElem = document.getElementById("redemInstrInternationalPercentage");
				var redemInstrGefPercentageElem = document.getElementById("redemInstrGefPercentage");
				
				var redemInstrFlexibleRandValueElem = document.getElementById("redemInstrFlexibleRandValue");
				var redemInstrBalancedRandValueElem = document.getElementById("redemInstrBalancedRandValue");
				var redemInstrEquityRandValueElem = document.getElementById("redemInstrEquityRandValue");
				var redemInstrConservativeRandValueElem = document.getElementById("redemInstrConservativeRandValue");
				var redemInstrInternationalRandValueElem = document.getElementById("redemInstrInternationalRandValue");
				var redemInstrGefRandValueElem = document.getElementById("redemInstrGefRandValue");
				
				if (       (redemInstrFlexibleNumberOfUnitsElem.value == "" &&      redemInstrFlexiblePercentageElem.value == "" &&      redemInstrFlexibleRandValueElem.value == "")
						&& (redemInstrBalancedNumberOfUnitsElem.value == "" &&      redemInstrBalancedPercentageElem.value == "" &&      redemInstrBalancedRandValueElem.value == "")
						&& (redemInstrEquityNumberOfUnitsElem.value == "" &&        redemInstrEquityPercentageElem.value == "" &&        redemInstrEquityRandValueElem.value == "")
						&& (redemInstrConservativeNumberOfUnitsElem.value == "" &&        redemInstrConservativePercentageElem.value == "" &&        redemInstrConservativeRandValueElem.value == "")
						&& (redemInstrInternationalNumberOfUnitsElem.value == "" && redemInstrInternationalPercentageElem.value == "" && redemInstrInternationalRandValueElem.value == "")
						&& (redemInstrGefNumberOfUnitsElem.value == "" && redemInstrGefPercentageElem.value == "" && redemInstrGefRandValueElem.value == "")) {
					
					alert("Please fill in at least the NUMBER OF UNITS or PERCENTAGE or RAND VALUE that you wish to redeem of at least one of the funds");
					
				} else if (redemInstrFlexibleNumberOfUnitsElem.value != "" && (redemInstrFlexiblePercentageElem.value != "" || redemInstrFlexibleRandValueElem.value != "")
                        || redemInstrFlexiblePercentageElem.value != "" && (redemInstrFlexibleNumberOfUnitsElem.value != "" || redemInstrFlexibleRandValueElem.value != "")
                        || redemInstrFlexibleRandValueElem.value != "" && (redemInstrFlexiblePercentageElem.value != "" || redemInstrFlexibleNumberOfUnitsElem.value != "")
                        
                        || redemInstrBalancedNumberOfUnitsElem.value != "" && (redemInstrBalancedPercentageElem.value != "" || redemInstrBalancedRandValueElem.value != "")
                        || redemInstrBalancedPercentageElem.value != "" && (redemInstrBalancedNumberOfUnitsElem.value != "" || redemInstrBalancedRandValueElem.value != "")
                        || redemInstrBalancedRandValueElem.value != "" && (redemInstrBalancedPercentageElem.value != "" || redemInstrBalancedNumberOfUnitsElem.value != "")
                        
                        || redemInstrEquityNumberOfUnitsElem.value != "" && (redemInstrEquityPercentageElem.value != "" || redemInstrEquityRandValueElem.value != "")
                        || redemInstrEquityPercentageElem.value != "" && (redemInstrEquityNumberOfUnitsElem.value != "" || redemInstrEquityRandValueElem.value != "")
                        || redemInstrEquityRandValueElem.value != "" && (redemInstrEquityPercentageElem.value != "" || redemInstrEquityNumberOfUnitsElem.value != "")
                        
                        || redemInstrConservativeNumberOfUnitsElem.value != "" && (redemInstrConservativePercentageElem.value != "" || redemInstrConservativeRandValueElem.value != "")
                        || redemInstrConservativePercentageElem.value != "" && (redemInstrConservativeNumberOfUnitsElem.value != "" || redemInstrConservativeRandValueElem.value != "")
                        || redemInstrConservativeRandValueElem.value != "" && (redemInstrConservativePercentageElem.value != "" || redemInstrConservativeNumberOfUnitsElem.value != "")
                        
                        || redemInstrInternationalNumberOfUnitsElem.value != "" && (redemInstrInternationalPercentageElem.value != "" || redemInstrInternationalRandValueElem.value != "")
                        || redemInstrInternationalPercentageElem.value != "" && (redemInstrInternationalNumberOfUnitsElem.value != "" || redemInstrInternationalRandValueElem.value != "")
                        || redemInstrInternationalRandValueElem.value != "" && (redemInstrInternationalPercentageElem.value != "" || redemInstrInternationalNumberOfUnitsElem.value != "")
                        
                        || redemInstrGefNumberOfUnitsElem.value != "" && (redemInstrGefPercentageElem.value != "" || redemInstrGefRandValueElem.value != "")
                        || redemInstrGefPercentageElem.value != "" && (redemInstrGefNumberOfUnitsElem.value != "" || redemInstrGefRandValueElem.value != "")
                        || redemInstrGefRandValueElem.value != "" && (redemInstrGefPercentageElem.value != "" || redemInstrGefNumberOfUnitsElem.value != "")) {
                            
                    alert("Please only enter either the NUMBER OF UNITS or the PERCENTAGE or the RAND VALUE for any particular fund");
					
				} else {
					showLayer("step4");
					window.parent.window.scrollTo(0, 0);
				}
			} else if (currentLayer == "step4") {
				var regWithFlexiblePercentageElem = document.getElementById("regWithFlexiblePercentage");
    			var regWithFlexibleRandValueElem = document.getElementById("regWithFlexibleRandValue");
    			
    			var regWithBalancedPercentageElem = document.getElementById("regWithBalancedPercentage");
    			var regWithBalancedRandValueElem = document.getElementById("regWithBalancedRandValue");
    			
    			var regWithEquityPercentageElem = document.getElementById("regWithEquityPercentage");
    			var regWithEquityRandValueElem = document.getElementById("regWithEquityRandValue");
    			
    			var regWithConservativePercentageElem = document.getElementById("regWithConservativePercentage");
    			var regWithConservativeRandValueElem = document.getElementById("regWithConservativeRandValue");
    			
    			var regWithInternationalPercentageElem = document.getElementById("regWithInternationalPercentage");
    			var regWithInternationalRandValueElem = document.getElementById("regWithInternationalRandValue");
    			
    			var regWithGefPercentageElem = document.getElementById("regWithGefPercentage");
    			var regWithGefRandValueElem = document.getElementById("regWithGefRandValue");
    			
	    		if (document.getElementById("changeRegWith").checked
	    				&& regWithFlexiblePercentageElem.value == "" &&      regWithFlexibleRandValueElem.value == "" 
	    				&& regWithBalancedPercentageElem.value == "" &&      regWithBalancedRandValueElem.value == ""
	    				&& regWithEquityPercentageElem.value == "" &&        regWithEquityRandValueElem.value == ""
	    				&& regWithConservativePercentageElem.value == "" &&  regWithConservativeRandValueElem.value == ""
	    				&& regWithInternationalPercentageElem.value == "" && regWithInternationalRandValueElem.value == ""
	    			    && regWithGefPercentageElem.value == "" && 			 regWithGefRandValueElem.value == "") {
	    					
	    			alert("Please fill in at least the PERCENTAGE or RAND VALUE that you wish to withdraw regularly for at least one of the funds");
	    			
	    		} else {
	    			showLayer("step5");
	    			window.parent.window.scrollTo(0, 0);
	    		}
			} else {
			    document.getElementById("generateFormInput").disabled = true;
			    document.getElementById("generateFormInput").className = "compileFormDisabled";
			    
    			showLayer("step6");
    			window.parent.window.scrollTo(0, 0);
    			form.submit();
    		}
		},
		rules: {
			naturalPersonNameSurname: {
				required: {
					depends: function(element) {
						return document.getElementById("naturalPerson").checked && currentLayer == "step2";
	         		}
	       		}
			},
			naturalPersonTelephoneNumber: {
				required: {
					depends: function(element) {
						return document.getElementById("naturalPerson").checked && currentLayer == "step2";
	         		}
	       		}
			},
			naturalPersonEmailAddress: {
				required: {
					depends: function(element) {
						return document.getElementById("naturalPerson").checked && currentLayer == "step2";
	         		}
	       		},
	       		email: true
			},
			legalEntityName: {
				required: {
					depends: function(element) {
						return document.getElementById("legalEntity").checked && currentLayer == "step2";
	         		}
	       		}
			},
			legalEntityClientNumber: {
				required: {
					depends: function(element) {
						return document.getElementById("legalEntity").checked && currentLayer == "step2";
	         		}
	       		}
			},
			legalEntityTelephoneNumber: {
				required: {
					depends: function(element) {
						return document.getElementById("legalEntity").checked && currentLayer == "step2";
	         		}
	       		}
			},
			legalEntityContactEmailAddress: {
                required: {
                    depends: function(element) {
                        return document.getElementById("legalEntity").checked && currentLayer == "step2";
                    }
                },
                email: true
            },
			changeBankDetailsAccountHolderNames: {
				required: {
					depends: function(element) {
						return document.getElementById("changeBankDetails").checked && currentLayer == "step4";
	         		}
	       		}
			},
			changeBankDetailsBank: {
				required: {
					depends: function(element) {
						return document.getElementById("changeBankDetails").checked && currentLayer == "step4";
	         		}
	       		}
			},
			changeBankDetailsBranch: {
				required: {
					depends: function(element) {
						return document.getElementById("changeBankDetails").checked && currentLayer == "step4";
	         		}
	       		}
			},
			changeBankDetailsBranchCode: {
				required: {
					depends: function(element) {
						return document.getElementById("changeBankDetails").checked && currentLayer == "step4";
	         		}
	       		}
			},
			changeBankDetailsAccountNumber: {
				required: {
					depends: function(element) {
						return document.getElementById("changeBankDetails").checked && currentLayer == "step4";
	         		}
	       		}
			},
			regWithMonthlyDaySelect: {
				required: {
					depends: function(element) {
						return document.getElementById("changeRegWith").checked && currentLayer == "step4" && document.getElementById("monthlyWithdrawal").checked;
	         		}
	       		}
			},
			regWithQuarterlyMonthSelect: {
				required: {
					depends: function(element) {
						return document.getElementById("changeRegWith").checked && currentLayer == "step4" && document.getElementById("quarterlyWithdrawal").checked;
	         		}
	       		}
			},
			regWithQuarterlyDaySelect: {
				required: {
					depends: function(element) {
						return document.getElementById("changeRegWith").checked && currentLayer == "step4" && document.getElementById("quarterlyWithdrawal").checked;
	         		}
	       		}
			},
			balancedDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == ""
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
							&& document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			},
			flexibleDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == "" 
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
						    && document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			},
			equityDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == "" 
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
						    && document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			},
			conservativeDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == "" 
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
							&& document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			},
			internationalDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == "" 
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
							&& document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			},
			gefDebitOrderAmount: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("debitOrderDetailsChange").checked 
							&& document.getElementById("balancedDebitOrderAmount").value == "" 
							&& document.getElementById("flexibleDebitOrderAmount").value == ""
							&& document.getElementById("equityDebitOrderAmount").value == "" 
							&& document.getElementById("conservativeDebitOrderAmount").value == ""
							&& document.getElementById("internationalDebitOrderAmount").value == ""
							&& document.getElementById("gefDebitOrderAmount").value == "";
	         		}
	       		}
			}
		},
		messages: {
		     balancedDebitOrderAmount: "Please enter a value for at least one fund",
		     flexibleDebitOrderAmount: "Please enter a value for at least one fund",
		     equityDebitOrderAmount: "Please enter a value for at least one fund",
		     conservativeDebitOrderAmount: "Please enter a value for at least one fund",
		     internationalDebitOrderAmount: "Please enter a value for at least one fund",
		     gefDebitOrderAmount: "Please enter a value for at least one fund"
		}
	});
});