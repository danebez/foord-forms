$(document).ready(function() {
	
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
    
    $("img.joint").qtip({
        content: "Select this option to enter investor details for 2 or 3 joint investors",
        show: "mouseover",
        hide: "mouseout"
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
    
	$("#internationalTopupForm").validate({
		submitHandler: function(form) {
			if (currentLayer == "step1") {
                showLayer("step2");
                
            } else if (currentLayer == "step2") {
                showLayer("step3");
                
			} else if (currentLayer =="step3") {
			    if (document.getElementById("investmentLumpsum").value == "" && document.getElementById("investmentNumberOfUnits").value == "") {
                    alert("Please enter a value for LUMP SUM or NUMBER OF UNITS");
                    
                } else if (document.getElementById("investmentLumpsum").value != "" && document.getElementById("investmentNumberOfUnits").value != "") {
                	alert("Please enter a value for LUMP SUM or NUMBER OF UNITS");
                	
                } else {
                    showLayer("step4");
                }
			    
		    } else if (currentLayer == "step4") {
	            showLayer("step5");
		        
    		} else {
    		    document.getElementById("generateFormInput").disabled = true;
                document.getElementById("generateFormInput").className = "compileFormDisabled";
                
                showLayer("step6");
                form.submit();
    		}
		},
		rules: {
		    investorName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2";
                    }
                }
            },
            investorIdIncorporationNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2";
                    }
                }
            },
            investorTelephoneNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2";
                    }
                }
            },
            investorEmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2";
                    }
                },
                email: true
            },
            paymentMethodChequeAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodCheque").checked;
                    }
                }
            },
            paymentMethodEftCurrencyUsdAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyUsd").checked;
                    }
                }
            },
            paymentMethodEftCurrencyEurAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyEur").checked;
                    }
                }
            },
            paymentMethodEftCurrencyGbpAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyGbp").checked;
                    }
                }
            },
            paymentMethodEftHolderName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodEft").checked;
                    }
                }
            }
		}
	});
});