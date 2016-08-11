$(document).ready(function() {
	populateSelects();
	
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
	
	$("#topupForm").validate({
		submitHandler: function(form) {
		    if (currentLayer == "step1") {
		        showLayer("step2");
		        window.parent.window.scrollTo(0, 0);
		        
		    } else if (currentLayer == "step2") {
                showLayer("step3");
                window.parent.window.scrollTo(0, 0);
                
			} else if (currentLayer =="step3") {
			    var invDetFlexibleLumpSumElem = document.getElementById("invDetFlexibleLumpSum");
                var invDetFlexibleMonthlyAmountElem = document.getElementById("invDetFlexibleMonthlyAmount");
                
                var invDetBalancedLumpSumElem = document.getElementById("invDetBalancedLumpSum");
                var invDetBalancedMonthlyAmountElem = document.getElementById("invDetBalancedMonthlyAmount");
                
                var invDetEquityLumpSumElem = document.getElementById("invDetEquityLumpSum");
                var invDetEquityMonthlyAmountElem = document.getElementById("invDetEquityMonthlyAmount");
                
                var invDetConservativeLumpSumElem = document.getElementById("invDetConservativeLumpSum");
                var invDetConservativeMonthlyAmountElem = document.getElementById("invDetConservativeMonthlyAmount");
                
                if (invDetFlexibleLumpSumElem.value == "" && invDetFlexibleMonthlyAmountElem.value == ""
                      && invDetBalancedLumpSumElem.value == "" && invDetBalancedMonthlyAmountElem.value == ""
                      && invDetEquityLumpSumElem.value == "" && invDetEquityMonthlyAmountElem.value == ""
                      && invDetConservativeLumpSumElem.value == "" && invDetConservativeMonthlyAmountElem.value == "") {
                    alert("Please enter at least a LUMP SUM or MONTHLY amount for at least one fund");
                    
                } else {
				    showLayer("step4");
				    window.parent.window.scrollTo(0, 0);
				}
			} else if (currentLayer == "step4") {
				if (!document.getElementById("paymentMethodMonthlyDebitOrder").checked && !document.getElementById("paymentMethodEft").checked && !document.getElementById("paymentMethodChequeDeposit").checked) {
		    		alert("Please select at least one PAYMENT METHOD");
		    		
		    	} else if (!document.getElementById("sourceInvestmentFundsSavings").checked && !document.getElementById("sourceInvestmentFundsBonus").checked
                           && !document.getElementById("sourceInvestmentFundsInheritance").checked && !document.getElementById("sourceInvestmentFundsOther").checked) {
                    alert("Please select at least one SOURCE OF INVESTMENT FUNDS");
                    
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
            monthlyDebitOrderDay: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            monthlyDebitOrderCommencementMonth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            sourceInvestmentFundsOtherDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("sourceInvestmentFundsOther").checked;
                    }
                }
            }
		}
	});
});